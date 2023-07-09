package com.kh.finalProject.orderDetail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.member.model.vo.Member;
import com.kh.finalProject.orderDetail.model.service.OrderDetailService;
import com.kh.finalProject.orderDetail.model.vo.OrderDetail;

@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController {

	@Autowired
	private OrderDetailService orderDetailService;

	// ---------------------------관리자페이지-----------------------------------
//	전체주문상품조회
	@GetMapping("/adminOrderList.my")
	public String adminOrderList(Model model) {
		List<OrderDetail> adminOrderList = orderDetailService.getOrderDetails();
		model.addAttribute("adminOrderList", adminOrderList);
		return "jsonView";
	}
// 주문상품삭제
  @PostMapping("/adminOrderDelete.my")
    public String adminOrderDelete(@RequestParam("detailNo") String detailNo, Model model) {
        orderDetailService.adminOrderDelete(detailNo);
        return "jsonView";
    }
// 주문상품수정
  @PostMapping("/adminOrderUpdate.my")
  	public String adminOrderUpdate(OrderDetail orderDetail, Model model) {
	  int result = orderDetailService.adminOrderUpdate(orderDetail);
	  return "jsonView";
  }
  	
  	
  	
  	
//---------------------------관리자페이지-----------------------------------	

}
