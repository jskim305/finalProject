package com.kh.finalProject.reservation.model.service;

import java.util.List;

import com.kh.finalProject.reservation.model.vo.Reservation;

public interface ReservationService {

	
	int insertReservation(Reservation reservation);

	List<Reservation> getadminRezList(); // 관리자 예약 조회

	void adminRezDelete(String rezNo); // 관리자 예약 삭제

	int adminRezUpdate(Reservation reservation); // 관리자 예약 변경
	
	
}