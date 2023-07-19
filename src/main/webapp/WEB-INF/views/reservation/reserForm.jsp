<%@page import="com.kh.finalProject.sector.model.vo.Sector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/main.css?v=<%System.currentTimeMillis(); %>"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<!-- header가 없음으로 링크 걸어두었습니다.  -->


<img class="logo"
	src="${pageContext.request.contextPath}/resources/images/v22_2.png"
	alt="logo"
	onclick="location.href='${pageContext.request.contextPath}/index.jsp'">




<!-- 예약자가 보기 편하게 확인하는 form  -->
<div class="a">
	<h1>예약정보 상세확인</h1>
	<small>*수정필요시 처음부터 다시 시도해 주세요</small>
	<form
		action="${pageContext.request.contextPath}/reservation/reserSelect.me"
		method="get">
		<h3 style="font-size: 20px;">[농장 정보]</h3>
		<div class="row">
			<div class="col">
				<label for="farm_name">[예약구역명]</label> <input
					value="${radio.sectorName }" readonly>
			</div>
			<div class="col">
				<label for="section_number">[구역번호]</label> <input
					value="${radio.sectorNo }" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<label for="price">[금액]</label> <input id="price" name="price"
					value="${radio.sectorPrice }" readonly>
			</div>
			<div class="col">
				<label>[예약 상태]</label> <input value="예약가능" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<label for="start">[예약 시작일]<small style="font-size: 5px;">(마감일정을
						확인해 주세요)</small></label> <input name="start" value="" readonly>

			</div>
			<div class="col">
				<label for="crop">[작물]</label> <input value="${sessionScope.hItem1}"
					readonly>
			</div>
		</div>
		<h3 style="font-size: 20px;">[예약 정보]</h3>
		<div class="row">
			<div class="col">
				<label for="name">[예약자명]</label> <input type="text" id="" name=""
					value="${loginMember.memId}" readonly>
			</div>

			<div class="col">
				<label for="phone_number">[전화번호]</label> <input type="tel" id=""
					name="phone_number" value="${loginMember.memTel}" readonly>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<label for="address">[예약자 주소]</label> <input
					value="${loginMember.memAddr }" readonly>
			</div>

			<div class="col">
				<label for="email">[이메일]</label> <input type="email" id="email"
					name="email" value="${loginMember.memEmail }" readonly>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<label for="total_amount">[결제금액]</label> <input id="money"
					value="${radio.sectorPrice }" readonly>
			</div>
		</div>
	</form>


	<div class="col">
		<input id="x" class="btn btn-warning" style="border-radius: 20px;"
			data-toggle="modal" data-target="#memberModal" value="결제하러가기">
	</div>
	<div class="col">
		<input type="button" onclick="window.history.back()" value="취소">
	</div>






	<!--예약자의 정보가 insert 되어지는값 네임이 키 필드명이다 맵퍼에 네임으로 환산-->
	<form id="myForm"
		action="${pageContext.request.contextPath}/reservation/reserInsert.do"
		method="post" onsubmit="return check()">
		<div class="row">
			<input type="hidden" value="${radio.sectorNo}" name="rezNo"
				placeholder="예약번호"> <input type="hidden"
				value="${loginMember.memId}" name="memId" placeholder="예약자id">
			<input type="hidden" value="${radio.farmNo}" name="farmNo"
				placeholder="농장번호"> <input type="hidden"
				value="${radio.sectorNo}" name="rezZone" placeholder="예약구역">
			<input type="hidden" value="1" name="rezStatus" placeholder="예약가능상태">
			<input type="hidden" value="${radio.sectorSchdule}" name="rezStart"
				placeholder="예약시작일"> <input type="hidden"
				value="${radio.sectorPrice}" name="rezPrice" placeholder="총금액">
			<input type="hidden" value="${sessionScope.hItem1}" name="rezItem"
				placeholder="키울작물">
		</div>
	</form>






</div>









<!-- 결제툴 모달 -->
<div class="modal" id="memberModal" tabindex="-1" role="dialog"
	aria-labelledby="memberModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="memberModalLabel">결제하기</h5>
			</div>
			<div class="modal-body">




				<div class="container">
					<div class="pay-area">

						<table width="700" border="1">
							<tr>
								<th width="5%">
									<h4>무통장입금</h4>
								</th>
								<td width="80%"><input type="radio" id="paymentMethod"
									name="paymentMethod" value="dwob" checked> <label
									for="paymentMethod">무통장입금(가상계좌)</label>
									<table>
										<tr>
											<td width="20%">입금은행</td>
											<td width="80%"><select id="bank" name="bank"
												style="font-size: 13pt">
													<option value="notSelect">선택</option>
													<option value="농협은행">농협은행</option>
													<option value="국민은행">국민은행</option>
													<option value="신한은행">신한은행</option>
													<option value="우리은행">우리은행</option>
													<option value="KEB하나은행">KEB하나은행</option>
													<option value="기업은행">기업은행</option>
													<option value="대구은행">대구은행</option>
													<option value="부산은행">부산은행</option>
													<option value="우체국">우체국</option>
													<option value="경남은행">경남은행</option>
													<option value="광주은행">광주은행</option>
													<option value="SC제일은행">SC제일은행</option>
													<option value="수협은행">수협은행</option>
											</select></td>
										</tr>

										<tr>
											<td>입금기한</td>
											<td>
												<div id="deadLine"></div> <script>
                        // 현재 날짜와 시간을 얻기 위해서 Date 객체를 생성합니다.
                        var today = new Date();
                        // 시간 정보를 가져옵니다.
                        var time = today.getHours();                     
                        // 마감 시간을 설정하기 위한 변수를 초기화합니다.
                        var deadline;                       
                        // 현재 시간이 16시 이전이면 오늘을 기준으로 설정합니다.
                        if (time <= 16) {
                          deadline = new Date(today.getFullYear(), today.getMonth(), today.getDate(), 18, 30); // 18시 30분이 마감시간
                        }
                        else {
                          // 현재 시간이 16시 이후면 내일을 기준으로 설정합니다.
                          var tomorrow = new Date(today.getFullYear(), today.getMonth(), today.getDate() + 1, 9, 30); // 9시 30분이 마감시간
                          deadline = tomorrow;
                        }                  
                        // 마감 날짜 및 시간을 "월/일 시간" 형식으로 출력하기 위한 함수를 생성합니다.
                        function formatDate(date) {
                          var month = ('0' + (date.getMonth() + 1)).slice(-2);
                          var day = ('0' + date.getDate()).slice(-2);
                          var hour = ('0' + date.getHours()).slice(-2);
                          var minute = ('0' + date.getMinutes()).slice(-2);
                          return month + "월 " + day + "일 " + hour + "시 " + minute + "분까지";
                        }
                        // 위에서 정의한 함수를 이용해서 deadline을 문자열로 변환한 후 출력합니다.
                        var deadlineString = formatDate(deadline);
                        document.getElementById("deadLine").innerHTML = deadlineString;
                     </script>
											</td>
										</tr>
									</table></td>
							</tr>


							<tr>
								<th width="20%">
									<h4>카드결제</h4>
								</th>
								<td width="80%"><input type="radio" id="paymentMethod2"
									name="paymentMethod" value="dwob" checked> <label
									for="paymentMethod2">카드결제(카카오페이)</label>
									<table>
										<tr>
											<td>
											<input type="hidden" id="money"
												value="${radio.sectorPrice}"> 
												<input type="hidden" id="memId" value="${reservation.getMemId()}"> 
												<input type="hidden" id="sName" value="${radio.sectorName}">
												<input type="hidden" id="email" value="${reservation.getMemEmail()}"> 
												<input type="hidden" id="phone" value="${reservation.getMemTel()}">
												<input type="hidden" id="addr" value="${reservation.getMemAddr()}">
												<div >
													<button type="submit" class="btn-reservation" onclick="iamport()" onsubmit="check()" style="border: none;">결제하기
													 	<img src="${ pageContext.request.contextPath}/resources/images/kakaoButton.png" />
													</button>
												</div>
												</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<h1>무통장 안내사항</h1>
						<p>아래는 무통장 입금을 위한 계좌 정보입니다. 입금 시 아래 계좌로 송금해주시기 바랍니다.</p>
						<p>입금 완료 후 아래 연락처로 연락하여 입금 확인을 안내해주시기 바랍니다.</p>
						<div>
							<img alt=""
								src="${pageContext.request.contextPath}/resources/images/money.jpg">
						</div>
					</div>
				</div>
			<!-- 여기까지 -->
			</div>
		</div>
	</div>
</div>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script>
      function iamport(){
         
          var id = document.getElementById("memId").value;
          var price = document.getElementById("money").value;
          var pname = document.getElementById("sName").value;
          var send = document.getElementById("email").value;
          var cell = document.getElementById("phone").value;
          var pos = document.getElementById("addr").value;
          
         //가맹점 식별코드
         IMP.init('imp13608827');
         IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card', //생략 가능
            merchant_uid: "order_no_0001" + new Date().getTime(),
             //merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
             //merchant_uid : 'merchant_' + new Date().getTime(),
             name : pname, //결제창에서 보여질 이름
             amount : price, //실제 결제되는 가격
             buyer_email : send,
             buyer_name : id,
             buyer_tel : cell,
             buyer_addr : pos,
         }, function(rsp) {  //callback 로직
            console.log(rsp);
             if ( rsp.success ) {
                 document.getElementById("myForm").submit();
                var msg = '결제가 완료되었습니다.';
                var msg2 = '농장예약 페이지로 이동합니다.';
                 msg += '고유ID : ' + rsp.imp_uid;
                 msg += '상점 거래ID : ' + rsp.merchant_uid;
                 msg += '결제 금액 : ' + rsp.paid_amount;
                 msg += '카드 승인번호 : ' + rsp.apply_num;
                				
                 alert(msg);
                 alert(msg2); 
               
             } else {
                 var msg = '결제에 실패하였습니다.';
                 msg += '에러내용 : ' + rsp.error_msg;
                 alert(msg);
             }
         });
     }

   
	</script>









<!-- 백그라운드 -->
<div id="back">
	<div class="imgaaa">
		<div class="imgview apple" id="1"></div>
	</div>
</div>
<div id="bg"></div>


<script>
	   	//예약날짜 치환
	    switch(${radio.sectorSchdule}){
	    case 1: 
	    	num = "1월~3월";
	    	console.log(num);
	    	break;
	    case 2:    	
	    	num="4~6월";  
	    	break;
	    case 3:
	    	num="7월~9월";   
	    	break;
	    default: 
	    	   break;
	    }
	    $('input[name=start]').attr('value',num);    	   
	    </script>


<script>
	    // 인설트 되기전에 확인 confirm 하기
	    function check(){   	
	   		var check_submit=confirm('확인시 결제페이지로 이동합니다.');
	    return check_submit;    
	    }
	    </script>



<style>
.pay-area {
	margin: 70px 0
}

.pay-area h1 {
	margin-bottom: 10px
}

.pay-area p {
	margin-bottom: 10px
}

.pay-area table {
	margin-bottom: 10px;
	padding: 20px;
	background: #eee;
	border-collapse: separate;
	border-spacing: 10px 0;
}

.logo {
	margin: auto;
	display: block;
}

#back {
	width: 100%;
	height: 100%;
	max-height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: fixed;
	top: 0;
	left: 0;
	z-index: -1;
	max-width: 100%;
	background-color: black;
}

#back .imgaaa {
	position: relative;
	width: 100%;
	height: 100%;
}

#back .imgview {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	/*   -webkit-transition: opacity 1s ease-in-out;
	        -moz-transition: opacity 1s ease-in-out;
	        -o-transition: opacity 1s ease-in-out;
	        transition: opacity 1s ease-in-out; */
	/* 	        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
 */ /*  filter: alpha(opacity=0); */
	opacity: 0;
}

#back .imgview:nth-child(1) {
	background:
		url(${pageContext.request.contextPath}/resources/images/pexels-photo-5677794.jpeg)
		0 0 no-repeat;
	background-size: cover;
}

#back .imgview.apple {
	opacity: 1;
	/* 	        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
 */ /*  filter: alpha(opacity=1);      */
}

body {
	font-family: Arial, sans-serif;
}

.a {
	border-radius: 20px;
	max-height: 780px;
	max-width: 700px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.a label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.a input {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.a .row {
	display: flex;
	align-items: center;
}

.a .row .col {
	flex: 1;
	margin-right: 10px;
}

.a input[type="submit"], .a input[type="button"] {
	border-radius: 20px;
	background-color: #4caf50;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.a input[type="submit"]:hover, .a input[type="button"]:hover {
	background-color: #45a049;
}
}
</style>

<pre>






</pre>
</html>

