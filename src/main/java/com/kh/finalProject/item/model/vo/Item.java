package com.kh.finalProject.item.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	private int itemNo;
	private String itemSector;
	private String itemName;
	private int itemPrice;
	private String itemContent;
	private String itemLocal;
	private int itemCount;
	private int itemPac;
	private String itemLogo;
}
