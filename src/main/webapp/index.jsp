<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="vegfarm" name="title" />
</jsp:include>

	<img src="${pageContext.request.contextPath}/resources/images/v29_3.png" class="navimg" alt="Header Image">

<div class="container">
	<div class="first-page">
		<div class="greenLine">
			<img
				src="${pageContext.request.contextPath}/resources/images/v1_53.png"
				alt="greenLine">
		</div>
		<div class="first-card">
			<p>직접 체험하며 농사가 얼마나 즐거운지 저희와 함께 배워보세요!!!!</p>
			<div class="card">
				<h3>농지대여</h3>
				<img
					src="${pageContext.request.contextPath}/resources/images/v16_558.png"
					alt="greenLine">
				<h5>농사가 처음이신가요?</h5>
				<p>대여한 농지의 농사는 VEG FARM에 맡기세요!</p>
			</div>
			<div class="card">
				<h3>배지팜의 철학</h3>
				<img
					src="${pageContext.request.contextPath}/resources/images/v1_76.png"
					alt="greenLine">
				<h5>VEG FARM이 추구하는 목표</h5>
				<p>고객님의 상품구매로 환경보호를 함께 합니다.</p>
			</div>
			<div class="card">
				<h3>농장 체험</h3>
				<img
					src="${pageContext.request.contextPath}/resources/images/soilhands.jpg"
					alt="greenLine">
				<h5>대여한 농지의 농사를 직접 지어보세요.</h5>
				<p>도심근처에 위치한 농장을 활용해 자연을 느껴보세요!</p>
			</div>
		</div>
		<div class="last-card">
			<div>
				<div class="card">
					<h3>상품판매</h3>
					<img
						src="${pageContext.request.contextPath}/resources/images/v16_560.png"
						alt="greenLine">
					<h5>.</h5>
					<p>엄선된 농장에서 수확한 건강한 채소들을 집에서 저렴하게 만나보세요!</p>
				</div>
				<div class="card">
					<h3>온라인 신청</h3>
					<img
						src="${pageContext.request.contextPath}/resources/images/v17_9.png"
						alt="greenLine">
					<h5>2023년 3월 주말농장 온라인 신청 OPEN</h5>
					<p>여러분의 건강한 여가활동 및 녹색공간 조성을 위한 2023년 주말농장 신청방법 및 안내문</p>
			
					<h5>신청기간 7월 24일(월) ~ 7월 28일(금)</h5>
				</div>
				<div class="card">
					<h3>패키지 상품</h3>
					<img
						src="${pageContext.request.contextPath}/resources/images/v16_559.png"
						alt="greenLine">
					<h5>엄선된 건강 패키지</h5>
					<p>고객님이 앓고 있는 질병에 맞는 엄선된 채소와 식단을 추천합니다.</p>
				</div>
			</div>
		</div>

		<div class="index-text">
			<p>
				a 제공하기 위해 준비된 밭이랑은 고객님의 식탁 위에 무엇이 올라가는지를 알려드리고 있습니다 <br> 지속가능한
				농업을 추구하며 환경에 부담을 주지 않는 방식으로 작물을 재배함을 알려드립니다<br> 밭이랑은 일상 생활에서
				벗어나 스스로 하는 일에 즐거움을 느끼고, 작은 씨앗에서 접시 위로 올라가는 단순한 영양이상의 것을 선사하고자 합니다<br>
				밭이랑은 고객님의 건강과 환경의 번영을 위해 노력하겠습니다<br>
			</p>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />