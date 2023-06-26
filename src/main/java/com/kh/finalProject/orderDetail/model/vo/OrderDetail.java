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
	private int odNo;
	private String oNo;
	private int iNo;
	private int odPrice;
	private int odCount;
}
