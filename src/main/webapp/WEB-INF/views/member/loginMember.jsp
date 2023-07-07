<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 나의 스타일 추가 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css?after">


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="로그인" name="title" />
</jsp:include>


<div id="login-from">
	<form action="${pageContext.request.contextPath}/member/loginMember.me" method="post">
		<!--  html 전체 영역을 지정하는 container -->
		<div id="container">
			<!--  login 폼 영역을 : loginBox -->
			<div id="loginBox">
				<!-- 로그인 페이지 타이틀 -->
				<div id="loginBoxTitle">VegFarm Login</div>
				<!-- 아이디, 비번, 버튼 박스 -->
				<div id="inputBox">
					<div class="input-form-box">
						<span>아이디 </span><input type="text" name="memId" class="form-control">
					</div>
					<div class="input-form-box">
						<span>비밀번호 </span><input type="password" name="memPwd" class="form-control">
					</div>
					<div class="button-login-box">
						<button type="submit" class="btn btn-primary btn-xs" style="width: 100%">로그인</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	





<jsp:include page="/WEB-INF/views/common/footer.jsp" />