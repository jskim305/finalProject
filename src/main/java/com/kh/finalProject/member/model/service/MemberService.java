package com.kh.finalProject.member.model.service;

import com.kh.finalProject.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member seletOneMember(String mId);

}
