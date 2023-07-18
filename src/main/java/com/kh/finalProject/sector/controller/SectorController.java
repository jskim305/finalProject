package com.kh.finalProject.sector.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalProject.sector.model.service.SectorService;
import com.kh.finalProject.sector.model.vo.Sector;

@Controller
@RequestMapping("/sector")
public class SectorController {

	@Autowired
	private SectorService sectorService;
	
	
	@GetMapping("/sectorRez2.my")
	public void sectorRez2(){}
	
	@GetMapping("/list")//섹터현황조회
	public String sectorList(Model model) {
		List<Sector> list = sectorService.getSectors();
		model.addAttribute("list",list);
		System.out.println(list);
		return "jsonView";
	}
	 @PostMapping("/radioRez.my")
	    public String radioRez(String radio, Model model, RedirectAttributes redirectAttr) {		 
	     Sector sector = sectorService.radioRez(radio);
	     model.addAttribute("radio", sector);
	     System.out.println(sector.getSectorName());
	     System.out.println(radio);
	     redirectAttr.addFlashAttribute("msg",sector.getSectorName()+"인 것을 확인하세요^ㅡ^");	    
	        return "/reservation/reserForm";
	    }
	

}