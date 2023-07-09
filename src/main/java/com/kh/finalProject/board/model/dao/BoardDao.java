package com.kh.finalProject.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.finalProject.board.model.vo.Board;

@Mapper
public interface BoardDao {

	int selectTotalRecord();

	List<Board> selectBoardList(RowBounds rowBounds);

	int insertBoard(Board board);

	Board selectOneBoard(int boardNo);

	int updateCountBoard(int boardNo);

	int deleteOneBoard(int boardNo);

	/* Object updateOneBoard(Board board); */
	int updateOneBoard(Board board);
	

}
