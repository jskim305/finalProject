package com.kh.finalProject.member.model.service;

import java.util.List;

import com.kh.finalProject.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member seletOneMember(String mId);
	
	int checkPwd(String mPwd);

	int changePwd(String id, String pwd);

	int editMyPage(Member member);

	int delMem(String memId);
	
//관리자------------
	List<Member> getMembers(); // 관리자 회원전체조회

	void deleteMember(String memId); // 관리자 회원삭제

	int adminMemberUpdate(Member member); // 관리자 회원수정
//관리자------------

}
