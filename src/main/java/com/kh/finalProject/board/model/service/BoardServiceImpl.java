package com.kh.finalProject.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.board.model.dao.BoardDao;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.reply.model.vo.Reply;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int selectTotalRecord() {
		return boardDao.selectTotalRecord();
	}

	@Override
	public List<Board> selectBoardList(RowBounds rowBounds, String tag) {
		return boardDao.selectBoardList(rowBounds,tag);
	}
	@Override
	public List<Board> selectGongjiList(RowBounds rowBounds, String tag) {
		return boardDao.selectGongjiList(rowBounds,tag);
	}

	@Override
	public int insertBoard(Board board) {
		return boardDao.insertBoard(board);
	}
	@Override
	public Board selectOneBoard(int boardNo) {
		return boardDao.selectOneBoard(boardNo);
	}

	@Override
	public int updateCountBoard(int boardNo) {
		return boardDao.updateCountBoard(boardNo);
	}

	@Override
	public int deleteOneBoard(int boardNo) {
		return boardDao.deleteOneBoard(boardNo);
		
		
	}

	@Override
	public int updateOneBoard(Board board) {
		return boardDao.updateOneBoard(board);
		
	}

	@Override
	public List<Reply> selectReplyList(int boardNo) {	
		return boardDao.selectReplyList(boardNo);
	}

	/*
	 * @Override public int selectGongjiRecord(String tag) { // TODO Auto-generated
	 * method stub return 0; }
	 * 
	 * @Override public int selectBoardRecord(String tag) { // TODO Auto-generated
	 * method stub return 0; }
	 */


	
}







