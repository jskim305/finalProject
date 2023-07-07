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

	private int rezNo;
	private String memId;
	private int farmNo;
	private String rezZone;
	private int rezStatus;
	private int rezStart;
	private int rezPrice;
	private String rezItem;
}
