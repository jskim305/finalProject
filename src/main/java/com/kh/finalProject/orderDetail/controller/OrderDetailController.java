package com.kh.finalProject.orderDetail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.orderDetail.model.service.OrderDetailService;

@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController {

	@Autowired
	private OrderDetailService orderDetailService;
}
