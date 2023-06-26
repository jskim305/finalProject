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
	private int iNo;
	private String iName;
	private int iPrice;
	private String iContent;
	private String iLocal;
	private int iCount;
	private int iPac;
	private String dName;
}
