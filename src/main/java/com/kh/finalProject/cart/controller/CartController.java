package com.kh.finalProject.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.cart.model.service.CartService;


@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
}
