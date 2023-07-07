package com.kh.finalProject.orderDetail.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {
	private int detailNo;
	private int ordersNo;
	private int itemNo;
	private int detailPrice;
	private int detailCount;
	private String itemName;
}
