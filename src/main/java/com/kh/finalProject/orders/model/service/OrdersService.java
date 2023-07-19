package com.kh.finalProject.orders.model.service;

import com.kh.finalProject.orders.model.vo.Orders;

public interface OrdersService {

	int insertOrders(Orders orders);

	int currSeq(Orders orders);


}
