<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberAll.css?v=<%System.currentTimeMillis(); %>">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>


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
			
			document.querySelector(".form-row2").style.display = "none";
			document.querySelector(".form-row3").style.display = "inline";
	    });
	    
 	    document.querySelector("editMemInfoBtn2").addEventListener('click', (e) => {
 	    	frm.method = 'POST';
			frm.action = '${pageContext.request.contextPath}/member/updateMem.me';
			frm.submit();
	    });
    </script> 
    
</div>

<br><br>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>