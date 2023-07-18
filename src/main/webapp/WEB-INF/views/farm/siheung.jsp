<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 농장앨범 css주기 -->
<div class="swiper">
	<div class="swiper-wrapper">
	<!-- Slides -->
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/siswiper1.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/siswiper2.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/siswiper3.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/siswiper4.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/siswiper5.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f3.png"></div>
	</div>
</div> 

<div class="product">
	<div class="box">
		<div class="top-box">
			<div>
				[시흥 손씨네농장]<br>
				매일 <span class="point">1~2회 고객님의 주말농장을 </span>관리합니다.<br>
				손씨네농장에서 매주 월,수,금 텃밭의 상태를 카톡으로 알려드립니다. 계절별 가격 동일하며 동절기 미운영합니다. 
			</div>
			<div>
				수확시기에 못 오실 경우 <span class="point">"손씨네농장 주인이 수확하여"</span><br> 배송 서비스를 진행합니다.<br>
				<span class="caution">▶회원가입시 입력한 주소로 배송되며 배송료를 포함한 소정의 비용이 발생합니다◀</span> <!-- 당구장표시를 넣고 글자크기를 줄이자 -->
			</div>
		</div>
	</div>
	<div class="box">
		<h2>예약 가능한 농지 안내</h2>
		<div class="img-area type2">
			<div>
			<img src="/final/resources/images/siSector.jpg">
			<img src="/final/resources/images/siPrice.jpg">
			</div>
		</div>
		저희 농장에서는 C1(30㎡), C2(27㎡), C3(30㎡), C4(27㎡)에서 농사를 경작하실 수 있는 구역을 제공하고 있습니다. <br>
		각 구역의 가격 확인하시고, 원하시는 구역을 편하게 예약해주세요.<br>
		시흥 손씨네농장의 키우기 쉬운 추천작물 : <span class="preferS">감자 시금치 쑥갓 상추 토마토</span><br>
		이외 고객님께 더욱 자세한 설명을 드릴 수 있도록 노력하겠습니다.
	</div>
	
	<div class="box">
		<h2>시흥 손씨네농장</h2>
		<div class="img-area"><img src="/final/resources/images/siSon5.jpg"></div>
		<span>좋은 종자를 얻기 위해 이듬해부터 종자용 수확하여 잘 말려 보관해 두었다가 1월말이나 2월초에 직접 자가 채종한 씨앗을 파종하여 떡잎 두장이 나온 후 포트에 정식을 해서 밤,낮으로 보온과 물 관리를 하며 정성들여 모종을 길러 냅니다. </span>
		<span>땅을 지키고 가꾸는 손씨네 농장 가족들은 한결같이 관리에 최선을 다합니다.</span><br>
		<div class="img-area type2">
			<img src="/final/resources/images/siSon1.jpg">
			<img src="/final/resources/images/siSon3.jpg">
		</div>
		<span class="preferS">"손씨네 농장 주인이 2022년"</span> 수확시기에 오지못한 고객님의 작물을 수확하여 배송해드렸습니다.<br>
		<span class="caution">▶수확시기에 오지 못하는 고객님은 회원가입시 입력한 주소로 배송되며 배송료를 포함한 소정의 비용이 발생합니다◀</span>
	</div>
	
	<div class="box">
		<h2>오시는 길</h2>
		<div id="map3" class="map-contents"></div>	 
	</div>
</div>
	
	
	
	
		