package com.kh.finalProject.sector.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.sector.model.service.SectorService;

@Controller
@RequestMapping("/sector")
public class SectorController {

	@Autowired
	private SectorService sectorService;
}
