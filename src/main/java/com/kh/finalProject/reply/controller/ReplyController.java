package com.kh.finalProject.reply.controller;

import com.kh.finalProject.reply.model.service.ReplyService;
import com.kh.finalProject.reply.model.vo.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reply")
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    // 댓글 생성
    @PostMapping("/create")
    public String createReply(Reply reply) {
    	System.out.println(reply);
        try {
            int result = replyService.createReply(reply);
            return "success";
            
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
            
            
        }
    }

	/*
	 * // 댓글 목록 조회
	 * @GetMapping("/list")
	 * 
	 * public List<Reply> getReplyList(@RequestParam("boardNo") int boardNo) { try {
	 * return replyService.getReplyList(boardNo); } catch (Exception e) {
	 * e.printStackTrace(); return null; } }
	 */

    // 댓글 수정
    // TODO: 필요한 경우 수정 로직을 추가하십시오.

    // 댓글 삭제
    // TODO: 필요한 경우 삭제 로직을 추가하십시오.
}