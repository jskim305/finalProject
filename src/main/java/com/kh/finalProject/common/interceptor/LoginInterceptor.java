package com.kh.finalProject.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.finalProject.member.model.vo.Member;

public class LoginInterceptor implements HandlerInterceptor {
	/*
	 * - Interceptor(HandlerInterceptor)
	 * 해당 controller가 실행되기전, 실행된 후에 낚아채서 실행할 내용 작성
	 * 로그인 유무 판단, 회원 권한 체크
	 * 
	 * preHandle(전처리) : Dispatcherserlvet이 컨트롤러를 호출하기전에 낚아채는 영역
	 * postHandle(후처리) : 컨트롤러 요청처리 후 Dispatcherserlvet으로 뷰정보가 리턴되는 순간 낚아채는 영역 	 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// true 리턴시 => 기존 요청 흐름대로 해당 controller를 실행
		// false 리턴시 => controller실행되지 않음
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			FlashMap flshMap = new FlashMap();
			flshMap.put("msg", "로그인 후 이용할 수 있습니다.");
			FlashMapManager manager = RequestContextUtils.getFlashMapManager(request);
			manager.saveOutputFlashMap(flshMap, request, response);
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		} else {
			return true;
		}
	}
}
