<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>	


<style>
    body {font-family: Arial, sans-serif;}
    .form-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .form-container h3 {
        margin-top: 0;
        margin-bottom: 20px;
        color: #4caf50;
        font-size: 20px;
    }
    .form-container label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }
    .form-container input[type="text"],
    .form-container input[type="password"],
    .form-container input[type="number"],
    .form-container input[type="tel"],
    .form-container input[type="email"],
    .form-container input[type="date"],
    .form-container textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        }
    .form-container .form-row {
        display: flex;
        align-items: center;
    }
    .form-container .form-row .form-col {
        flex: 1;
        margin-right: 10px;
    }
    .form-container input[type="submit"],
    .form-container input[type="button"],
    .form-container input[type="reset"] {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 4px;
        background-color: #4caf50;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .form-container input[type="submit"]:hover,
    .form-container input[type="reset"]:hover {
        background-color: #45a049;
    }
</style> 


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

<script>
 /* 	document.querySelector("#checkPwdBtn").addEventListener('click', (e) => {
	 console.log(pwd : $("#pwd").val());
		$.ajax({
			url: "checkPwd.me",
			method: "post",
			data: {mempwd: $("#memPwd").val(),
					loginPwd: $("#loginPwd").val()},
			success: function(result){
				console.log(result);
				if(result == true)
					location.href='${pageContext.request.contextPath}/member/memberAll.me';
				else
					alert("잘못된 비밀번호입니다. 다시 입력하세요");
			},
			error: function(){
				console.log("ajax 통신 실패");
			}
		}); 
	}); */
		
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>