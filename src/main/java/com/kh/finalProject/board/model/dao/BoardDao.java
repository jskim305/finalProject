package com.kh.finalProject.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.reply.model.vo.Reply;

@Mapper

public interface BoardDao {

	int selectTotalRecord();
	
	List<Board> selectBoardList(@Param("rowBounds")RowBounds rowBounds,@Param("tag") String tag);
	List<Board> selectGongjiList(@Param("rowBounds")RowBounds rowBounds,@Param("tag") String tag);
	
	int insertBoard(Board board);

	Board selectOneBoard(int boardNo);

	int updateCountBoard(int boardNo);

	int deleteOneBoard(int boardNo);

	/* Object updateOneBoard(Board board); */
	int updateOneBoard(Board board);

	List<Reply> selectReplyList(int boardNo);
    //댓글 리스트 얻어오기	

	
	/*
	 * int selectBoardRecord(String tagName);
	 */

	
	
	
	
	
	
   

}
