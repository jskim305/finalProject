package com.kh.finalProject.farm.model.vo;

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
public class Farm {
	private int farmNo;
	private String farmName;
	private String farmZone;
	private int farmCount;
	private String farmContent;
	private String farmItem;
}
