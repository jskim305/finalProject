package com.kh.finalProject.reply.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.reply.model.vo.Reply;

@Mapper
public interface ReplyDao {

	int createReply(Reply reply);
	
	List<Reply> selectReplyList(int boardNo);

	List<Reply> getReplyList(int boardNo);

	int updateReply(Reply reply);

	int deleteReply(int replyNo);

	int updateOneReply(Reply reply);

	int deleteOneReply(Reply reply);

	
}
