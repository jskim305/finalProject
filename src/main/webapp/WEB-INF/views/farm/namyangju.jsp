<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 농장앨범 css주기 -->
<div class="swiper">
	<div class="swiper-wrapper">
	<!-- Slides -->
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/namswiper1.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/namswiper2.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/namswiper3.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/namswiper4.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/namswiper5.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/namswiper6.jpg"></div>
	</div>
</div> 

<div class="product">
	<div class="box">
		<div class="top-box">
			<div>
				[남양주 서씨네농장]<br>
				매일 <span class="point">1~2회 고객님의 주말농장을 </span>관리합니다.<br>
				서씨네농장에서 매주 월,수,금 텃밭의 상태를 카톡으로 알려드립니다. 계절별 가격 동일하며 동절기 미운영합니다. 
			</div>
			<div>
				수확시기에 못 오실 경우 <span class="point">"서씨네농장 주인이 수확하여"</span><br> 배송 서비스를 진행합니다.<br>
				<span class="caution">▶회원가입시 입력한 주소로 배송되며 배송료를 포함한 소정의 비용이 발생합니다◀</span> <!-- 당구장표시를 넣고 글자크기를 줄이자 -->
			</div>
		</div>
	</div>
	<div class="box">
		<h2>예약 가능한 농지 안내</h2>
		<div class="img-area type2">
			<div>
			<img src="/final/resources/images/namSector.jpg">
			<img src="/final/resources/images/namPrice.jpg">
			</div>
		</div>
		저희 농장에서는 D1(30㎡), D2(27㎡), D3(30㎡), D4(27㎡)에서 농사를 경작하실 수 있는 구역을 제공하고 있습니다. <br>
		각 구역의 가격 확인하시고, 원하시는 구역을 편하게 예약해주세요.<br>
		남양주 서씨네농장의 추천작물 : <span class="preferS">감자 시금치 쑥갓 상추 토마토</span><br>
		이외 고객님께 더욱 자세한 설명을 드릴 수 있도록 노력하겠습니다.
	</div>
	
	<div class="box">
		<h2>남양주 서씨네농장</h2>
		<div class="img-area"><img src="/final/resources/images/namSeo5.png"></div>
		<div class="img-area type2">
			<img src="/final/resources/images/namSeo1.png">
			<img src="/final/resources/images/namSeo4.png">
		</div>
		<span>안녕하세요. 서씨네농장 주인입니다. 어떤 자리에서 풀만 뽑으며 살아온 사람이라고 제 소개를 한 적이 있습니다.</span><br>
		<span>저는 혼자서 풀 뽑는 일을 가장 좋아합니다. 혼자 풀을 뽑으며 농사가 제 천직이라 생각하게 되었고, 농촌이 보물창고라 생각하게 되었습니다.</span><br>
		<span>이 많은 구슬을 어떻게 꿰어야 보배를 만들 수 있을까?  늘 생각합니다.</span>
		<span>농사짓는 사람으로 사는 저의 자긍심을 근거 있는 자긍심으로 만드는 것이 저의 숙제입니다. 새로 시작하게될 여러분과 소통하며 즐거운 텃밭 생활이 되도록 같이 만들어가요. 만나뵙게 되어 반갑습니다.</span>
		<div class="img-area type2">
			<img src="/final/resources/images/namSeo7.jpg">
			<img src="/final/resources/images/namSeo8.jpg">
		</div>
		<span class="preferS">"서씨네 농장 주인이 2022년"</span> 수확시기에 오지못한 고객님의 작물을 수확하여 배송해드렸습니다.<br>
		<span class="caution">▶수확시기에 오지 못하는 고객님은 회원가입시 입력한 주소로 배송되며 배송료를 포함한 소정의 비용이 발생합니다◀</span>
	</div>
	
	<div class="box">
		<h2>오시는 길</h2>
		<div id="map4" class="map-contents"></div>	 
	</div>
</div>
	
	
	
	
	
		