package com.kh.finalProject.reservation.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.reservation.model.vo.Reservation;

@Mapper
public interface ReservationDao {

	int insertReservation(Reservation reservation);

	List<Reservation> getadminRezList(); // 관리자 예약 현황

	void adminRezDelete(String rezNo); // 관리자 예약 삭제

	int adminRezUpdate(Reservation reservation); // 관리자 예약 변경

}
