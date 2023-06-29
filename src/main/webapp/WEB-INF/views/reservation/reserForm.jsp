<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">


<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
    body {background-color: #f5f5f5;font-family: Arial, sans-serif;}
    .form-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .form-container h3 {
        margin-top: 0;
        margin-bottom: 20px;
        color: #4caf50;
        font-size: 20px;
    }
    .form-container label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }
    .form-container input[type="text"],
    .form-container input[type="number"],
    .form-container input[type="tel"],
    .form-container input[type="email"],
    .form-container input[type="date"],
    .form-container textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        }
    .form-container .form-row {
        display: flex;
        align-items: center;
    }
    .form-container .form-row .form-col {
        flex: 1;
        margin-right: 10px;
    }
    .form-container input[type="submit"],
    .form-container input[type="reset"] {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 4px;
        background-color: #4caf50;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .form-container input[type="submit"]:hover,
    .form-container input[type="reset"]:hover {
        background-color: #45a049;
    }
    
  
	
}
    
    
    
    
    
    
</style>  <!-- 예약자가 보기 편하게 확인하는 form  -->
<div class="form-container">
    <form  action="${pageContext.request.contextPath}/reservation/reserSelect.me" method="get">
        <h3>농장 정보</h3>
        <div class="form-row">
            <div class="form-col">
                <label for="farm_name">농장</label>
                <input type="text" id="farm_name" name="farm_name" placeholder="농장이름" readonly>
            </div>	
            <div class="form-col">
                <label for="section_number">구역번호</label>
                <input type="text" id="section_number" name="section_number" placeholder="구역번호" readonly>
            </div>
        </div>
        <div class="form-row">
            <div class="form-col">
                <label for="price">금액</label>
                <input type="number" id="price" name="price" placeholder="금액" readonly>
            </div>
            <div class="form-col">
                <label for="reservation_status">예약 상태</label>
                <input type="text" id="reservation_status" name="reservation_status" placeholder="예약상태" readonly>
            </div>
        </div>
        <div class="form-row">
            <div class="form-col">
                <label for="start_date">예약 시작일</label>
                <input type="date" id="start_date" name="start_date" readonly>
            </div>
            <div class="form-col">
                <label for="crop">작물</label>
                <input type="text" id="crop1" name="crop" placeholder="예시) 감자" readonly>
            </div>
        </div>
        <h3>예약 정보</h3>
        <div class="form-row">
            <div class="form-col">
                <label for="name">예약자명</label>
                <input type="text" id="rno" name="name" readonly>
            </div>

            <div class="form-col">
                <label for="phone_number">전화번호</label>
                <input type="tel" id="phone_number" name="phone_number" readonly>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col">
                <label for="address">예약자 주소</label>
                <input type="text" id="address" name="address" readonly>
            </div>

            <div class="form-col">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" readonly>
            </div>
        </div>

        <div class="form-row">
            <div class="form-col">
                <label for="total_amount">총 결제금액</label>
                <input type="number" id="total_amount" name="total_amount" readonly>
            </div>
        </div>
    </form>
    
    <!--예약자의 정보가 insert 되어지는값  -->
    <form action="${pageContext.request.contextPath}/reservation/reserInsert.do" method="post" onsubmit="return check()">
    <div class="form-row">
    	<input type="text" value="" name="rNo" placeholder="예약번호">
    	<input type="text" value="" name="mId" placeholder="예약자id">
    	<input type="text" value="" name="fNo" placeholder="농장번호">
    	<input type="text" value="" name="rZone" placeholder="예약구역">
    	<input type="text" value="" name="rStatus" placeholder="예약가능상태">
    	<input type="text" value="" name="rStart" placeholder="예약시작일">
    	<input type="text" value="" name="rPrice" placeholder="총금액">
    	<input type="text" value="" name="rItem" placeholder="키울작물">
    	    
   <!-- <input type="hidden" placeholder="예약번호">
    	<input type="hidden" placeholder="예약자id">
    	<input type="hidden" placeholder="농장번호">
    	<input type="hidden" placeholder="예약구역">
    	<input type="hidden" placeholder="예약가능상태">
    	<input type="hidden" placeholder="예약시작일">
    	<input type="hidden" placeholder="총금액">
    	<input type="hidden" placeholder="키울작물">   -->  
            <div class="form-col">
                <input type="submit" value="예약하기">
            </div>
                
            <div class="form-col">
                <input type="reset" value="취소">
            </div>
     </div>
    </form>
    
    <script>
    function check()
    {
    /* confirm 함수는 확인창 결과값으로 TRUE 와 FALSE 값을 return 하게 된다*/
    var check_submit=confirm('예약하시겠습니다');
    return check_submit;
    
    }
    </script> 
    
    
    
    
    
    
</div>
<div id="map" style="width:500px;height:400px;">
<div id="map" style="width:500px;height:400px;"></div>




	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cae32d26dc4bc205934ad2152e3c8528"></script>
	
	
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.5338151, 126.8969784),
			level: 2 // 확대 레벨인데 2가 적당한거 같아요 
		};
		var map = new kakao.maps.Map(container, options);
		
		var imageSrc = '${pageContext.request.contextPath}/resources/images/marker.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
		
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption); //마커이미지설정입네다
		var markerPosition  = new kakao.maps.LatLng(37.5338151, 126.8969784); //마커 포지션이에여 지도 위치랑 같아요
	    
	    
		var marker = new kakao.maps.Marker({ //마커생성
		    position: markerPosition, // 포지션 설정립네다
		    image: markerImage	// 이건 이미지 설정
		});
		
		
		marker.setMap(map); // 마커 표시 시작

	</script>

</div>








<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>

