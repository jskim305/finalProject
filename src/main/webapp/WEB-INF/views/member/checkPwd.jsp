<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder" %>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/checkPwd.css?v=<%System.currentTimeMillis(); %>">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>	


<div class="form-container">
     <form action="${pageContext.request.contextPath}/member/checkPwd.me" method="post">
        <h3>패스워드 확인(${loginMember.memId})</h3>
        <div class="form-row">
            <div class="form-col">
                <label for="user_pwd">패스워드 입력</label>
                <input type="password" id="memPwd" name="memPwd" >
                <input type="hidden" id="loginPwd" name="loginPwd" value="${loginMember.memPwd}" > 
            </div>   
        </div>
            
	    <div class="form-row">
		    <div class="form-col">
				<input type="submit" id="checkPwdBtn" value="입력">
			</div>
				    
			<div class="form-col">
			    <input type="reset" value="취소" onclick="history.back();">
			</div>
	    </div>
 	</form>

<br><br>
<hr>
<br><br><br>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>