<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="vegform" name="title"/>
</jsp:include>

	<!-- swpier 슬라이드 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<div class="container">	
		
			<div class="reservation-info">
				<!-- 지도영역 -->
				<div class="map-area">
					<img
						src="${pageContext.request.contextPath}/resources/images/imgmap.png"
						usemap="#image-map" class="mapImg" >
						
					<map name="image-map">				
						<area target="_blank" alt="군포" title="군포주말농장" onblur="this.focus()" nohref
							coords="141,313,130,322,123,333,134,335,145,332,150,321"
							shape="poly" id="idx1">
						<area target="_blank" alt="양주" title="양주" onblur="this.focus()" nohref
							coords="159,211,146,211,137,208,140,190,141,177,133,172,131,158,142,151,147,137,153,124,162,127,165,139,172,146,187,151,190,171,185,178,173,183,161,182,159,190,163,198,163,205"
							shape="poly" id="idx2">
						<area target="_blank" alt="시흥" title="시흥" onblur="this.focus()" nohref
							coords="82,336,88,330,95,325,105,320,114,317,126,319,129,311,121,306,117,298,112,288,101,281,94,296,84,311,89,315,75,324,76,330"
							shape="poly" id="idx3">
						<area target="_blank" alt="남양주" title="남양주" onblur="this.focus()" nohref
							coords="237,267,243,254,249,244,250,234,256,224,253,206,242,180,217,184,197,187,182,208,184,222,197,222,200,236,204,245,210,241,222,249,224,258"
							shape="poly" id="idx4">
					</map>
				</div>
				
			<!-- 정보영역 -->
			<form action="${pageContext.request.contextPath}/farm/checkFarm.do" method="post" >
				<div class="info-area">
				   <ul>
			        <li>
			            <div class="title">농장이름</div>
			            <ul id="farmNameList">
			            </ul>
			        </li>
			
			        <li>
			            <div class="title">농장지역</div>
			            <ul id="farmZoneList">
			            </ul>
			        </li>
			
			        <li>
			            <div class="title">재배가능작물</div>
			            <ul id="farmItemList"></ul>
			            &nbsp;1. <input type="text" size="12" name="hItem1" placeholder="희망재배작물">
			            &nbsp;2. <input type="text" size="12" name="hItem2" placeholder="희망재배작물">
			            &nbsp;3. <input type="text" size="12" name="hItem3" placeholder="희망재배작물">
			        </li>
			
			        <li>
			            <div class="title">농장정보</div>
			            <ul id="farmContentList"></ul>  
			        </li>	
				
			        <li>
			            <div class="title">금액</div>
			            <ul id="sectorPriceList"></ul>         
			        </li>
						
					<div class="title">구역</div>
						<div class="set">
							<input type="radio" name="set" value="1"/> 
							<label>1</label>
							<input type="radio" name="set" value="2"/>
							<label>2</label>
							<input type="radio" name="set" value="3"/>
							<label>3</label>
							<input type="radio" name="set" value="4"/>
							<label>4</label>
						</div>
					
					<div class="title">기간</div>
						<div class="txt">
							<input type="radio" name="period" value="1(3~5월)"/>
							<label>1(3~5월)</label>  
							<input type="radio" name="period" value="2(6~8월)"/>
							<label>2(6~8월)</label>
							<input type="radio" name="period" value="3(9~11월)"/>
							<label>3(9~11월)</label>
						</div>
				    </ul>
				</div>
					
				<div class="btn-area">
					<button type="button" class="btn-reservation" name="frm" id="rezBtn">예약하기</button>
					<button type="reset" class="btn-reset">초기화</button>
				</div>	
				<input type="hidden" name="farmNo" value="${selectedFarm.farmNo}">
			</form>		
		</div>
	</div>
			
		<div class="photo-area">
			<ul>
				<li>
			       <div class="title">@</div>
			          <ul id="farmNameList"></ul>
			    </li>
			</ul>

			<div class="swiper">
					  <div class="swiper-wrapper">
					    <!-- Slides -->
					    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f1.png"></div>
					    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f2.png"></div>
					    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f3.png"></div>
					    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f4.png"></div>
					    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/f5.jpg"></div>
					    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/images/soilhands.jpg"></div>
					  </div>
					  <!-- <div class="swiper-button-prev"></div>
					  <div class="swiper-button-next"></div> -->
			</div>
		</div>			
		
		<style>
			.reservation-info{display: flex; justify-content: space-between; margin: 70px 0}
			.reservation-info > div {width: 46%}
			.reservation-info .map-area {text-align: center}
			.reservation-info .info-area ul {background: #f3f3f3; overflow-y: auto; padding: 20px}
			.reservation-info .info-area li+li {margin-top: 15px}
			.reservation-info .info-area .title {margin-bottom: 3px; font-weight: bold}
			.reservation-info .btn-area {margin-top: 20px; text-align: center}
			.reservation-info .btn-area button {width: 100px; padding:10px 0; border: 0; cursor: pointer}
			.reservation-info .btn-area button+button {margin-left: 5px}
			.reservation-info .btn-area .btn-reservation {background: #73a839; color: #fff}
			.reservation-info .map-area area {cursor: pointer}
			.photo-area {margin-bottom: 70px}
			.photo-area .title {display: block; margin-bottom: 15px; position: relative; padding-left: 10px}
			.photo-area .title:before {content: ""; position: absolute; top: 2px; left: 0; width: 3px; height: 18px; background: #333}
			.photo-area img {width: 100%; vertical-align: top}
			.photo-area .swiper-button-next, .photo-area .swiper-button-prev{color: #73a839}
		</style>

		<script type="text/javascript">
		
		document.querySelector("#rezBtn").addEventListener("click", (e) =>{
			$.ajax({
				url: "${pageContext.request.contextPath}/reservation/rezForm";
                type: "POST",
                data: { farmNo: farmNo }, // 여기에 sectorNo, FarmNo, period, farmItem 4개 넣어서 보내면 될 듯
                success: function (data) {
				frm.submit();	
				
			});
			
		});
		
		$('#radioButton').click(function () {
		    var radio_name = [];
		    var radio_name_val = {};
		    var radio = $("input[type=radio]");

		    $.each(radio, function (key, value) {
		        if ($(value).is(":checked")) {
		            radio_name_val[$(value).attr('name')] = $(value).val();
		        }
		    });

		    console.log(radio_name_val);
		});

		
		$(document).ready(function () {
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

		        if (farmId) {
		            $.ajax({
		                url: "${pageContext.request.contextPath}/farm/farmInfo",
		                type: "GET",
		                data: { farmNo: farmId },
		                success: function (data) {
							console.log(data);
		                    $("#farmNameList").html('<li>' + data.selectedFarm.farmName + '</li>');
		                    $("#farmZoneList").html('<li>' + data.selectedFarm.farmZone + '</li>');
		                    $("#farmItemList").html('<li>' + data.selectedFarm.farmItem + '</li>');
		                    $("#farmContentList").html('<li>' + data.selectedFarm.farmContent + '</li>');
		                    
		                    if(data.selectedFarm.farmNo == 10)
		                    	$("#sectorPriceList").html('<li>' + "375,000원" + '</li>');
		                    else if(data.selectedFarm.farmNo == 20)
		                    	$("#sectorPriceList").html('<li>' + "410,000원" + '</li>');
		                    else if(data.selectedFarm.farmNo == 30)
		                    	$("#sectorPriceList").html('<li>' + "386,000원" + '</li>');
		                    else
		                    	$("#sectorPriceList").html('<li>' + "390,000원" + '</li>');
		                    
		                },

		                   
		                error: function (error) {
		                    console.error(error);
		                },
		            });
		        }
		    });
		});		
			    // 포토 슬라이드
			    const swiper = new Swiper('.swiper', {
			    	  autoplay: true,
			    	  loop: true,
			    	  speed: 1000,
			          slidesPerView: 3,
			          spaceBetween: 30
			    	  /* navigation: {
			    	    nextEl: '.swiper-button-next',
			    	    prevEl: '.swiper-button-prev',
			    	  }, */
			    });			    
		</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />