package com.kh.finalProject.member.model.vo;

import java.time.LocalDate;

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
public class Member {
	private String memId;
	private String memPwd;
	private String memName;
	private String memBirth;
	private LocalDate memCreate;
	private String memTel;
	private String memAddr;
	private String memEmail;
	private String memStatus;
	private LocalDate memDeldate;
	private int admin;
}
