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
<link href="${pageContext.request.contextPath}/resources/css/main.css?v=<%System.currentTimeMillis(); %>" rel="stylesheet" />

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
         		
         		
         		<!-- --------------------------- 주문창 확인용코드 ------------------------------------ -->
         		<c:if test="${not empty loginMember}">
         			<a href="${pageContext.request.contextPath}/orders/ordersForm.or" >주문 test</a>
         			<a>|</a>
         		</c:if>
         		<!-------------------------------------------------------------------------------  -->
         		
         		
         		<c:if test="${not empty loginMember && loginMember.admin eq 0}">
	            	<a href="${pageContext.request.contextPath}/cart/myCart.ca?memId=${loginMember.memId}" >장바구니</a>
	             	<a>|</a>
             	</c:if>
             	
             	<c:if test="${empty loginMember}">
	           		<a href="${pageContext.request.contextPath}/member/memberEnroll.me"> 회원가입</a>
             	</c:if>
             	
             	<c:if test="${not empty loginMember && loginMember.admin eq 0}">
           			<a href="#">내역확인</a>
           		</c:if>
           		
           		<c:if test="${not empty loginMember && loginMember.admin eq 0}">
           			<a>|</a>
	           		<a href="${pageContext.request.contextPath}/member/checkPwd.me"> 마이페이지</a>
             	</c:if>
             	
             	<c:if test="${not empty loginMember && loginMember.admin eq 1}">
           			<a href="${pageContext.request.contextPath}/member/adminList.me">관리자페이지</a>
           		</c:if>
           		
       		</div>
			<div class="logo">
				<img class="logo" src="${pageContext.request.contextPath}/resources/images/v22_2.png" alt="logo"
				onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
       		</div>
			<div class="middle-links">
       			<ul class="middle-nav">
	            	<li><a href="#">공지사항</a></li>
					<li>
						<a href="${pageContext.request.contextPath}/board/boardList.bo">게시판</a>
					</li>

					<li>
						<a href="${pageContext.request.contextPath}/farm/indexFarm.do">농지예약</a>
					</li>
            		
	            	<li>
	            		<a href="${pageContext.request.contextPath}/item/paclist.bo">패키지</a>
            		</li>
            		
	            	<li>
	            		<a href="${pageContext.request.contextPath}/item/itemlist.bo">상품판매</a>
	            	</li>
	            	
           		 	<li><a href="#">베지팜소개</a></li>
            	</ul>
			</div>
		</div>
	</header>

