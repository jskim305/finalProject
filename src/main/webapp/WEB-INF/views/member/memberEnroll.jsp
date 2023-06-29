<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="${pageConext.request.contextPath}/resources/js/join.js?after" type="text/javascript" charset="UTF-8"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 회원 가입만 되는 상태
	 문제는 아직 유효성 검사를 접목시키지 못함.
-->

<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <script src="${pageContext.request.contextPath}/resources/js/join.js?v=<%System.currentTimeMillis(); %>" type="text/javascript" charset="UTF-8"></script>

  <style>
    body {
      min-height: 100vh;
      
      background-image: url('${pageContext.request.contextPath}/resources/images/v1_76.png');
      background-size: contain;
		/* background-image: url('${pageContext.request.contextPath}/WEB-INF/index.jsp'); */

      /* background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); */

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
  
</head>

<body>
<form action="${pageContext.request.contextPath}/member/memberEnroll.me" method="post">
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" name="form" method="post" action="joinProc.jsp">
          <div class="row">
          
            <div class="col-md-6 mb-3">
              <label for="mName">이름</label>
              <input type="text" class="form-control" id="mName" name="mName" placeholder="" required>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="mBirth">생년월일</label>
              <input type="text" class="form-control" id="mBirth" name="mBirth"  placeholder="yymmdd" required>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="mId">사용할 ID</label>
              <input type="text" class="form-control" id="mId" name="mId" placeholder="영,숫자포함 최대 20글자" required>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="mTel">전화번호</label>
              <input type="tel" class="form-control" id="mTel" name="mTel"  placeholder="010-1234-5678" required>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="mPwd">비밀번호</label>
              <input type="password" class="form-control" id="mPwd" name="mPwd" placeholder="영,숫자,특수기호 포함 최대 20글자" required>
            </div>
             
            <div class="col-md-6 mb-3">
              <label for="rePwd">비밀번호 재입력</label>
              <input type="password" class="form-control" id="rePwd" name="rePwd"  placeholder="비밀번호를 다시 입력해주세요." required>
            </div>
          </div>

          <div class="mb-3">
            <label for="mAddr">주소</label>
            <input type="text" class="form-control" id="mAddr" name="mAddr"  placeholder="상세주소 포함" required>
          </div>

          <div class="mb-3">
          	<label for="mEmail">EMAIL</label>
            <input type="email" class="form-control" id="mEmail" name="mEmail"  placeholder="abc@gmail.com">
          </div>
          
          <hr class="mb-4">
          <div class="mb-4"></div>
          <!-- <button class="btn btn-primary btn-lg btn-block" type="submit" onclick="inputCheck();">가입 완료</button> -->
        	<button class="btn btn-primary btn-lg btn-block" type="submit" >가입 완료</button>
        </form>
      </div>
    </div>
    
    <footer>
    </footer>
  </div>

</body>

</html>