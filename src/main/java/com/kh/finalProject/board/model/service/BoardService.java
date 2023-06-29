package com.kh.finalProject.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.finalProject.board.model.vo.Board;

public interface BoardService {

	int selectTotalRecord();

	List<Board> selectBoardList(RowBounds rowBounds);

	int insertBoard(Board board);

	int updateCountBoard(int bNo);

	Board selectOneBoard(int bNo);

	List<Board> getBoardList();

	

	

}
