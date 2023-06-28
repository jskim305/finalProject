package com.kh.finalProject.member.model.vo;

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
public class Member {
	private String mId;
	private String mPwd;
	private String mName;
	private String mBirth;
	private Date mCreate;
	private String mTel;
	private String mAddr;
	private String mEmail;
	private String mStatus;
	private int admin;
}
