package com.kh.finalProject.order.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private String oNo;
	private String mId;
	private int oPrice;
	private Date oDate;
	private String oPosition;
	private String oName;
	private int zipcode;
	private String oAddr;
	private String oDetail;
	private int oTel;
	private String oReq;
	private int oCount;
}
