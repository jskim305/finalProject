package com.kh.finalProject.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalProject.cart.model.service.CartService;
import com.kh.finalProject.cart.model.vo.Cart;
import com.kh.finalProject.cart.model.vo.CartList;
import com.kh.finalProject.member.model.vo.Member;



@Controller
@RequestMapping("/cart")
public class CartController {

   @Autowired
   private CartService cartService;

   /*상품 장바구니 insert*/
   @PostMapping("/insertCart.ca") 
      public String insertCart(Cart cart,RedirectAttributes redirectAttr) {
         int result = cartService.insertCart(cart);
         redirectAttr.addFlashAttribute("msg", "정상적으로 저장했습니다.");
         return "redirect:/item/itemlist.bo";
      }
   /*Pac 장바구니 insert*/
   @PostMapping("/insertPacCart.ca") 
      public String insertPacCart(Cart cart,RedirectAttributes redirectAttr) {
         int result = cartService.insertCart(cart);
         redirectAttr.addFlashAttribute("msg", "정상적으로 저장했습니다.");
         return "redirect:/item//paclist.bo";
      }
   
   @GetMapping("/myCart.ca")
      public String mycartList(@RequestParam String memId, Model model) {
         List<CartList> cartList = cartService.mycartList(memId);
         model.addAttribute("cartList", cartList);
         return "/cart/mycartList";
      }
   
   @PostMapping("deleteCart.ca")
   public String deleteCart(int cartNo,String memId, RedirectAttributes redirectAttr) {
       cartService.deleteCart(cartNo);
       redirectAttr.addFlashAttribute("msg", "정상적으로 삭제했습니다.");
       return "redirect:/cart/myCart.ca?memId=" + memId;
   }

}
