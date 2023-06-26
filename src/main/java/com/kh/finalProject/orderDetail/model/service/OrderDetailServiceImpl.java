package com.kh.finalProject.orderDetail.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.orderDetail.model.dao.OrderDetailDao;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{
	
	@Autowired
	private OrderDetailDao orderDetailDao;
}
