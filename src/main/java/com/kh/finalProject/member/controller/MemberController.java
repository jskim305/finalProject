package com.kh.finalProject.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.finalProject.member.model.service.MemberService;
import com.kh.finalProject.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})	// 로그인한 유저의 데이터를 sessionScope로 변경
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;	// 비밀번호를 암호화
	
	@PostMapping("/memberEnroll.me")
	public String memberEnroll(Member member) {
		// 비밀번호 암호화 과정
		String rawPwd = member.getMPwd();
		String encodedPwd = passwordEncoder.encode(rawPwd);
		member.setMPwd(encodedPwd);
		
		int result = memberService.insertMember(member);
		
		return "redirect:/";
	}
	
	
}
