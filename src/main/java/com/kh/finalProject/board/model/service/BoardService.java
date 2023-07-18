package com.kh.finalProject.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;


import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.reply.model.vo.Reply;

public interface BoardService {

	int selectTotalRecord();

	List<Board> selectBoardList(RowBounds rowBounds, String tag);
	List<Board> selectGongjiList(RowBounds rowBounds, String tag);

	int insertBoard(Board board);

	int updateCountBoard(int boardNo);

	Board selectOneBoard(int boardNo);

	int deleteOneBoard(int boardNo);

	int updateOneBoard(Board board);

	List<Reply> selectReplyList(int boardNo);




}
