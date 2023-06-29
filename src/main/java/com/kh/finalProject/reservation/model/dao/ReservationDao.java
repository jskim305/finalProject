package com.kh.finalProject.reservation.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.reservation.model.vo.Reservation;

@Mapper
public interface ReservationDao {

	int insertReservation(Reservation reservation);

}
