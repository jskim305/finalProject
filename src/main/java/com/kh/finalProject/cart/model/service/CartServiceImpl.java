package com.kh.finalProject.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.finalProject.cart.model.dao.CartDao;
import com.kh.finalProject.cart.model.vo.Cart;
import com.kh.finalProject.cart.model.vo.CartList;
import com.kh.finalProject.item.model.vo.Item;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;

	@Override
	public int insertCart(Cart cart) {
		return cartDao.insertCart(cart);
	}
	/*장바구니 불러오기*/
	@Override
	public List<CartList> cartItemList(String memId) {
		return cartDao.cartItemList(memId);
	}
	@Override
	public List<CartList> cartPacList(String memId) {
		return cartDao.cartPacList(memId);
	}
	
	
	/*장바구니 비우기*/
	@Override
	public void deleteCart(int cartNo) {
		 cartDao.deleteCart(cartNo);
	}
	/*장바구니 전체 비우기*/
	@Override
	public void allDeleteCart(String memId) {
		cartDao.allDeleteCart(memId);
		
	}
	@Override
	public int updateCart(Cart cart) {
		return cartDao.updateCart(cart);
	}
	/* 장바구니 항목별 각각의 합계 ----*/
	@Override
	public int sumMoney(String memId) {
		return cartDao.sumMoney(memId);
	}
	@Override
	public int sumpacMoney(String memId) {
		return cartDao.sumpacMoney(memId);
	}
	@Override
	public int sumitemMoney(String memId) {
		return cartDao.sumitemMoney(memId);
	}
	/*-------------------------------- */

	
	@Override
	public Cart getCartItem(Cart cart) {
		return cartDao.getCartItem(cart);
	}
	@Override
	public int updateCartQuantity(Cart existingCart) {
		return cartDao.updateCartQuantity(existingCart);
	}
	@Override
	public CartList getItemData(int itemNo) {
		return cartDao.getItemData(itemNo);
	}
	@Override
	public List<CartList> payment(String cartNo) {
		return cartDao.payment(cartNo);
	}
}
