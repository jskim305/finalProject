package com.kh.finalProject.reply.model.vo;

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
public class Reply {
	private int rNo;
	private int bNo;
	private String rWriter;
	private String rContent;
	private Date rCreate;
}
