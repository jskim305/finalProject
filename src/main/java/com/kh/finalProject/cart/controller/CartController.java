package com.kh.finalProject.cart.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalProject.cart.model.service.CartService;
import com.kh.finalProject.cart.model.vo.Cart;
import com.kh.finalProject.cart.model.vo.CartList;
import com.kh.finalProject.member.model.vo.Member;

@Controller
@RequestMapping("/cart")
@SessionAttributes({"paymentList"})
public class CartController {

	@Autowired
	private CartService cartService;

	/*상품 장바구니 insert*/
	@PostMapping("/insertCart.ca") 
	public String insertCart(Cart cart, RedirectAttributes redirectAttr) {
		/* 상품상세페이지로 돌아가기 위한 itemNo */
		int itemNo = cart.getItemNo(); 
	    System.out.println("Cart = " + cart);
	    System.out.println("itemNo = " + itemNo);
	    
	    /* item 재고량과 장바구니량을 비교, pac에서 온 데이터인지 구분하기위한 서블릿 */
	    CartList itemData = cartService.getItemData(itemNo);
	    System.out.println("itemData = " + itemData);
	    int itemCount = itemData.getItemCount();
	    	
	    
	    Cart existingCart = cartService.getCartItem(cart);
	    System.out.println("existingCart = " + existingCart);
	    
	    int existingCartCount = (existingCart != null) ? existingCart.getCartCount() : 0;
	    int leftovers = itemCount - existingCartCount - cart.getCartCount();
	    System.out.println("leftovers = " + leftovers);
	    
	    
	    if (leftovers < 0) {
	        redirectAttr.addFlashAttribute("msg", "재고량보다 장바구니의 수량이 많습니다.");
	    } else {
	        if (existingCart != null) {
	            // 이미 장바구니에 있는 경우, 수량을 더해줌
	            existingCart.setCartCount(existingCartCount + cart.getCartCount());
	            int result = cartService.updateCartQuantity(existingCart);
	            if (result > 0) {
	                redirectAttr.addFlashAttribute("msg", "장바구니에 수량이 업데이트되었습니다.");
	            } else {
	                redirectAttr.addFlashAttribute("msg", "장바구니 수량 업데이트에 실패했습니다.");
	            }
	        } else {
	            // 장바구니에 없는 경우, 새로 추가
	            int result = cartService.insertCart(cart);
	            if (result > 0) {
	                redirectAttr.addFlashAttribute("msg", "정상적으로 저장했습니다.");
	            } else {
	                redirectAttr.addFlashAttribute("msg", "장바구니에 담기에 실패했습니다.");
	            }
	        }
	    }
	    if(itemData.getItemPac() == 0) {
		    return "redirect:/item/itemlist.bo";
	    } else {
		    return "redirect:/item/pacItem.bo?itemNo=" + itemNo;
	    }  
	}
	
	@GetMapping("/myCart.ca")
		public String mycartList(@RequestParam String memId, Model model) {
		
			List<CartList> cartItemList = cartService.cartItemList(memId);
			List<CartList> cartPacList = cartService.cartPacList(memId);
			int sumMoney = cartService.sumMoney(memId);
			int sumpacMoney = cartService.sumpacMoney(memId);
			int sumitemMoney = cartService.sumitemMoney(memId);

			model.addAttribute("cartItemList", cartItemList);
			model.addAttribute("cartPacList", cartPacList);
			model.addAttribute("sumMoney", sumMoney);
			model.addAttribute("sumpacMoney", sumpacMoney);
			model.addAttribute("sumitemMoney", sumitemMoney);
			return "/cart/mycartList";
		}
	
	@PostMapping("deleteCart.ca")
	public String deleteCart(int cartNo,String memId, RedirectAttributes redirectAttr) {
	    cartService.deleteCart(cartNo);
	    redirectAttr.addFlashAttribute("msg", "정상적으로 삭제했습니다.");
	    return "redirect:/cart/myCart.ca?memId=" + memId;
	}

	@PostMapping("allDeleteCart.ca")
		public String allDeleteCart(String memId, RedirectAttributes redirectAttr) {
			cartService.allDeleteCart(memId);
			redirectAttr.addFlashAttribute("msg", "정상적으로 삭제했습니다.");
			return "redirect:/cart/myCart.ca?memId=" + memId;
		}
	@PostMapping("updateCart.ca")
		public String updateCart(String memId,Cart cart) {
		System.out.println(memId);
		System.out.println(cart);
	
		int result = cartService.updateCart(cart);
		return "redirect:/cart/myCart.ca?memId=" + memId;
		}
	
	@PostMapping("ordersForm")
	public String payment(@RequestParam("cartNos") List<String> cartNos, Model model) {
		System.out.println("cartNos = " + cartNos);
		
		List<CartList> paymentList = new ArrayList<CartList>();
		
		for (String cartNo : cartNos) {
		    List<CartList> payment = cartService.payment(cartNo);
		    paymentList.addAll(payment);
		}
		
		model.addAttribute("paymentList", paymentList);
		
		System.out.println("paymentList = " + paymentList);
		
		return "redirect:/orders/ordersForm.or"; // 주문 화면으로 이동
	}
}