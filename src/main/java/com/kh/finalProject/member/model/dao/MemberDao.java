package com.kh.finalProject.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.finalProject.member.model.vo.Member;

@Mapper
public interface MemberDao {

	int insertMember(Member member);

	Member selectOneMember(String mId);

	int checkPwd(String mPwd);

	int changePwd(@Param("id") String id, @Param("pwd") String pwd);

	int editMyPage(Member member);

	int delMem(String memId);

}
