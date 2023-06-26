package com.kh.finalProject.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.reservation.model.dao.ReservationDao;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
}
