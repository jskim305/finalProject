package com.kh.finalProject.item.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalProject.item.model.service.ItemService;
import com.kh.finalProject.item.model.vo.Item;


@Controller
@RequestMapping("/item")

public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@GetMapping("/paclist.bo")
	public String paclist(Model model) {
		List<Item> paclist = itemService.selectPacList();
		System.out.println("paclist =" + paclist);
		model.addAttribute("paclist", paclist );
		return "/item/packageList";
	}
	
	@GetMapping("pacForm.bo")
	public String pacForm(@RequestParam int INo, Model model) {
		Item pacForm = itemService.selectOnePac(INo);
		model.addAttribute("pacForm", pacForm);
		return "/item/package";
	}

	@GetMapping("/itemlist.bo")
	public String itemlist(Model model) {
		System.out.println("itemlist =" + model);
		List<Item> itemlist = itemService.selectitemList();
		System.out.println("itemlist =" + itemlist);
		model.addAttribute("itemlist", itemlist);
		return "/item/itemList";
	}

	@GetMapping("itemForm.bo")
	public String itemForm(@RequestParam int INo, Model model) {
		Item itemForm = itemService.selectOneitem(INo);
		model.addAttribute("itemForm", itemForm);
		return "/item/item";
	}
	//카테고리 값 자동입력 테스트
	@RequestMapping("/findItems.bo")
    public String findItems(@RequestParam("category") String category, Model model) {
		List<Item> itemlist = itemService.findItemsByCategory(category);
		model.addAttribute("itemlist", itemlist);
        return "/item/itemList";
	}
	//리스트 글쓰기
	@GetMapping("insertList.bo")
	public String insertList() {
	    return "/item/itemForm";
	}
	
	@PostMapping("/insertItem.bo")
	public String insertItem(Item item, RedirectAttributes redirectAttr) {
		int result = itemService.insertItem(item);
		redirectAttr.addFlashAttribute("msg", "정상적으로 저장했습니다.");
		return "redirect:/item/itemlist.bo";
	}
	
	@PostMapping("/deleteItem.bo")
	public String deleteItem(int itemNo, RedirectAttributes redirectAttr) {
	    itemService.deleteItem(itemNo);
	    redirectAttr.addFlashAttribute("msg", "정상적으로 삭제했습니다.");
	    return "redirect:/item/itemlist.bo";
	}

}