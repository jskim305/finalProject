package com.kh.finalProject.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.member.model.dao.MemberDao;
import com.kh.finalProject.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public Member seletOneMember(String mId) {
		return memberDao.selectOneMember(mId);
	}

	@Override
	public int checkPwd(String mPwd) {
		return memberDao.checkPwd(mPwd);
	}

	@Override
	public int changePwd(String id, String pwd) {
		return memberDao.changePwd(id, pwd);
	}

	@Override
	public int editMyPage(Member member) {
		return memberDao.editMyPage(member);
	}

	@Override
	public int delMem(String memId) {
		return memberDao.delMem(memId);
	}
}
