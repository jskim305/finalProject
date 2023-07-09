package com.kh.finalProject.farm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.finalProject.farm.model.service.FarmService;
import com.kh.finalProject.farm.model.vo.Farm;

@Controller
@SessionAttributes({"selectedFarm"})
@RequestMapping("/farm")
public class FarmController {
	@Autowired
	private FarmService farmService;
	
	@RequestMapping("/indexFarm.do")
	public void resFarm() {}
	
	
	@GetMapping("/farmInfo") // JSON 형식
	public String farmInfo(@RequestParam int farmNo, Model model) {
	  // farmService.selectFarmById() 메소드를 호출하여 farmId에 해당하는 농장 정보를 불러옵니다.
	  Farm selectedFarm = farmService.selectFarmById(farmNo);
	  System.out.println(farmNo);
	  System.out.println(selectedFarm);
	  
	  model.addAttribute("selectedFarm", selectedFarm);
	  
//	  return null;
	  return "jsonView";
	}
	
	/*
	 * @PostMapping("/farmCheck.do") public String farmCheck(SECTOR sector,)
	 */
	
}
