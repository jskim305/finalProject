package com.kh.finalProject.cart.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.cart.model.vo.Cart;
import com.kh.finalProject.cart.model.vo.CartList;
import com.kh.finalProject.item.model.vo.Item;

@Mapper
public interface CartDao {

	int insertCart(Cart cart);

	List<CartList> mycartList(String memId);

	void deleteCart(int cartNo);

}
