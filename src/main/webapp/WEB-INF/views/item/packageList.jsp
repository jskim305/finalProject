<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<div class="container" style="width: 1200px;">
	<main class="pakge-main">
		<div class="package-List">
			<%--<form action="${pageContext.request.contextPath}/item/packageList.bo" method="get"> --%>
			
			<!-- 	패키지 메인으로 돌아가는 코드 I PCA가 1인 리스트 모두 출력 클릭하면 PACKGEFORM이 우측에 페이지에 출력됨. -->
		
				<c:forEach items="${paclist}" var="pac">
				<div class="package-card">
					<img src="${pageContext.request.contextPath}/resources/images/itemlogo/${pac.itemLogo}" alt="logo">
					<h2>${pac.itemName}</h2>
					<p>${pac.itemPrice}원</p>
					<div class="package-card-but">
						<a href="${pageContext.request.contextPath}/item/pacForm.bo?INo=${pac.itemNo}">바로가기</a>
					</div>
				</div>
				</c:forEach>
		
			<div id="package-explanation" >
				<div id="explanation-title">
					<p>' 다양한 채소로 만드는 건강한 식단 '</p>
				</div>
				<div class="explanation-content">
					<p>자연의 선물, 채소 건강을 챙기세요. <br>
					신선한 채소들은 비만 예방과 혈압 조절, 면역력 강화등의  큰 도움을 줍니다. <br>
					당근, 시금치, 토마토, 브로콜리 등 다양한 채소를 일상 식단에 포함시켜<br>
					영양소를 공급하고 다양한 병리를 예방해보세요. 채소의 자연스러운 신선한<br>
					맛과 건강에 대한 선물을 즐겨보실 수 있을 것입니다.<br>
					배지팜은 당신의 건강과 웰빙을 도모하는 가장 좋은 파트너입니다.</p>
				</div>
			</div>
			<%-- 	카드의 이전버전 입니다. 작은 모양으로 좀 귀여움
		<div class="package-card">
				<img
					src="${pageContext.request.contextPath}/resources/images/pexels-photo-98350981.jpeg"
					alt="logo"> <a href=#>•심혈관계질환</a>
			</div> --%>
		</div>
	</main>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />