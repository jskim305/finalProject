package com.kh.finalProject.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.reply.model.service.ReplyService;
import com.kh.finalProject.reply.model.vo.Reply;

@Controller
@RequestMapping("/reply")
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    // 댓글 생성
    @GetMapping("/create")
    public String createReply(Reply reply, Model model) {
    	System.out.println("reply : " + reply);
        int result = replyService.createReply(reply);
        System.out.println("result : " + result);
        
        List<Reply> list = replyService.selectReplyList(reply.getBoardNo());
        model.addAttribute("replyList", list);
        return "jsonView";
    }

	@PostMapping("/replyUpdate")
	public String updateBoard(Reply reply, Model model) {
		int result = replyService.updateOneReply(reply);
		List<Reply> list = replyService.selectReplyList(reply.getBoardNo());
        model.addAttribute("replyList", list);
		return "jsonView";
	}

	@PostMapping("/replyDelete")
	public String deleteBoard(Reply reply, Model model) {
		int result = replyService.deleteOneReply(reply);
		List<Reply> list = replyService.selectReplyList(reply.getBoardNo());
        model.addAttribute("replyList", list);
		return "jsonView";
	}

}