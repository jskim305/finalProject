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
	private int bNo;
	private String bWriter;
	private String bTag;
	private String bTitle;
	private String bContent;
	private Date bCreate;
	private int bCount;
}
