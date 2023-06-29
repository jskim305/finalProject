package com.kh.finalProject.board.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.board.model.service.BoardService;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
//	@Autowired
//	private ServletContext application;
	
	@GetMapping("/boardList.bo")
	   public void boardList(@RequestParam(defaultValue="1") int nowPage, Model model) {
	      int totalRecord = boardService.selectTotalRecord();
	      int limit = 10;
	      int offset = (nowPage - 1) * limit; 
	      RowBounds rowBounds = new RowBounds(offset, limit);
	      
	      PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);
	      
	      List<Board> boardList = boardService.selectBoardList(rowBounds);
	      model.addAttribute("boardList", boardList);
	      model.addAttribute("pi", pi);
	   }
	
	@GetMapping("/boardForm.bo")
	   public void boardForm() {}
	   
	@GetMapping("/boardList.do")
	   public void boardList() {}
	
	   @PostMapping("/boardEnroll.bo")
	   public String boardEnroll(Board board) {System.out.println(board);
		   int result = boardService.insertBoard(board);
		      return "redirect:/board/boardList.bo";
	   }
	   
	   @GetMapping("/boardDetail.bo")
	   public void boardDetail(@RequestParam int bNo, Model model) {
	     int result = boardService.updateCountBoard(bNo);
	     
	      Board board = boardService.selectOneBoard(bNo);
	      
	      model.addAttribute("board", board);
	   }
	

}