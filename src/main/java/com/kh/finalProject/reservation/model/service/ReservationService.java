package com.kh.finalProject.reservation.model.service;

import java.util.List;

import com.kh.finalProject.reservation.model.vo.Reservation;

public interface ReservationService {

		
	//예약시 기존 섹터 status변경
	int insertReservation(Reservation reservation);
	
	//관리자 예약 -------------------------------------------------
	List<Reservation> getadminRezList(); // List
	void adminRezDelete(String rezNo); // delete
	int adminRezUpdate(Reservation reservation); // update
	
	
	
	
	
	
	
	
	
	
	
	
}
