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

    @GetMapping("/boardList.bo")
    public String boardList(@RequestParam(defaultValue = "1") int nowPage, Model model) {
        int totalRecord = boardService.selectTotalRecord();
        int limit = 10;
        int offset = (nowPage - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);

        PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);

        List<Board> boardList = boardService.selectBoardList(rowBounds);
        model.addAttribute("boardList", boardList);
        model.addAttribute("pi", pi);

        return "board/boardList"; // 게시글 목록을 보여주는 JSP 페이지 경로
    }

    @GetMapping("/boardForm.bo")
    public String boardForm() {
        return "board/boardForm"; // 게시글 작성 폼을 보여주는 JSP 페이지 경로
    }

    @PostMapping("/boardEnroll.bo")
    public String boardEnroll(Board board) {
        int result = boardService.insertBoard(board);
        return "redirect:/board/boardList.bo"; // 게시글 등록 후 목록 페이지로 리다이렉트
    }

    @GetMapping("/boardDetail.bo")
    public String boardDetail(@RequestParam int boardNo, Model model) {
        int result = boardService.updateCountBoard(boardNo);
        Board board = boardService.selectOneBoard(boardNo);
        model.addAttribute("board", board);
        return "board/boardDetail"; // 게시글 상세 페이지를 보여주는 JSP 페이지 경로
    }
}
