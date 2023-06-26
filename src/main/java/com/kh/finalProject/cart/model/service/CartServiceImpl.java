package com.kh.finalProject.cart.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.cart.model.dao.CartDao;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao; 
}
