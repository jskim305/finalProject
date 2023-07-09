package com.kh.finalProject.reply.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.reply.model.dao.ReplyDao;
import com.kh.finalProject.reply.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDao replyDao; 
	
	@Override
	public int createReply(Reply reply) {
		return replyDao.createReply(reply);
	}
}
