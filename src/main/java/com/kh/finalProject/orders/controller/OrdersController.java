package com.kh.finalProject.orders.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	@GetMapping("/ordersMoney.or")
	public void ordersMoney() {}
	
	@PostMapping("/ordersPayment.or")
	public String payment(Orders orders, Model model) {
		System.out.println(orders);
		
		int result = ordersService.insertOrders(orders);
		
		model.addAttribute("orders", orders);
		
		// 결제가 만들어지면 결제창으로 넘기는 return이 필요함
		return "redirect:/orders/ordersMoney.or";
	}
	
}
