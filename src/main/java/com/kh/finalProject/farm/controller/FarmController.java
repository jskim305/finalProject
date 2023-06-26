package com.kh.finalProject.farm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.farm.model.service.FarmService;

@Controller
@RequestMapping("/farm")
public class FarmController {

	@Autowired
	private FarmService farmService;
}
