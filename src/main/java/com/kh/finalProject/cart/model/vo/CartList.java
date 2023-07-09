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
	private int cartCount;
	private int cartPrice;
	private String itemSector;
	private String itemName;
	private int itemPrice;
	private String itemContent;
	private String itemLocal;
	private int itemCount;
	private int itemPac;
	private String itemLogo;
}
