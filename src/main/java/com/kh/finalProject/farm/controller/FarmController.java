package com.kh.finalProject.farm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.farm.model.service.FarmService;
import com.kh.finalProject.farm.model.vo.Farm;

@Controller
@RequestMapping("/farm")
public class FarmController {
	@Autowired
	private FarmService farmService;
	
	@RequestMapping("/indexFarm.do")
	public void resFarm() {}
	
	@RequestMapping("/gunpo.go")
	public void gunpoFarm() {}
	
	
	//작물선택,지역선택,설명----------------------------------
	@ResponseBody
	@GetMapping("/farmInfo") // JSON 형식 farmId에 해당하는 농장 정보
	public Farm farmInfo(@RequestParam int farmId, Model model) {
	    Farm selectedFarm = farmService.selectFarmById(farmId);
	    System.out.println(farmId);
	    return selectedFarm;
	}	
	@PostMapping("/hopeItem.go")//작물세션값	
    public String userHopeItem(HttpServletRequest request) {
		String hItem1 = request.getParameter("hItem1");
		String hItem2 = request.getParameter("hItem2");
		
		HttpSession session = request.getSession();
		session.setAttribute("hItem1", hItem1);
		session.setAttribute("hItem2", hItem2);
		return  "redirect:/sector/sectorRez2.my";
    }

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
