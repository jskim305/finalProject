package com.kh.finalProject.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.reservation.model.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("/indexFarm.do")
	public void resFarm() {
		
	}
}
