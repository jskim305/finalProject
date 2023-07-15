<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberEnroll.css?v=<%System.currentTimeMillis(); %>">



  
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입  
        	<img class="closeBtn" src="${pageContext.request.contextPath}/resources/images/icon-cancel.png"
        							   onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
      	</h4> 
		<form name="form" action="${pageContext.request.contextPath}/member/memberEnroll.me" method="post">
          <div class="row">
          
            <div class="col-md-6 mb-3">
              <label for="mName">이름</label>
              <span style="color: red; font-size: 14px;" id="ckName" ></span>
              <input type="text" class="form-control" id="mName" name="memName" placeholder="한글 2~6 입력"  required>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="mBirth">생년월일</label>
              <span style="color: red; font-size: 14px;" id="ckBirth" name="ckBirth" ></span>
              <input type="text" class="form-control" id="mBirth" name="memBirth" required>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="mId">사용할 ID</label>
              <span style="color: red; font-size: 14px;" id="ckId" ></span>
              <input type="text" class="form-control" id="mId" name="memId" placeholder="영,숫자포함 최대 20글자" required>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="mTel">전화번호</label>
              <input type="tel" class="form-control" id="mTel" name="memTel"  placeholder="010-1234-5678" required>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="mPwd">비밀번호</label>
              <span style="color: red; font-size: 14px;" id="ckPwd" ></span>
              <input type="password" class="form-control" id="mPwd" name="memPwd" placeholder="영,숫자,특수기호 포함 최대 20글자" required>
            </div>
             
            <div class="col-md-6 mb-3">
              <label for="rePwd">비밀번호 재입력</label>
              <span style="color: red; font-size: 14px;" id="ckRePwd" ></span>
              <input type="password" class="form-control" id="rePwd" name="rePwd"  placeholder="비밀번호를 다시 입력해주세요." required>
            </div>
          </div>

          <div class="mb-3">
            <label for="mAddr">주소</label>
            <input type="text" class="form-control" id="mAddr" name="memAddr"  placeholder="상세주소 포함" required>
          </div>

          <div class="mb-3">
          	<label for="mEmail">EMAIL</label>
            <input type="email" class="form-control" id="mEmail" name="memEmail"  placeholder="abc@gmail.com">
          </div>
          
          <hr class="mb-4">
          <div class="mb-4"></div>
        	<button class="btn btn-primary btn-lg btn-block" type="submit" >가입 완료</button>
        </form>
      </div>
    </div>
    
    <footer>
    </footer>
  </div>
  
  <script>
  	// 이름 유효성검사
  	document.getElementById('mName').onkeyup = function() {
  	 	var msg = '';
		var nameExp = /^[가-힣]{2,6}$/;
		var memName = this.value;
		
		if(nameExp.test(memName)){
			document.getElementById('ckName').style.color="green";
			document.getElementById('ckName').textContent = "사용 가능";
		}
		else{
			document.getElementById('ckName').style.color="red";
			document.getElementById('ckName').textContent = "사용 불가능";
		}
  	}
  	
  	// ID 유효성검사
  	document.getElementById('mId').onkeyup = function() {
  	 	var msg = '';
  		var idExp = /^[a-z][a-z0-9]{3,19}$/i;
		var memId = this.value;
		
		if(idExp.test(memId)){
			document.getElementById('ckId').style.color="green";
			document.getElementById('ckId').textContent = "사용 가능";
		}
		else{
			document.getElementById('ckId').style.color="red";
			document.getElementById('ckId').textContent = "사용 불가능";
		}
  	}
  	
  	// 생년월일 유효성검사
 	document.getElementById('mBirth').onkeyup = function() {
		var msg = '';
		var birthExp = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		var memBirth = this.value;

		if(birthExp.test(memBirth)){
			document.getElementById('ckBirth').style.color="green";
			document.getElementById('ckBirth').textContent = "사용 가능";
		}
		else{
			document.getElementById('ckBirth').style.color="red";
			document.getElementById('ckBirth').textContent = "사용 불가능";
		}
	}
  	
	// PW 유효성검사
  	document.getElementById('mPwd').onkeyup = function() {
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
  	 	var memPwd = document.getElementById('mPwd').value;
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
  	
  </script>
  
  
  

</body>

</html>