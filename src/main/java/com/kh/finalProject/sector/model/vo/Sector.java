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
	private String sectorNo;
	private int farmNo;
	private String sectorName;
	private int sectorPrice;
	private String sectorItem;
	private int sectorSchdule;
	private int sectorStatus;
}