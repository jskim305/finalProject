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

	@Override
	public int insertReservation(Reservation reservation) {
		return reservationDao.insertReservation(reservation);
	}

	@Override
	public List<Reservation> getadminRezList() { // 관리자 예약 조회
		return reservationDao.getadminRezList();
	}

	@Override
	public void adminRezDelete(String rezNo) { // 관리자 예약 삭제
		reservationDao.adminRezDelete(rezNo);
	}

	@Override
	public int adminRezUpdate(Reservation reservation) {// 관리자 예약 변경
		return reservationDao.adminRezUpdate(reservation);
	}

}