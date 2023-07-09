package com.kh.finalProject.member.model.dao;

import java.util.List;

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
	
//관리자부분----------------
	List<Member> selectMembers();
	
	void deleteMember(String memId);
	
	int adminMemberUpdate(Member member);
	
//관리자 end----------------	

}
