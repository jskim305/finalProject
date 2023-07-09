<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<link href="${pageContext.request.contextPath}/resources/css/cart.css?v=<%System.currentTimeMillis(); %>" rel="stylesheet" />
</head>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="packagemain" name="title" />
</jsp:include>  


<main class="cartList-main">		
	<div class="cart-logo">
		<div class="cart-logo-text">
			<h2>${loginMember.memId}님</h2><h4>의 장바구니</h4>
		</div>
	</div>
	<div class="cart-container">
		<table class="cart-table">
			<c:set var = "total" value = "0" />
			<c:forEach items="${cartList}" var="cart">
					<tr>
						<td>
			     			<img src="${pageContext.request.contextPath}/resources/images/itemlogo/${cart.itemLogo}" alt="logo"> 
						</td>
						<td>
							<a><h5 class="itemLocal">${cart.itemLocal}</h5></a>
							<h5 class="itemname">${cart.itemName}</h5>
							<h5 class="itemPrice">상품가격 <fmt:formatNumber value="${cart.itemPrice}" pattern="###,###,###"/>원</h5>
							<h5 class="itemCount">재고량${cart.itemCount}</h5>
						</td>
						<td>
			        		<h4>
   							 <c:set var="total" value="${cart.itemPrice * cart.cartCount}"/>
    						<fmt:formatNumber value="${total}" pattern="###,###,###"/>원
							</h4>
						</td>
						<td>					
		 					<button class="buy-button">구매하기</button>
								<form action="${pageContext.request.contextPath}/cart/deleteCart.ca" method="post">
		  							<input type="hidden" name="cartNo" value="${cart.cartNo}">
		  							<input type="hidden" name="memId" value="${loginMember.memId}">
		  							<button class="remove-button" type="submit">삭제하기</button>
								</form>
						</td>
				</tr>
		 	</c:forEach>
		</table>
	</div>
</main>