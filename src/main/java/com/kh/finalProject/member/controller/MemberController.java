package com.kh.finalProject.member.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	/*--------------------------------------------------*/
	@GetMapping("/memberEnroll.me")
	public void memberEnroll() {}
	
	@GetMapping("/loginMember.me")
	public void loginMember() {}
	
	@GetMapping("/adminAll.me")
	public void adminAll() {}
	
	@GetMapping("/checkPwd.me")
	public void checkPwd() {}
	
	@GetMapping("/memberAll.me")
	public void memberAll() {}
	
	@GetMapping("/changePwd.me")
	public void changePwd() {}
	
	@GetMapping("delMem.me")
	public void delMem() {}
	
	@RequestMapping("/adminList.me")
	public void adminLis() {}
	
	/*--------------------------------------------------*/	
	@PostMapping("/memberEnroll.me")
	public String memberEnroll(Member member) {
		// 비밀번호 암호화 과정
		String rawPwd = member.getMemPwd();
		String encodedPwd = passwordEncoder.encode(rawPwd);
		member.setMemPwd(encodedPwd);
		
		int result = memberService.insertMember(member);
		
		return "redirect:/";
	}
	
	@PostMapping("/loginMember.me")
	public String loginMember(String memId, String memPwd, Model model, RedirectAttributes redirectAttr) {
		// 입력된 id로 member table에서 select
		Member member = memberService.seletOneMember(memId);
		
		if(member == null) {
			redirectAttr.addFlashAttribute("msg", "없는 ID 입니다.");
			return "redirect:/member/loginMember.me";
		}
		
		// 가져온 member에 대한 인증
		if(member.getMemId() != null) {
			// 비밀번호가 입력된 경우
			if(member.getMemPwd() != null) {
				// 입력된 비밀번호를 암호화된 비밀번호와 비교 인증
				if(passwordEncoder.matches(memPwd, member.getMemPwd())) {
					model.addAttribute("loginMember", member);	
					redirectAttr.addFlashAttribute("msg", member.getMemId() +"님 환영합니다.");	
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
	public static String memberLogout(SessionStatus status) {
		if(!status.isComplete())
			status.setComplete();
		
		return "redirect:/";
	}
	
	@PostMapping("/checkPwd.me")
	public String checkPwd(@RequestParam String memPwd, @RequestParam String loginPwd) {
		// 마이페이지를 들어가기 전에 당사자인지 확인하기 위해
		// 패스워드를 다시 물어보는 창을 보여줌..
		// 이 곳에서는 다시 물어본 패스워드를 받아서 맞는지 확인
		if(passwordEncoder.matches(memPwd, loginPwd))
			// 입력받은 패스워드와 암호화된 패스워드가 일치하면
			// 마이페이지창으로 보내줌.
			return "redirect:/member/memberAll.me";
		
		// 입력받은 패스워드와 암호화된 패스워드가 불일치하면
		// 패스워드를 체크하는 창을 다시 보여줌
//		redirectAttr.addAttribute("msg", "패스워드가 맞지 않습니다.");
		return "redirect:/member/checkPwd.me";
	}	
	
	@PostMapping("/myPage.me")
	public String editMyPage(Member member, Model model, RedirectAttributes redirectAttr) {
		// id와 나머지 변경값이 잘 들어오는걸 확인함.
		
		int result = memberService.editMyPage(member);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "회원정보 수정이 처리되었습니다.");
			Member editMember = memberService.seletOneMember(member.getMemId());
			model.addAttribute("loginMember", editMember);
			return "redirect:/member/memberAll.me";
		}
		
		redirectAttr.addFlashAttribute("msg", "회원정보 수정 실패");
		return "history.back();";
	}
	
	@PostMapping("/changePwd.me")
	public String changePwd(Member member, RedirectAttributes redirectAttr) {
		String id = member.getMemId();
		String pwd = member.getMemPwd();
		
		String encodedPwd = passwordEncoder.encode(pwd);
		member.setMemPwd(encodedPwd);
		
		int result = memberService.changePwd(id, encodedPwd);
		
		if(result > 0) {
			redirectAttr.addFlashAttribute("msg", "비밀번호 변경 성공");
			return "redirect:/member/memberAll.me";
		}	

		redirectAttr.addFlashAttribute("msg", "비밀번호 변경 실패");
		return "redirect:/member/changePwd.me";
	}
	
	@PostMapping("delMem.me")
	public String delMem(@RequestParam String memId, SessionStatus status, RedirectAttributes redirectAttr) {
		
		if(memberService.delMem(memId) > 0) {
			memberLogout(status);
			redirectAttr.addFlashAttribute("msg", "회원 탈퇴가 정상 처리되었습니다.");
			return "redirect:/";
		}
		
		redirectAttr.addFlashAttribute("msg", "회원탈퇴 실패");
		return "history.back();";
	}
	
//---------------------------관리자페이지-----------------------------------	
//	전체회원조회
	  @GetMapping("/list") 
	  public String getMemberList(Model model) { 
		  List<Member> list = memberService.getMembers();
		  
		  model.addAttribute("list", list );
		  return "jsonView"; 
	  }
// 회원삭제
	  @PostMapping("/adminDrop.my")
	    @ResponseBody
	    public String deleteMember(@RequestParam("memId") String memId) {
	        memberService.deleteMember(memId);
	        return "success";
	    }
// 회원수정
	  @PostMapping("/adminMemberUpdate.do")
	  @ResponseBody
		public String adminMemberUpdate(Member member) {
		  System.out.println(member);
		  int result = memberService.adminMemberUpdate(member);
		  System.out.println("result : " + result);
		  return "success";
	  }
//---------------------------관리자페이지-----------------------------------
	
	
} // end of class
