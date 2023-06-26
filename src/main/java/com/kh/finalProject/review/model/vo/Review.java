package com.kh.finalProject.review.model.vo;

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
public class Review {
	private int rNo;
	private int iNo;
	private String rWriter;
	private String rContent;
	private Date rCreate;
}
