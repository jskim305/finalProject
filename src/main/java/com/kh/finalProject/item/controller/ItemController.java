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
	
	//패키지 리스트 페이지
	@GetMapping("/paclist.bo")
	public String paclist(Model model) {
		List<Item> paclist = itemService.selectPacList();
		
		model.addAttribute("paclist", paclist);
		return "/item/packageList";
	}
	//패키지 상품 페이지
	@GetMapping("pacForm.bo")
	public String pacForm(@RequestParam int itemNo, Model model) {
		Item pacForm = itemService.selectOnePac(itemNo);
		List<Item> paclist = itemService.selectPacList();
		model.addAttribute("paclist", paclist);
		model.addAttribute("pacForm", pacForm);
		return "/item/package";
	}

	@GetMapping("/itemlist.bo")
	public String itemlist(Model model) {
		List<Item> itemlist = itemService.selectitemList();
		model.addAttribute("itemlist", itemlist);
		return "/item/itemList";
	}

	@GetMapping("itemForm.bo")
	public String itemForm(@RequestParam int itemNo, Model model) {
		Item itemForm = itemService.selectOneitem(itemNo);
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
	public String insertList(String itemType, Model model) {
		System.out.println("ItemType ="+ itemType);
		model.addAttribute("ItemType", itemType);
	    return "/item/itemForm";
	}
	
	@PostMapping("/insertItem.bo")
	public String insertItem(String ItemType,Item item, RedirectAttributes redirectAttr) {
		if(ItemType.equals("item")) {
			int result = itemService.insertItem(item);
		}if(ItemType.equals("package")) {
			int result = itemService.insertPac(item);
		}
		
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