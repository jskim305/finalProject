<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

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
    .form-container .form-row,
    .form-container .form-row2,
    .form-container .form-row3 {
        display: flex;
        align-items: center;
    }
    .form-container .form-row .form-col,
    .form-container .form-row2 .form-col,
    .form-container .form-row3 .form-col {
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
    <form id="editFrm" action="${pageContext.request.contextPath}/member/myPage.me" method="post">
        <h3>개인 정보(${loginMember.memId})</h3>
        <div class="form-row">
            <div class="form-col">
                <label for="user_name">이름</label>
                <input type="text" id="mName" name="memName" value="${loginMember.memName}" readonly style="border:none">
            </div>   
            <div class="form-col">
                <label for="user_birth">생년월일</label>
                <input type="text" id="mBirth" name="memBirth" value="${loginMember.memBirth}" readonly style="border:none">
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-col">
                <label for="user_phone">전화번호</label>
                <input type="tel" id="mTel" name="memTel" value="${loginMember.memTel}" readonly style="border:none">
            </div>
            <div class="form-col">
                <label for="user_email">이메일</label>
                <input type="email" id="mEmail" name="memEmail" value="${loginMember.memEmail}" readonly style="border:none">
            </div>
        </div>
        
        <div class="form-row">
            <div class="form-col">
                <label for="start_date">주소</label>
                <input type="text" id="mAddr" name="memAddr" value="${loginMember.memAddr}" readonly style="border:none">
            </div>
        </div>
        
        <input type="hidden" name="memId" id="memId" value="${loginMember.memId}">
            
	    <div class="form-row2">
	   		<%-- <input type="hidden" id="btnCheck" value="${btnCheck}"> --%>
		    <div class="form-col">
				<input type="button" id="editMemInfoBtn" value="정보 수정">
			</div>
			<div class="form-col">
				<input type="button" id="editPwdBtn" value="비밀번호 수정"
					onclick="location.href='${pageContext.request.contextPath}/member/changePwd.me'">
			</div>
			<div class="form-col">
				<input type="button" id="delMemBtn" value="회원 탈퇴"
					onclick="location.href='${pageContext.request.contextPath}/member/delMem.me'">
			</div>
			<div class="form-col">
	   			<input type="button" value="뒤로" onclick="history.go(-2);">
			</div>
		</div>

	    <div class="form-row3" style="display:none">
			<div class="form-col">
				<input type="submit" id="editMemInfoBtn2" value="수정">
			</div>
			
			<div class="form-col">
			    <input type="button" value="취소" onclick="location.reload();">
			</div>
		</div>
	</form>	
</div>

    <script>
	    document.querySelector("#editMemInfoBtn").addEventListener('click', (e) => {
	    	//정보 수정 버튼을 누르면 전화번호, 이메일, 주소를 변경할 수 있게 해준다.
			$('#mTel').prop('readonly', false);
			$('#mEmail').prop('readonly', false);
			$('#mAddr').prop('readonly', false);
			$('#mTel').attr('style', "border:1px solid;");
			$('#mEmail').attr('style', "border:1px solid;");
			$('#mAddr').attr('style', "border:1px solid;");
			/* $("#btnCheck").val("editCheck"); */
			
			document.querySelector(".form-row2").style.display = "none";
			document.querySelector(".form-row3").style.display = "inline";
	    });
/* 	    
 	    document.querySelector("editMemInfoBtn2").addEventListener('click', (e) => {
 	    	frm.method = 'POST';
			frm.action = '${pageContext.request.contextPath}/member/updateMem.me';
			frm.submit();
	    }); */
    </script> 
    
</div>

<br><br>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>