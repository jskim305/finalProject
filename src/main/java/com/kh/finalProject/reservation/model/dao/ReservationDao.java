package com.kh.finalProject.reservation.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.reservation.model.vo.Reservation;

@Mapper
public interface ReservationDao {

	//예약-------------------------------------------------------
	int insertReservation(Reservation reservation); //예약 insert, 기존 sector status update
	void updateSectorStatus(Reservation reservation); 
	
	//관리자페이지--------------------------------------------------
	List<Reservation> getadminRezList(); // 예약 List
	void adminRezDelete(String rezNo); // 예약 delete
	void adminRezDeleteForUpdate(String rezNo); // delete시에 기존 sector값 초기화
	int adminRezUpdate(Reservation reservation); // 예약 update

}
