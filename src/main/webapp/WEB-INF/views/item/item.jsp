<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<link href="${pageContext.request.contextPath}/resources/css/item.css?v=<%System.currentTimeMillis(); %>" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
</head>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="packagemain" name="title" />
</jsp:include>

<div class="item-logo">
	<div class="item-logo-text">
		<p id="text1">베지팜은 파트너 농가와 함께 합니다.</p>
	</div>
</div>
<div class="container" style="width: 1200px">
	<jsp:include page="/WEB-INF/views/item/sidebar.jsp">
		<jsp:param value="packagemain" name="title" />
	</jsp:include>  
		<main class="item-main">
			<div id="item-select">
				<div id="itemSelect-img">
					<img src="${pageContext.request.contextPath}/resources/images/itemlogo/${item.itemLogo}" alt="logo">
				</div>
				<div class="info-area">
					<div class="info-area_name">
						<h2>${item.itemName}</h2>
					</div>
					<div class="info-area_price">
						<p><fmt:formatNumber value="${item.itemPrice}" pattern="#,###"/>원</p>
					</div>
					<div class="info-area_farmBox">
						<div class="info-area_title">
							<span>판매 농가</span>
						</div>
						<div class="info-area_farm">
							<h2>${item.itemLocal}</h2>
						</div>
					</div>
					<div class="item-sulyangBox">
						<div class="info-area_title">
							<span>수량</span>
						</div>
							<form name="cart">
								<div class="info-area_number">
									<input type="hidden" name="memId" value="${loginMember.memId}">					
									<input type="hidden" name="itemNo" value="${item.itemNo}">							
									<input type="number" name="cartCount" min="0" max="${item.itemLocal}" value="1" onchange="updateTotalPrice(this)">
								</div>
							</form>
					</div>
					<div class="info-area_priceBox">
						<div class="info-area_title">
							<span>총 금액</span> 
						</div>
						<span class="total_price"><fmt:formatNumber value="${item.itemPrice}" pattern="#,###"/>원</span>
					</div>	
					<div class="info-area_btn">
							<button id="info-area_btn" onclick="insertCart()">장바구니</button>
					</div>
				</div>
				<c:if test="${ loginMember.admin =='1'}">
					<form action="${pageContext.request.contextPath}/item/deleteItem.bo" method="post">
						<input type="hidden" name="itemNo" value="${item.itemNo}">
						<button class="remove-button" type="submit">삭제하기</button>
					</form>    
					<button class="UPdate-button" onclick="Updata(${item.itemNo})">수정하기</button>
		   		</c:if>
			</div>
			<div>
			</div>
			<div class="info-area_content">
				<img src="${pageContext.request.contextPath}/resources/images/itemlogo/${item.itemContent}" alt="logo">
			</div>
		</main>
	</div>

<script>

	const insertCart = () => {
		cart.method = 'post';
		cart.action = '${pageContext.request.contextPath}/cart/insertCart.ca';
		cart.submit();
	}

	function updateTotalPrice(input) {
	    const price = ${item.itemPrice};
	    const quantity = parseInt(input.value);
	    const totalPriceElement = document.querySelector('.total_price');

	    const totalPrice = price * quantity;
	    const formattedTotalPrice = totalPrice.toLocaleString(); // 쉼표로 구분된 형식으로 포맷팅
	    totalPriceElement.textContent = formattedTotalPrice + '원';
	}
	
	
	function Updata(no) {
		location.href='${pageContext.request.contextPath}/item/updateitemv.do?no='+no;	
	}
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />