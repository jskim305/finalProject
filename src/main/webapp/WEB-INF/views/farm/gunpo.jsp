<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 



<!-- 농장앨범 css주기 -->
<div class="swiper">
	<div class="swiper-wrapper">
	<!-- Slides -->
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f1.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f2.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f3.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f4.png"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f5.jpg"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/gunswiper1.jpg"></div>
	</div>
</div> 



<div class="product">
	<div class="box">
		<div class="top-box">
			<div>
				[군포 김씨네농장]<br>
				매일 <span class="point">1~2회 고객님의 주말농장을 </span>관리합니다.<br>
				김씨네농장에서 매주 월,수,금 텃밭의 상태를 카톡으로 알려드립니다. 계절별 가격 동일하며 동절기 미운영합니다. 
			</div>
			<div>
				수확시기에 못 오실 경우 <span class="point">"김씨네 농장 주인이 수확하여"</span><br> 배송 서비스를 진행합니다.<br>
				<span class="caution">▶회원가입시 입력한 주소로 배송되며 배송료를 포함한 소정의 비용이 발생합니다◀</span> <!-- 당구장표시를 넣고 글자크기를 줄이자 -->
			</div>
		</div>
	</div>
	<div class="box">
		<h2>예약 가능한 농지 안내</h2>
		<div class="img-area type2">
			<div>
			<img src="/final/resources/images/gunSector.jpg">
			<img src="/final/resources/images/gunPrice.png">
			</div>
		</div>
		저희 농장에서는 A1(30㎡), A2(27㎡), A3(30㎡), A4(27㎡)에서 농사를 경작하실 수 있는 구역을 제공하고 있습니다. <br>
		각 구역의 가격 확인하시고, 원하시는 구역을 편하게 예약해주세요.<br>
		군포 김씨네농장의 추천작물 : <span class="preferS">감자 시금치 쑥갓 상추 토마토</span><br>
		이외 고객님께 더욱 자세한 설명을 드릴 수 있도록 노력하겠습니다.
	</div>
	
	<div class="box">
		<h2>군포 김씨네농장</h2>
		<div class="img-area"><img src="/final/resources/images/gunKim2.jpg"></div>
		<div class="img-area type2">
			<img src="/final/resources/images/gunKim1.jpg">
			<img src="/final/resources/images/gunKim3.jpg">
		</div>
		<span>해가 갈수록 기후 변화가 심합니다.</span><br>
		<span>밤 낮의 일교차가 큰 차이가 있어 가늠이 안될 정도로 판단이 흐려지는 농사꾼은 편안할 날이 없습니다. </span><br>
		<span>예전에 보지 못했던 벌레도 작물에 해를 키치기도 하고 새들도 농작물의 손해를 끼치기도 하네요. </span><br>
		<span>하지만 땅을 지키고 가꾸는 김씨네 농장 가족들은 마음은 한결같이 넉넉하고 묵묵히 땀 흘리며 꿋꿋이 관리에 최선을 다합니다.</span><br>
		<span class="preferS">"김씨네 농장 주인이 2022년"</span> 수확시기에 오지못한 고객님의 작물을 수확하여 배송해드렸습니다.<br>
		<span class="caution">▶수확시기에 오지 못하는 고객님은 회원가입시 입력한 주소로 배송되며 배송료를 포함한 소정의 비용이 발생합니다◀</span>
	</div>
	
	<div class="box">
		<h2>오시는 길</h2>
		<div id="map1" class="map-contents"></div>	 
	</div>
</div>

		
			
			
			
	
	
		