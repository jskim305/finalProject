<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 농장앨범 css주기 -->
<div class="swiper">
	<div class="swiper-wrapper">
	<!-- Slides -->
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/yangswiper1.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/yangswiper2.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/yangswiper3.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/yangswiper4.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/yangswiper5.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/yangswiper6.jpg"></div>
	</div>
</div> 

<div class="product">
	<div class="box">
		<div class="top-box">
			<div>
				[양주 윤씨네농장]<br>
				매일 <span class="point">1~2회 고객님의 주말농장을 </span>관리합니다.<br>
				윤씨네농장에서 매주 월,수,금 텃밭의 상태를 카톡으로 알려드립니다. 계절별 가격 동일하며 동절기 미운영합니다. 
			</div>
			<div>
				수확시기에 못 오실 경우 <span class="point">"윤씨네농장 주인이 수확하여"</span><br> 배송 서비스를 진행합니다.<br>
				<span class="caution">▶회원가입시 입력한 주소로 배송되며 배송료를 포함한 소정의 비용이 발생합니다◀</span> <!-- 당구장표시를 넣고 글자크기를 줄이자 -->
			</div>
		</div>
	</div>
	<div class="box">
		<h2>예약 가능한 농지 안내</h2>
		<div class="img-area type2">
			<div>
			<img src="/final/resources/images/yangSector.jpg">
			<img src="/final/resources/images/yangPrice.jpg">
			</div>
		</div>
		저희 농장에서는 B1(30㎡), B2(27㎡), B3(30㎡), B4(27㎡)에서 농사를 경작하실 수 있는 구역을 제공하고 있습니다. <br>
		각 구역의 가격 확인하시고, 원하시는 구역을 편하게 예약해주세요.<br>
		양주 윤씨네농장의 추천작물 : <span class="preferS">감자 시금치 쑥갓 상추 토마토</span><br>
		이외 고객님께 더욱 자세한 설명을 드릴 수 있도록 노력하겠습니다.
	</div>
	
	<div class="box">
		<h2>양주 윤씨네농장</h2>
		<div class="img-area type2">
			<img src="/final/resources/images/yangYoon1.jpg">
			<img src="/final/resources/images/yangYoon2.jpg">
		</div>
		<div class="img-area type2">
			<img src="/final/resources/images/yangYoon3.jpg">
			<img src="/final/resources/images/yangYoon4.jpg">
		</div>
		<span>윤씨네농장은 친환경 농사의 메카라고 불릴 만큼 모든 텃밭이 친환경 농사를 짓습니다. 믿을 수 있는 안전하고 건강한 농산물은 어디에 내 놓아도 자랑스러움을 안겨드립니다. 또 저희 농장은 안심대안사료(non-GMO)를 사용한 신선한 달걀을 매주 일요일 2구를 증정해드립니다. 윤씨네농장 주인이 수확한 제철채소를 구매하여 바베큐 파티도 이용해보세요!</span><br>
		<span class="preferS">"윤씨네 농장 주인이 2022년"</span> 수확시기에 오지못한 고객님의 작물을 수확하여 배송해드렸습니다.<br>
		<span class="caution">▶수확날 오지 못하는 고객님은 회원가입시 입력한 주소로 배송되며 배송료를 포함한 소정의 비용이 발생합니다◀</span><br>
		<span class="caution">바베큐 이용시 숯불 및 그릴 비용이 발생합니다.</span>
	</div>
	
	<div class="box">
		<h2>오시는 길</h2>
		<div id="map2" class="map-contents"></div>	 
	</div>
</div>
	
	
		