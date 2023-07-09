package com.kh.finalProject.cart.model.service;

import java.util.List;

import com.kh.finalProject.cart.model.vo.Cart;
import com.kh.finalProject.cart.model.vo.CartList;
import com.kh.finalProject.item.model.vo.Item;

public interface CartService {


	int insertCart(Cart cart);

	List<CartList> mycartList(String memId);

	void deleteCart(int cartNo);

}
