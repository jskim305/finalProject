package com.kh.finalProject.orders.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Orders {
	private int ordersNo;
	private String memId;
	//총 결제금액
	private int ordersPrice;
	private Date ordersDate;
	private String ordersName;
	private String ordersAddr;
	private int ordersTel;
	private String ordersReq;
	// 총 물품의 갯수
	private int ordersCount;
	
}