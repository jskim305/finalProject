<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="vegform" name="title"/>
</jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cae32d26dc4bc205934ad2152e3c8528"></script>

<!-- swpier 슬라이드 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
<div class="container">			
	<div class="reservation-info">
		
		<!-- 지도영역 -->
		<div class="map-area">
			<img src="${pageContext.request.contextPath}/resources/images/imgmap.png" usemap="#image-map" class="mapImg" >
			<!-- 기본 imgmap에 직접 원하는 좌표를 선택하여 링크설정(image-map.net) -->	
			<!-- 4개의 이미지를 만들어 해당 좌표이미지 id부여 -->
			<map name="image-map">				
				<area target="_blank" alt="군포" title="군포주말농장" onblur="this.focus()" nohref
					coords="141,313,130,322,123,333,134,335,145,332,150,321"
					shape="poly" id="idx1">
				<area target="_blank" alt="양주" title="양주주말농장" onblur="this.focus()" nohref
					coords="159,211,146,211,137,208,140,190,141,177,133,172,131,158,142,151,147,137,153,124,162,127,165,139,172,146,187,151,190,171,185,178,173,183,161,182,159,190,163,198,163,205"
					shape="poly" id="idx2">
				<area target="_blank" alt="시흥" title="시흥주말농장" onblur="this.focus()" nohref
					coords="82,336,88,330,95,325,105,320,114,317,126,319,129,311,121,306,117,298,112,288,101,281,94,296,84,311,89,315,75,324,76,330"
					shape="poly" id="idx3">
				<area target="_blank" alt="남양주" title="남양주주말농장" onblur="this.focus()" nohref
					coords="237,267,243,254,249,244,250,234,256,224,253,206,242,180,217,184,197,187,182,208,184,222,197,222,200,236,204,245,210,241,222,249,224,258"
					shape="poly" id="idx4">
			</map>
		</div>
			
		<!-- 정보영역 -->
		<div class="info-area">
			<div class="info-box">
				<ul>
				   <li>
				      <div class="title">농장이름</div>
				      <ul id="farmNameList"></ul>
				   </li>
				
				   <li>
				      <div class="title">농장지역</div>
				      <ul id="farmZoneList"></ul>
				   </li>
				 	
				   <li>
				      <div class="title">농장정보</div>
				      <ul id="farmContentList"></ul>  
				   </li>
				   
				   <li>
				      <div class="title">재배가능작물</div> 
				      <!-- 작물리스트 -->
				      <ul id="farmItemList"></ul>
				      <form id="hopeFrm" action="${pageContext.request.contextPath}/farm/hopeItem.go"  method="post">
				      <select id="farmItemList2" name="hItem1">
						  <!-- 여기에 동적으로 옵션을 추가할 것입니다 -->
						  
					  </select>
					      <div class="btn-area">
							  <button type="submit" id="submitBtn" class="btn-reservation" disabled>예약하기</button>
							  <button type="reset" class="btn-reset" >취소</button>
						  </div>
				      </form>   
				   </li>   	
				</ul>
			</div>		
		</div>
	</div>
			
	<div class="photo-area">
		<ul>
			<li>
		       <div class="title">농장앨범 </div>
		          <ul id="farmNameList2"></ul>
		    </li>
		</ul>
	</div> 
	
		<div class="content-area" id="idxD1" style="display: none;">
			<jsp:include page="/WEB-INF/views/farm/gunpo.jsp">
				<jsp:param value="vegform" name="title"/>
			</jsp:include>
		</div>
		<div class="content-area" id="idxD2" style="display: none;">
			<jsp:include page="/WEB-INF/views/farm/yangju.jsp">
				<jsp:param value="vegform" name="title"/>
			</jsp:include>
		</div>
		<div class="content-area" id="idxD3" style="display: none;">
			<jsp:include page="/WEB-INF/views/farm/siheung.jsp">
				<jsp:param value="vegform" name="title"/>
			</jsp:include>
		</div>
		<div class="content-area" id="idxD4" style="display: none;">
			<jsp:include page="/WEB-INF/views/farm/namyangju.jsp">
				<jsp:param value="vegform" name="title"/>
			</jsp:include>
		</div>
</div>		
		<style>
			.reservation-info{display: flex; justify-content: space-between; margin: 70px 0}
			.reservation-info .map-area {width: 50%}
			.reservation-info .info-area {width: 50%}
			.reservation-info .map-area {text-align: center}
			.reservation-info .info-box > ul {min-height: 300px; border-top: 2px solid #333; border-bottom: 2px solid #333; padding: 30px 20px}
			.reservation-info .info-box > ul > li {position: relative; padding-left: 140px; min-height: 23px}
			.reservation-info .info-box > ul > li+li {margin-top: 25px}
			.reservation-info .info-box .title {position: absolute; top: 0; left: 0; font-weight: bold}
			.reservation-info .info-box .choice div + div {margin-top: 10px}
			.reservation-info .info-box .choice input {width: 200px; padding: 5px 10px; font-size: 12px; box-sizing: border-box}
			.reservation-info .info-box #farmItemList {margin-bottom: 10px}
			.reservation-info .btn-area {margin-top: 30px;}
			.reservation-info .btn-area button {width: 100px; padding: 13px 0; border: 0; top:210px; cursor: pointer; position: absolute; background-color:#0a0a23; color: #fff;border:none; border-radius:10px;}
			.reservation-info .btn-area button+button {margin-left: 135px}
			.reservation-info .btn-area .btn-reservation {background: #73a839; color: #fff}
			.reservation-info .map-area area {cursor: pointer}
			.photo-area {margin-bottom: 70px}
			.photo-area .title {display: block; margin-bottom: 15px; position: relative; padding-left: 10px}
			.photo-area .title:before {content: ""; position: absolute; top: 2px; left: 0; width: 3px; height: 18px; background: #333}
			.photo-area img {width: 100%; vertical-align: top}
			.photo-area .img-area img {width: 40%; }
			.photo-area .swiper-button-next, .photo-area .swiper-button-prev{color: #73a839}
			.product .top-box {padding: 60px; background: #f0f0f0; text-align: center}
			.product .top-box div {font-size: 1.3em; color: #626262}
			.product .top-box div + div {margin-top: 40px; padding-top: 40px; border-top: 3px solid #dcdcdc}
			.product .point {color: #F07D00}
			.product .caution {font-size: 0.75em; color: #F07D00}
			.product .preferS {font-size: 1.0em; color: #F07D00}
			.product .box {font-size: 1.1em; line-height: 1.7; border-top: 4px solid #eee; padding: 65px 0; font-weight: bold; color: #333}
			.product .normal-box {font-size: 1.3em; line-height: 1.6; color: #626262; background: #f0f0f0; padding: 20px 30px; margin: 30px 0;border-radius: 5px; text-align: center;}
			.product h2 {margin-bottom: 60px; text-align: center; color: #F07D00; font-size: 1.8em}
			.product h2 + .img-area {margin-top: 0}
			.product h3 {margin: 30px 0; font-size: 1.2em}
			.product li {position: relative; padding-left: 17px;}
			.product li:before {content: ''; position: absolute; top: 8px; left: 0; width: 10px; height: 10px; background: #333; border-radius: 50%}
			.product .img-area {margin: 30px 0}
			.product .img-area img {max-width: 100%; vertical-align: top}
			.product .img-area.type2 {overflow: hidden}
			.product .img-area.type2 img {float: left; width: 49%; height: 350px;}
			.product .img-area.type2 img + img {margin-left: 2%}
			.swiper img {max-width: 100%}
			.map-contents {width: 100%; height: 400px}
			.iwStyle {padding:5px;}
			
			.reservation-info .btn-area .btn-reservation[disabled] {
   				 background-color: #ccc;
			}
		</style>

<script type="text/javascript">

	//area 클릭 시 버튼 상태 변경
	$(document).ready(function() {
	  $("area").click(function() {
	    $("#submitBtn").prop("disabled", false);
	  });	
	});

	$(document).ready(function () {
	 // 농장별jsp를 클릭마다 해당 클릭된 농장별jsp를 include하여 불러오기
	   function toggleContent(clickedId) {
        var content1 = document.getElementById('idxD1');
        var content2 = document.getElementById('idxD2');
        var content3 = document.getElementById('idxD3');
        var content4 = document.getElementById('idxD4');

        // 메인페이지에 노출시키지 않기
        content1.style.display = 'none';
        content2.style.display = 'none';
        content3.style.display = 'none';
        content4.style.display = 'none';
	 	
        
        	var container;
        	var lat;
        	var iwContent;
        	
	        // 클릭한 영역과 관련된 <div>만 화면에 표시하기
	        if (clickedId === 'idx1') {
	            content1.style.display = 'block';
	            var container = document.getElementById('map1');
	            var lat = [37.3248866031584,  126.905422718028]
	            var iwContent = '<div class="iwStyle">경기도 군포시 둔대동 180-1</div>'
	            
	        } else if (clickedId === 'idx2') {
	            content2.style.display = 'block';
	            var container = document.getElementById('map2');
	            var lat = [37.6896238389643, 126.931941975112]
	            var iwContent = '<div class="iwStyle">경기도 양주시 장흥면 일영로502번길 108-33</div>'
	            
	        } else if (clickedId === 'idx3') {
	            content3.style.display = 'block';
	            var container = document.getElementById('map3');
	            var lat = [37.3782255359406,126.752536658388]
	            var iwContent = '<div class="iwStyle">경기도 시흥시 달월길 93</div>'
	            
	        } else if (clickedId === 'idx4') {
	            content4.style.display = 'block';
	            var container = document.getElementById('map4');
	            var lat = [37.6118770929566, 127.215959062044]
	            var iwContent = '<div class="iwStyle">경기도 남양주시 와부읍 율석리 754-14</div>'
	        }
	        
		   
		   var options = {
		      center: new kakao.maps.LatLng(lat[0], lat[1]),
		      level: 6 // 레벨 커질수록 지도 영역이 축소되어 주변의 지역 정보를 더 얻을 수 있으며, 반대로 작을수록 이미지 부분이 확대되어 자세한 정보를 얻을 수 있다.
		   };
		   var map = new kakao.maps.Map(container, options);
		   
		   var imageSrc = '${pageContext.request.contextPath}/resources/images/marker.png',
		   imageSize = new kakao.maps.Size(40, 56),
		   imageOption = {offset: new kakao.maps.Point(27, 69)};
			      
		   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		   var markerPosition  = new kakao.maps.LatLng(lat[0], lat[1]);
		
		   var marker = new kakao.maps.Marker({
		      position: markerPosition,
		      image: markerImage

		   });
		   
		   marker.setMap(map);
		   
		   
		   
			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		   // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		   iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			      

		   
			// 인포윈도우를 생성합니다
		   var infowindow = new kakao.maps.InfoWindow({
		       content : iwContent,
		       removable : iwRemoveable
		   });

		   // 마커에 클릭이벤트를 등록합니다
		   kakao.maps.event.addListener(marker, 'click', function() {
		         // 마커 위에 인포윈도우를 표시합니다
		         infowindow.open(map, marker);  
		   });
       
    	}
		// imgmap으로 따온 지역만 클릭 가능 -> 가능한 지역별 img의 id로 지역별 색칠한 이미지 변경 
		// farmId를 부여해 해당 값을 spl 쿼리문 작성, 해당 지역의 데이터베이스 출력 
		$("area").click(function () {
			
	        var areaId = $(this).attr("id");
	        let farmId = null;
			
	        if (areaId == "idx1") {
	            $(".mapImg").attr("src", "${pageContext.request.contextPath}/resources/images/imgmap1.png");
	            farmId = 10;
	        } else if (areaId == "idx2") {
	            $(".mapImg").attr("src", "${pageContext.request.contextPath}/resources/images/imgmap2.png");
	            farmId = 20;
	        } else if (areaId == "idx3") {
	            $(".mapImg").attr("src", "${pageContext.request.contextPath}/resources/images/imgmap3.png");
	            farmId = 30;
	        } else if (areaId == "idx4") {
	            $(".mapImg").attr("src", "${pageContext.request.contextPath}/resources/images/imgmap4.png");
	            farmId = 40;
	        }
	        
	        // <div> 표시하거나 숨기는 함수 호출
	        toggleContent(areaId);

	        if (farmId) {
	            $.ajax({
	                url: "${pageContext.request.contextPath}/farm/farmInfo",
	                type: "GET",
	                data: { farmId: farmId },
	                success: function (response) {
	                    // 컨트롤러에서 받은 응답 확인
	                    console.log(response);

	                    // 결과를 사용하여 입력 상자의 값(ul>li) 설정
	                    $("#farmNameList").html('<li>' + response.farmName + '</li>');
	                    $("#farmZoneList").html('<li>' + response.farmZone + '</li>');
	                    $("#farmItemList").html('<li>' + response.farmItem + '</li>'); 
	                    $("#farmContentList").html('<li>' + response.farmContent + '</li>');
	                    $("#farmNameList2").html('<li>' + '#' + response.farmName + '</li>');
	                    
	                    
	                    const items = response.farmItem.split(",");
	                    let $select = $('<select></select>');

	                    items.forEach((item) => {
	                    	 $select.append($("<option></option>").attr("value", item.trim()).text(item.trim()));
	                    });

	                    // 생성된 옵션을 <select>에 추가하고 다시 그려줍니다.
	                     $("#farmItemList2").html($select.html());
	                    console.log(farmItemList2);
	                  },
	                  error: function (error) {
	                    // 오류 처리 코드
	                },	                 
		          });
		        }
		  });
	});		
	
			// 농장앨범 포토 슬라이드
		    const swiper = new Swiper('.swiper', {
		    	  autoplay: true,
		    	  loop: true,
		    	  speed: 1000,
		          slidesPerView: 3,
		          spaceBetween: 30
		          
		    	 });
			
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />