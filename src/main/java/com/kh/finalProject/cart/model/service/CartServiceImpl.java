package com.kh.finalProject.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public List<CartList> mycartList(String memId) {
		return cartDao.mycartList(memId);
	}

	@Override
	public void deleteCart(int cartNo) {
		 cartDao.deleteCart(cartNo);
		
	}


}