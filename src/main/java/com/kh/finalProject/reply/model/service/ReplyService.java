package com.kh.finalProject.reply.model.service;

import java.util.List;

import com.kh.finalProject.reply.model.vo.Reply;

public interface ReplyService {
	
	int createReply(Reply reply);
	
	List<Reply> selectReplyList(int boardNo); 

	List<Reply> getReplyList(int boardNo);

	int updateReply(Reply reply);

	int deleteReply(int replyNo);

	int updateOneReply(Reply reply);

	int deleteOneReply(Reply reply);
	
	 
}
