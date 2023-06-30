package com.kh.finalProject.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.finalProject.member.model.vo.Member;

@Mapper
public interface MemberDao {

	int insertMember(Member member);

	Member selectOneMember(String mId);

	List<Member> selectadminList();

}
