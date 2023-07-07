package com.kh.finalProject.member.model.service;

import com.kh.finalProject.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member seletOneMember(String mId);
	
	int checkPwd(String mPwd);

	int changePwd(String id, String pwd);

	int editMyPage(Member member);

	int delMem(String memId);

}
