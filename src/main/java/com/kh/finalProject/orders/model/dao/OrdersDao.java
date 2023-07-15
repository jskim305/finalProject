package com.kh.finalProject.orders.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.orders.model.vo.Orders;

@Mapper
public interface OrdersDao {

	int insertOrders(Orders orders);


}
