package com.kh.finalProject.orders.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.orders.model.dao.OrdersDao;
import com.kh.finalProject.orders.model.vo.Orders;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	private OrdersDao ordersDao;

	@Override
	public int insertOrders(Orders orders) {
		return ordersDao.insertOrders(orders);
	}


}
