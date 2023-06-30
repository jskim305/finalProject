package com.kh.finalProject.sector.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.reservation.model.service.ReservationService;
import com.kh.finalProject.sector.model.service.SectorService;
import com.kh.finalProject.sector.model.vo.Sector;

@Controller
@RequestMapping("/sector")
public class SectorController {

	@Autowired
	private SectorService sectorService;
	
	
	
	
	
	
	
}
