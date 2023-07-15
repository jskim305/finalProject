<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/delMem.css?v=<%System.currentTimeMillis(); %>">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>	





<div class="form-container">
     <form name="frm" >
        <h3>회원 탈퇴</h3>
        <div class="form-row">
            <div class="form-col">
                <label for="user_pwd">아이디 입력</label>
                <input type="text" id="delText" name="dexText" placeholder="탈퇴를 하려거든 '지금탈퇴'를 입력하세요.">
                <input type="hidden" id="memId" name="memId" value="${loginMember.memId}" > 
            </div>   
        </div>
            
	    <div class="form-row">
		    <div class="form-col">
				<input type="button" id="delMemBtn" value="탈퇴">
			</div>
				    
			<div class="form-col">
			    <input type="reset" value="취소" onclick="history.back();">
			</div>
	    </div>
 	</form>

<br><br>
<hr>
<br><br><br>

<script>
	document.querySelector("#delMemBtn").addEventListener("click", (e)=>{
		const delText = document.querySelector("#delText").value;
		
		if(delText == "지금탈퇴"){
			frm.method = "post";
			frm.action = "${pageContext.request.contextPath}/member/delMem.me";
			frm.submit();
		}
	});
		
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>