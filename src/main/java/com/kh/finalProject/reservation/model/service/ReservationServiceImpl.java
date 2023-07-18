package com.kh.finalProject.reservation.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.reservation.model.dao.ReservationDao;
import com.kh.finalProject.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	
	
	//예약페이지-------------------------------------------------------------
	@Override
	public int insertReservation(Reservation reservation) {// 예약 insert, 기존 sector status update 
		int i = reservationDao.insertReservation(reservation);
				reservationDao.updateSectorStatus(reservation);
		return i;
	}
	//관리자페이지------------------------------------------------------------
	@Override
	public List<Reservation> getadminRezList() { // 예약 select
		return reservationDao.getadminRezList();
	}
	@Override
	public void adminRezDelete(String rezNo) { // 예약삭제 delete
			reservationDao.adminRezDelete(rezNo);
			reservationDao.adminRezDeleteForUpdate(rezNo);
			
	}
	@Override
	public int adminRezUpdate(Reservation reservation) {// 예약변경 update
		return reservationDao.adminRezUpdate(reservation);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
