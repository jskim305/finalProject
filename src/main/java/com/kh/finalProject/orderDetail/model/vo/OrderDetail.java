package com.kh.finalProject.orderDetail.model.vo;

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
public class OrderDetail {
	private int detailNo;
	private int ordersNo;
	private int itemNo;
	private int detailPrice;
	private int detailCount;
	private String itemName;
	private String detailSituation;
	private String memId;
	private String memName;
}
