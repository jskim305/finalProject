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