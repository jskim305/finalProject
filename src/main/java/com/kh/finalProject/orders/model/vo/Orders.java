package com.kh.finalProject.orders.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Orders {
	private String ordersNo;
	private String memId;
	private int ordersPrice;
	private Date ordersDate;
	private String ordersPosition;
	private String ordersName;
	private int zipcode;
	private String ordersAddr;
	private String ordersDetail;
	private int ordersTel;
	private String ordersReq;
	private int ordersCount;
}
