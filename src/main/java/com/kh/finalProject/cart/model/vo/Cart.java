package com.kh.finalProject.cart.model.vo;

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
public class Cart {
	private int cNo;
	private String mId;
	private int iNo;
	private int cCount;
	private int cPrice;
}
