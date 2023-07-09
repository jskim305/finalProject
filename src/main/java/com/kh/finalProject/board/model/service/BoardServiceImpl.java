package com.kh.finalProject.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.board.model.dao.BoardDao;
import com.kh.finalProject.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int selectTotalRecord() {
		return boardDao.selectTotalRecord();
	}

	@Override
	public List<Board> selectBoardList(RowBounds rowBounds) {
		return boardDao.selectBoardList(rowBounds);
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

	
}







