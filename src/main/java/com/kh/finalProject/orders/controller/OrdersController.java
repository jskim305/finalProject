package com.kh.finalProject.orders.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.cart.model.vo.CartList;
import com.kh.finalProject.orderDetail.model.vo.OrderDetail;
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
		ordersService.insertOrders(orders);
		int result = ordersService.currSeq(orders);
		
		System.out.println("result : " + result);
		model.addAttribute("orders", orders);
		model.addAttribute("result", result);

		return "orders/ordersMoney";
	}
}
