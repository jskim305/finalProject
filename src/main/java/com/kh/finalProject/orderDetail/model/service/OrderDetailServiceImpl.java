package com.kh.finalProject.orderDetail.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.orderDetail.model.dao.OrderDetailDao;
import com.kh.finalProject.orderDetail.model.vo.OrderDetail;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{
	
	@Autowired
	private OrderDetailDao orderDetailDao;
	
//관리자--------------------
	@Override //관리자주문전체조회
	public List<OrderDetail> getOrderDetails() {
		return orderDetailDao.adminSelectOrder();
	}
	@Override //관리자주문삭제
	public void adminOrderDelete(String detailNo) {
		orderDetailDao.adminOrderDelete(detailNo);
	}
	@Override
	public int adminOrderUpdate(OrderDetail orderDetail) {
		return orderDetailDao.adminOrderUpdate(orderDetail);
	}
	@Override
	public int orderDetailInsert(OrderDetail orderDetail) {
		return orderDetailDao.orderDetailInsert(orderDetail);
	}

	
	
//관리자 end--------------------

}