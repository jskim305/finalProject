package com.kh.finalProject.orders.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.orders.model.service.OrdersService;
import com.kh.finalProject.orders.model.vo.Orders;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersService ordersService;
	
	@GetMapping("/ordersForm.or")
	public void ordersForm() {}
	
	
	@PostMapping("/ordersPayment.or")
	public String payment(Orders orders) {
		System.out.println(orders);
		
		int result = ordersService.insertOrders(orders);
		
		// 결제가 만들어지면 결제창으로 넘기는 return이 필요함
		return "redirect:/";
	}
	
}
