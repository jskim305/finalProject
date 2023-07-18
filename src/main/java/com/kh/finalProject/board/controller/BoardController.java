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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalProject.board.model.service.BoardService;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;
import com.kh.finalProject.reply.model.vo.Reply;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/boardList.bo")
	public void boardList(@RequestParam(defaultValue = "1") int nowPage, String tag, Model model) {
		// 게시글 전체 개수 조회
		int totalRecord = boardService.selectTotalRecord();

		int limit = 10; // 한 페이지에 보여줄 게시글 수
		int offset = (nowPage - 1) * limit; // 조회 시작 위치

		RowBounds rowBounds = new RowBounds(offset, limit); // 조회할 범위를 지정하기 위한 RowBounds 객체 생성

		// 페이지 정보 계산을 위한 Pagination 유틸리티 클래스의 getPageInfo() 메서드 호출
		PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);

		// 게시글 목록 조회
		List<Board> boardList = boardService.selectBoardList(rowBounds, tag);

		// 모델에 게시글 목록과 페이지 정보를 담아서 전달
		model.addAttribute("boardList", boardList);
		model.addAttribute("pi", pi);
	}
	@GetMapping("/boardForm.bo")
	public String boardForm(String tag, Model model) {
		model.addAttribute("tag", tag);
		return "/board/boardForm";
	}
	/*글쓰기 폼-----*/
	@PostMapping("/boardEnroll.bo")
	public String boardEnroll(Board board) {
		System.out.println("Board =" + board);
		// 게시글 등록
		String tag = board.getBoardTag();
		int result = boardService.insertBoard(board);
		System.out.println("결과 : " + result);

		// 게시글 목록 페이지로 리다이렉트
		
		if(tag.equals("공지사항")) {
			return "redirect:/board/gongjiList.bo";
		}else {
			return "redirect:/board/boardList.bo";
		}

	}

	@GetMapping("/vegFarm.bo")
	public String vegFarm() {
		return "common/vegFarm";
	}

	@GetMapping("/gongjiList.bo")
	public void gongjiList(@RequestParam(defaultValue = "1") int nowPage, String tag, Model model) {
		// 게시글 전체 개수 조회
		int totalRecord = boardService.selectTotalRecord();

		int limit = 10; // 한 페이지에 보여줄 게시글 수
		int offset = (nowPage - 1) * limit; // 조회 시작 위치

		RowBounds rowBounds = new RowBounds(offset, limit); // 조회할 범위를 지정하기 위한 RowBounds 객체 생성

		// 페이지 정보 계산을 위한 Pagination 유틸리티 클래스의 getPageInfo() 메서드 호출
		PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);

		// 게시글 목록 조회
		List<Board> GongjiList = boardService.selectGongjiList(rowBounds, tag);

		// 모델에 게시글 목록과 페이지 정보를 담아서 전달
		model.addAttribute("GongjiList", GongjiList);
		model.addAttribute("pi", pi);
	}

	@GetMapping("/boardDetail.bo")
	public void boardDetail(@RequestParam int boardNo, Model model) {
		// 게시글의 조회수 증가
		int result = boardService.updateCountBoard(boardNo);

		// 게시글 상세 정보 조회
		Board board = boardService.selectOneBoard(boardNo);
		// 댓글조회
		// ArrayList로 boardNo에 해당하는 댓글 모두 조회하여
		List<Reply> list = boardService.selectReplyList(boardNo);

		// 모델에 게시글 정보를 담아서 전달
		model.addAttribute("board", board);
		model.addAttribute("replyList", list);
	}

	@GetMapping("/delete")
	public String deleteBoard(@RequestParam int boardNo) {
		// 게시글 삭제 처리
		boardService.deleteOneBoard(boardNo);
		// 삭제 후, 어떤 페이지로 이동할지 리다이렉트 경로를 반환
		return "redirect:/board/boardList.bo";
	}

	@GetMapping("/update")
	public String updateBoard(@RequestParam int boardNo, Model model) {
		model.addAttribute("board", boardService.selectOneBoard(boardNo));
		return "board/boardUpdate";
	}

	
	// 수정 : 작성자와 로그인유저가 같은지 확인하여 같으면 수정하기가 진행될 수 있도록 변경함
	@PostMapping("/boardUpdate.bo")
	public String updateBoard(Board board,String userId, Model model, RedirectAttributes redirectAttr) {
		String tag = board.getBoardTag();
		String writer = board.getBoardWriter();
		String memId = userId;
		int boardNo = board.getBoardNo();

		if(memId.equals(writer) || memId.equals("admin")) {	// 게시글 작성자와 수정하려는 사람의 id가 같은지 확인하는 부분
			int result = boardService.updateOneBoard(board);
			// 둘의 아이디가 동일하면 게시글을 수정하고
			if(result > 0) { // 수정이 잘 진행되었다면 tag를 확인함
				if(tag.equals("공지사항"))	// tag가 공지사항이면 공지리스트로
					return "redirect:/board/gongjiList.bo";
				else	// tag가 문의이면 문의게시판 리스트로 
					return "redirect:/board/boardList.bo";
			}

			else	// 게시글 수정이 제대로 되지 않은 경우
				redirectAttr.addFlashAttribute("msg","글이 수정되지 않았습니다.");
		}
		
		else	//게시글 작성자와 수정하려는 아이디가 같지 않은 경우
			redirectAttr.addFlashAttribute("msg","작성한 글이 아니므로 수정할 수 없습니다.");
		
		// 게시글 작성자와 수정하려는 사람의 아이디가 같지 않은 경우
		return "redirect:/board/boardDetail.bo?boardNo="+boardNo;
	}

}
