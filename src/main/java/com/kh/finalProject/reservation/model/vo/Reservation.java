package com.kh.finalProject.reservation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {

	private int rNo;
	private String mId;
	private int fNo;
	private String rZone;
	private int rStatus;
	private int rStart;
	private int rPrice;
	private String rItem;
}
