<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

 
<!-- 나의 스타일 추가 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/changePwd.css?v=<%System.currentTimeMillis(); %>">


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="비밀번호 변경" name="title" />
</jsp:include>


<div id="changePwd-from">
 	<form name="frm" <%-- action="${pageContext.request.contextPath}/member/changePwd.me" method="post" --%>>
		<!--  html 전체 영역을 지정하는 container -->
		<div id="container">
			<!--  login 폼 영역을 : loginBox -->
			<div id="changeBox">
				<div id="changeBoxTitle">비밀번호 변경</div>
				<!-- 아이디, 비번, 버튼 박스 -->
				<div id="inputBox">
					<span>새 비밀번호</span>
					<span style="color: red; font-size: 14px;" id="ckPwd" ></span>
					<div class="change-form-box">
						<input type="password" name="memPwd" id="memPwd" class="form-control">
					</div>
					<span>다시 한번</span>
					<span style="color: red; font-size: 14px;" id="ckRePwd" ></span>
					<div class="change-form-box">
						<input type="password" name="rePwd" id="rePwd" class="form-control">
					</div>
					
					<div class="form-row">
						<div class="button-change-box">
							<button type="button" class="btn btn-primary btn-xs" id="changePwd" style="width: 100%">변경하기</button>
						</div>
						<div class="button-change-box">
							<button type="reset" class="btn btn-primary btn-xs" style="width: 100%" onclick="history.back();">취소</button>
					</div>
					</div>
				</div>
				
				<input type="hidden" name="memId" id="memId" value="${loginMember.memId}">
				
			</div>
		</div>
	</form>
</div>

<!-- submit으로 해서 form을 넘기면(member) 값을 받아서 처리가 가능.
	근데 문제는 pwd, repwd의 비교가 아직 안되고 있기 때문에
	비교가 추가되어야 할 거 같음.  -->


<script>

	//PW 유효성검사
	document.getElementById('memPwd').onkeyup = function() {
		var msg = '';
		var pwdExp = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/;
		var memPwd = this.value;
		
		if(pwdExp.test(memPwd)){
			document.getElementById('ckPwd').style.color="green";
			document.getElementById('ckPwd').textContent = "사용 가능";
		}
		else{
			document.getElementById('ckPwd').style.color="red";
			document.getElementById('ckPwd').textContent = "사용 불가능";
		}
	}
	
	// rePW 유효성검사
	document.getElementById('rePwd').onkeyup = function() {
		var memPwd = document.getElementById('memPwd').value;
		var rePwd = this.value;
		
		if(memPwd === rePwd){
			document.getElementById('ckRePwd').style.color="green";
		document.getElementById('ckRePwd').textContent = "동일 패스워드";
		}
		else{
			document.getElementById('ckRePwd').style.color="red";
		document.getElementById('ckRePwd').textContent = "잘못 입력되었습니다	";
		}
	}

	document.querySelector("#changePwd").addEventListener("click", (e) =>{
		
		var rePwd = document.querySelector("#rePwd").value;
		var memPwd = document.querySelector("#memPwd").value;
			
		if(memPwd == rePwd){
			frm.method = 'POST';
			frm.action = '${pageContext.request.contextPath}/member/changePwd.me';
			frm.submit();
		}
		else{
			// 일치하지 않으면 일치하지 않다고 말을 써주고 싶은데 안됨.
			// 이걸 창으로 띄우던지, 아님 div로 나오게 해주던지....
			// keyup이 되면 div로 비밀번호가 맞다, 맞지 않다가 나오면 좋을거 같은데....
		}
		

	});

</script>

 
<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />