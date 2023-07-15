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
public class CartList {
	private int cartNo;
	private String memId;
	private int itemNo;
	// 하나의 아이템에 대한 갯수
	private int cartCount;
	private String itemSector;
	private String itemName;
	// 각각의 아이템 가격
	private int itemPrice;
	private String itemContent;
	private String itemLocal;
	// 재고 수량
	private int itemCount;
	private int itemPac;
	private String itemLogo;
}
