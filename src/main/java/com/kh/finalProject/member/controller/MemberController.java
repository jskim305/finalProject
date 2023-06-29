package com.kh.finalProject.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("/memberEnroll.me")
	public void memberEnroll() {}
	
	@GetMapping("/loginMember.me")
	public void loginMember() {}
	
	@PostMapping("/memberEnroll.me")
	public String memberEnroll(Member member) {
		// 비밀번호 암호화 과정
		String rawPwd = member.getMPwd();
		String encodedPwd = passwordEncoder.encode(rawPwd);
		member.setMPwd(encodedPwd);
		
		int result = memberService.insertMember(member);
		
		return "redirect:/";
	}
	
	@PostMapping("/loginMember.me")
	public String loginMember(String mId, String mPwd, Model model, RedirectAttributes redirectAttr) {
		// 입력된 id로 member table에서 select
		Member member = memberService.seletOneMember(mId);
		
		// 가져온 member에 대한 인증
		if(member.getMId() != null) {
			// 비밀번호가 입력된 경우
			if(member.getMPwd() != null) {
				// 입력된 비밀번호를 암호화된 비밀번호와 비교 인증
				if(passwordEncoder.matches(mPwd, member.getMPwd())) {
					model.addAttribute("loginMember", member);	
					redirectAttr.addFlashAttribute("msg", member.getMId() +"님 환영합니다.");	
				}
				else {
					redirectAttr.addFlashAttribute("msg", "비밀번호가 맞지 않습니다.");
				}
			} 
			else {// 비밀번호가 입력되지 않은 경우
				redirectAttr.addFlashAttribute("msg", "비밀번호가 입력되지 않았습니다.");
			}
		}	
		else {// 가입되있지 않은 id인 경우
			redirectAttr.addFlashAttribute("msg", "아이디가 맞지 않습니다.");
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/memberLogout.me")
	public String memberLogout(SessionStatus status) {
		if(!status.isComplete())
			status.setComplete();
			
		return "redirect:/";
	}
}
