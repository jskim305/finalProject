package com.kh.finalProject.orderDetail.model.service;

import java.util.List;

import com.kh.finalProject.orderDetail.model.vo.OrderDetail;

public interface OrderDetailService {

	 List<OrderDetail> getOrderDetails(); //관리자주문전체조회

	void adminOrderDelete(String detailNo); //관리자주문삭제

	int adminOrderUpdate(OrderDetail orderDetail);

	int orderDetailInsert(OrderDetail orderDetail);
	

}