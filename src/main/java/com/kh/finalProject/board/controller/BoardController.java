package com.kh.finalProject.board.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kh.finalProject.board.model.service.BoardService;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	/**
	 * 게시글 목록을 조회하는 메소드입니다.
	 * 요청 시 현재 페이지 번호를 받아와서 해당 페이지에 해당하는 게시글 목록을 조회합니다.
	 *
	 * @param nowPage 현재 페이지 번호
	 * @param model   Model 객체
	 */
	@GetMapping("/boardList.bo")
	public void boardList(@RequestParam(defaultValue="1") int nowPage, Model model) {
		// 게시글 전체 개수 조회
		int totalRecord = boardService.selectTotalRecord();
		
		int limit = 10; // 한 페이지에 보여줄 게시글 수
		int offset = (nowPage - 1) * limit; // 조회 시작 위치
		
		RowBounds rowBounds = new RowBounds(offset, limit); // 조회할 범위를 지정하기 위한 RowBounds 객체 생성
		
		// 페이지 정보 계산을 위한 Pagination 유틸리티 클래스의 getPageInfo() 메서드 호출
		PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);
		
		// 게시글 목록 조회
		List<Board> boardList = boardService.selectBoardList(rowBounds);
		
		// 모델에 게시글 목록과 페이지 정보를 담아서 전달
		model.addAttribute("boardList", boardList);
		model.addAttribute("pi", pi);
	}
	
	/**
	 * 게시글 작성 폼으로 이동하는 메소드입니다.
	 * GET 방식으로 접근하며, 폼 페이지를 응답합니다.
	 */
	@GetMapping("/boardForm.bo")
	public void boardForm() {}
	

	   
	/**
	 * 게시글 목록을 조회하는 메소드입니다.
	 * GET 방식으로 접근하며, 목록 페이지를 응답합니다.
	 */
	@GetMapping("/boardList.do")
	public void boardList() {}
	
	/**
	 * 게시글을 등록하는 메소드입니다.
	 * POST 방식으로 접근하며, 요청으로부터 받은 게시글 정보를 이용하여 게시글을 등록합니다.
	 *
	 * @param board 게시글 정보
	 * @return 게시글 목록 페이지로의 리다이렉트 경로
	 */
	@PostMapping("/boardEnroll.bo")
	public String boardEnroll(Board board) {
		System.out.println(board);
		// 게시글 등록
		int result = boardService.insertBoard(board);
		System.out.println("결과 : " + result);
		// 게시글 목록 페이지로 리다이렉트
		return "redirect:/board/boardList.bo";
	}
	   
	/**
	 * 게시글 상세 정보를 조회하는 메소드입니다.
	 * GET 방식으로 접근하며, 요청으로부터 받은 게시글 번호를 이용하여 해당 게시글의 상세 정보를 조회합니다.
	 * 조회수도 증가시킵니다.
	 *
	 * @param bNo   조회할 게시글 번호
	 * @param model Model 객체
	 */
	@GetMapping("/boardDetail.bo")
	public void boardDetail(@RequestParam int boardNo, Model model) {
		// 게시글의 조회수 증가
		int result = boardService.updateCountBoard(boardNo);
		
		// 게시글 상세 정보 조회
		Board board = boardService.selectOneBoard(boardNo);
		
		// 모델에 게시글 정보를 담아서 전달
		model.addAttribute("board", board);
		
		
	}
	
	@GetMapping("/delete")
	public String deleteBoard(@RequestParam int boardNo) {
	    // 게시글 삭제 처리 (서비스와 DAO 레이어에서 구현)
	    boardService.deleteOneBoard(boardNo);
	    // 삭제 후, 어떤 페이지로 이동할지 리다이렉트 경로를 반환
	    return "redirect:/board/boardList.bo"; // 삭제 후 게시글 목록 페이지로 리다이렉트
	  }

	
	@GetMapping("/update")  //get은 업데이트 페이지로 보내는것, post는 수정을 완료하고 리스트로 보내는것 
	public String updateBoard(@RequestParam int boardNo , Model model) {		
		 model.addAttribute("board",boardService.selectOneBoard(boardNo));
	
	    /*boardService.updateOneBoard(board);*/
	    
	    // 수정 후, 어떤 페이지로 이동할지 리다이렉트 경로를 반환
	    return "board/boardUpdate";
	  }
	
	@PostMapping("/boardUpdate.bo")  //get은 업데이트 페이지로 보내는것, post는 수정을 완료하고 리스트로 보내는것 
	public String updateBoard(Board board, Model model) {
		model.addAttribute("board", boardService.updateOneBoard(board));

	   return "redirect:/board/boardList.bo";
	
	
   }
}

