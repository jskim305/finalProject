package com.kh.finalProject.reply.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.reply.model.dao.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDao replyDao; 
}
