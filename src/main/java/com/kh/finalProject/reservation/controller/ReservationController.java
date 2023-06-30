package com.kh.finalProject.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.finalProject.reservation.model.service.ReservationService;
import com.kh.finalProject.reservation.model.vo.Reservation;
import com.kh.finalProject.sector.model.vo.Sector;

@Controller
@RequestMapping("/reservation")
@SessionAttributes({""})

public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	

	
	@RequestMapping("/indexFarm.do")
	   public void resFarm() {}
	
	@RequestMapping("/reserInsert.do")
	   public void reserForm() {}
	
	@RequestMapping("/reserForm.do")
		public void reservationForm(){}
	
	@PostMapping("/reserInsert.do")  // 예약페이지 인설트 
	public String reserInsert(Reservation reservation) {
		int result = reservationService.insertReservation(reservation);
		return "/reservation/resermoney";
	}
	
	
	
	
}
