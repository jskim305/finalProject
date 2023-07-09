<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<head>
	<link href="${pageContext.request.contextPath}/resources/css/package.css?v=<%System.currentTimeMillis(); %>" rel="stylesheet" />
</head>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="packagemain" name="title" />
</jsp:include>


<div class="packgae-logo">
	<div class="packgae-logo-text">
		<p id="text1">베지팜이 엄선한 질병 • 건강 기준에 맞춘</p>
		<br>
		<p id="text2">건강 패키지</p>
	</div>
</div>

<div class="container" style="width: 1000px">
	<main class="pakge-main">
		<div id="package-menu">
			<div class="package-card">
				<a href="${pageContext.request.contextPath}/item/pacForm.bo?INo=1" >
					<h2>감기 탈출 패키지</h2>
				</a>
			</div>
			<div class="package-card">
				<a href="${pageContext.request.contextPath}/item/pacForm.bo?INo=2">
					<h2>혈당 관리 패키지</h2>
				</a>
			</div>
			<div class="package-card">
				<a href="${pageContext.request.contextPath}/item/pacForm.bo?INo=3">		
					<h2>당뇨 관리 패키지</h2>
				</a>
			</div>
			<div class="package-card">
				<a href="${pageContext.request.contextPath}/item/pacForm.bo?INo=4">
					<h2>심혈관계질환</h2>
				</a>
			</div>
		</div>
		<p>HOME > 패키지 > ${pacForm.itemName}</p>
		<div id="package-select">
			<div id="pacSelect-img">
				<img src="${pageContext.request.contextPath}/resources/images/itemlogo/${pacForm.itemLogo}" alt="logo">
			</div>
			<div class="info-area">
				<div class="info-area_name">
					<h2>${pacForm.itemName}</h2>
				</div>
				<div class="info-area_price">
					<h2>${pacForm.itemPrice}원</h2>
				</div>
				<div class="info-area_farmBox">
					<div class="info-area_title">
						<span>판매 농가</span>
					</div>
					<div class="info-area_farm">
						<h2>${pacForm.itemLocal}</h2>
					</div>
				</div>
					<div class="item-sulyangBox">
						<div class="info-area_title">
							<span>수량</span>
						</div>
						<form name="frm">
							<div class="info-area_number">
								<input type="hidden" name="memId" value="${loginMember.memId}">					
								<input type="hidden" name="itemNo" value="${pacForm.itemNo}">							
								<input type="number" name="cartCount" min="0" max="${pacForm.itemLocal}" value="1" onchange="updateTotalPrice(this)">
								<input type="hidden" name="cartPrice"  value="${pacForm.itemPrice}">							
							</div>
						</form>
					</div>
					<div class="info-area_priceBox">
						<div class="info-area_title">
							<span>총 금액</span>
						</div>
						<span class="total_price">${pacForm.itemPrice}원</span>
					</div>
					<div class="info-area_btn">
						<button id="info-area_btn" onclick="insertCart()">장바구니</button>
					</div>
				</div>
			</div>
			<div class="info-area_content">
				<img src="${pageContext.request.contextPath}/resources/images/${pacForm.itemContent}" alt="logo">
			</div>
		</main>
	</div>
	
<script>
   const insertCart = () => {
       frm.method = 'post';
       frm.action = '${pageContext.request.contextPath}/cart/insertPacCart.ca';
       frm.submit();
   }
   
    function updateTotalPrice(input) {
        const price = ${pacForm.itemPrice};
        const quantity = parseInt(input.value);
        const totalPriceElement = document.querySelector('.total_price');

        const totalPrice = price * quantity;
        totalPriceElement.textContent = totalPrice + '원';
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />