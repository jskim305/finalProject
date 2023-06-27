<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css?after"
   rel="stylesheet" />
</head>
<body>
	<header>
		<div class="container">
			<div class="top-links">
          		<a href="#">로그인</a>
          	 	<a>|</a>
            	<a href="#">장바구니</a>
             	<a>|</a>
           		<a href="${pageContext.request.contextPath}/member/memberEnroll.me"> 회원가입</a>
             	<a>|</a>
           		<a href="#">내역확인</a>
       		</div>
			<div class="logo">
				<img class="logo" src="${pageContext.request.contextPath}/resources/images/v22_2.png" alt="logo">
       		</div>
			<div class="middle-links">
       			<ul class="middle-nav">
	            	<li><a href="#">공지사항</a></li>
	            	<li><a href="#">게시판</a></li>
	            	<li><a href="#">농지예약</a></li>
	            	<li><a href="#">패키지</a></li>
	            	<li><a href="#">상품판매</a></li>
           			 <!-- <li><a href="#" hidd>로그인전용 또는 관리자전용페이지</a></li> -->
            	</ul>
			</div>
		</div>
	</header>
	<img src="${pageContext.request.contextPath}/resources/images/v29_3.png" class="navimg" alt="Header Image">
