package com.kh.finalProject.orderDetail.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.orderDetail.model.vo.OrderDetail;

@Mapper
public interface OrderDetailDao {

//관리자부분----------------
	List<OrderDetail> adminSelectOrder(); // 주문전체조회

	int adminOrderDelete(String detailNo);// 주문삭제

	int adminOrderUpdate(OrderDetail orderDetail);
	
//관리자 end----------------

	
}
