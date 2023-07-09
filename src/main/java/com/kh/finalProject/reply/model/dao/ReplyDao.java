package com.kh.finalProject.reply.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.reply.model.vo.Reply;

@Mapper
public interface ReplyDao {

	int createReply(Reply reply);
}
