package com.kh.finalProject.sector.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.reservation.model.vo.Reservation;
import com.kh.finalProject.sector.model.vo.Sector;

@Mapper
public interface SectorDao {

	List<Sector> getSectors();

	Sector radioRez(String radio);
	




}
