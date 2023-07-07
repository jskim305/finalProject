package com.kh.finalProject.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {
	private int boardNo;
	private String boardWriter;
	private String boardTag;
	private String boardTitle;
	private String boardContent;
	private Date boardCreate;
	private int boardCount;
}
