package com.kh.finalProject.orders.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectKey;

import com.kh.finalProject.orders.model.vo.Orders;

@Mapper
public interface OrdersDao {
	/*
	 * @SelectKey(statement="SELECT seq_orders.currval FROM dual", keyProperty =
	 * "ordersNo", before = false, resultType = int.class)
	 */
	int insertOrders(Orders orders);

	int currSeq(Orders orders);


}
