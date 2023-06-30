<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css?after" rel="stylesheet" />

<c:if test="${not empty msg}">
	<script>
		alert('${msg}');
	</script>
</c:if>

</head>



<body>
   <header>
      <div class="container">
         <div class="top-links">
            <c:if test="${empty loginMember}">
                   <a href="${pageContext.request.contextPath}/member/loginMember.me" >로그인</a>
               </c:if>
               <c:if test="${not empty loginMember}">
                  <a href="${pageContext.request.contextPath}/member/memberLogout.me" >로그아웃</a>
               </c:if>
               <a>|</a>
               <c:if test="${not empty loginMember}">
                  <a href="#">장바구니</a>
                   <a>|</a>
                </c:if>
                <c:if test="${empty loginMember}">
                    <a href="${pageContext.request.contextPath}/member/memberEnroll.me"> 회원가입</a>
                </c:if>
                <c:if test="${not empty loginMember}">
                    <a href="#">내역확인</a>
                    <a>|</a>
                 </c:if>
                 <c:if test="${not empty loginMember && loginMember.admin eq 0}">
                    <a href="${pageContext.request.contextPath}/member/memberAll.me"> 마이페이지</a>
                </c:if>
                <c:if test="${not empty loginMember && loginMember.admin eq 1}">
                    <a href="${pageContext.request.contextPath}/member/adminList.me">관리자페이지</a>
                 </c:if>
       		</div>
			<div class="logo">
				<img class="logo" src="${pageContext.request.contextPath}/resources/images/v22_2.png" alt="logo">
       		</div>
			<div class="middle-links">
       			<ul class="middle-nav">
	            	<li><a href="#">공지사항</a></li>
	            	<li><a href="#">게시판</a></li>
	            	<li><a href="${pageContext.request.contextPath}/reservation/indexFarm.do">농지예약</a></li>
	            	<li><a href="#">패키지</a></li>
	            	<li><a href="#">상품판매</a></li>
           			 <!-- <li><a href="#" hidd>로그인전용 또는 관리자전용페이지</a></li> -->
            	</ul>
			</div>
		</div>
	</header>
	<img src="${pageContext.request.contextPath}/resources/images/v29_3.png" class="navimg" alt="Header Image">

	
	 <script>
		/* document.querySelector("#memberEnroll").addEventListener('click', (e)=> {
			window.open(
				"${pageContext.request.contextPath}/WEB-INF/views/member/memberEnroll.jsp",
				"회원가입",
				"width=500, height=300, top=50, left=50"	
			); 
			
			location.href='${pageContext.request.contextPath}/member/memberEnroll.me';
		}); */
		/*
 		function openNewWindow(){
			window.open("http://www.naver.com", "_blank");
			 window.open(
				"${pageContext.request.contextPath}/WEB-INF/views/member/memberEnroll.jsp",
				"회원가입",
				"width=500, height=300, top=50, left=50"
			); */
		}
	</script>