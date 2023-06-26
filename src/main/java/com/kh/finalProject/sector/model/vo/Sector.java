package com.kh.finalProject.sector.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Sector {
	private String sNo;
	private int fNo;
	private String sName;
	private int sPrice;
	private String sItem;
	private int sSchdule;
	private int sStatus;
}