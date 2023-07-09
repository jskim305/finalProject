package com.kh.finalProject.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String reserInsert(Reservation reservation, RedirectAttributes redirectAttr ) {
		int result = reservationService.insertReservation(reservation);
		redirectAttr.addFlashAttribute("msg","수정완료");
		return "/reservation/resermoney";
	}

	@GetMapping("/adminRezList.my")
	public String adminRezList(Model model) {
		List<Reservation> adminRezList = reservationService.getadminRezList();
		model.addAttribute("adminRezList", adminRezList);
		return "jsonView";
	}
	
	@PostMapping("/adminRezDelete.my")
	public String adminRezDelete(@RequestParam("rezNo") String rezNo, Model model) {
		reservationService.adminRezDelete(rezNo);
		return "jsonView";
	}
	
	@PostMapping("/adminRezUpdate.my")
	public String adminRezUpdate(Reservation reservation, Model model) {
		int result = reservationService.adminRezUpdate(reservation);
		return "jsonView";
	}

	
}
