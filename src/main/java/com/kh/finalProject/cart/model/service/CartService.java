package com.kh.finalProject.cart.model.service;

import java.util.List;

import org.springframework.ui.Model;

import com.kh.finalProject.cart.model.vo.Cart;
import com.kh.finalProject.cart.model.vo.CartList;


public interface CartService {
	
	/*리턴 값만 다르기 때문에 */
	int insertCart(Cart cart);

	List<CartList> cartItemList(String memId);
	List<CartList> cartPacList(String memId);

	void deleteCart(int cartNo);

	void allDeleteCart(String memId);

	int updateCart(Cart cart);

	/* 장바구니 항목별 각각의 합계 ----*/
	int sumMoney(String memId);
	int sumpacMoney(String memId);
	int sumitemMoney(String memId);
	/*-------------------------------- */
	

	Cart getCartItem(Cart cart);

	int updateCartQuantity(Cart existingCart);

	CartList getItemData(int itemNo);
	
	/*결제 데이터 가져오기*/
	List<CartList> payment(String cartNo);



}