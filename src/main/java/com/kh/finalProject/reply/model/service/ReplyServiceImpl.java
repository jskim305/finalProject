package com.kh.finalProject.reply.model.service;

import java.util.List;

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

	@Override
	public List<Reply> selectReplyList(int boardNo) {
	    return replyDao.selectReplyList(boardNo);
	}
	
	@Override
	public List<Reply>getReplyList(int boardNo) {
		return replyDao.getReplyList(boardNo);
	}

	@Override
	public int updateReply(Reply reply) {
		return replyDao.updateReply(reply);
	}

	@Override
	public int deleteReply(int replyNo) {
		return replyDao.deleteReply(replyNo);
	}

	@Override
	public int updateOneReply(Reply reply) {
		return replyDao.updateOneReply(reply);
	}

	@Override
	public int deleteOneReply(Reply reply) {
		return replyDao.deleteOneReply(reply);
	}


}
