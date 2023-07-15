<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orders/ordersForm.css?v=<%System.currentTimeMillis(); %>">

<style>
.closeBtn {
	float: right;
}
	
.sanda-button {
	display: block;
    width: 100%;
    padding-top: 1px;
    height: 34px;
    margin-top: 5px;
    border: 1px solid #ccc;
    font-size: 12px;
    background-color: #ff3e3e;
    border-color: #ff3e3e;
    color: #fff;
    font-family: "Spoqa-Bold", -apple-system, BlinkMacSystemFont, "Apple SD Gothic Neo", Arial, sans-serif !important;
}

</style>

<br>
<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h2 class="mb-3">주문확인 및 결제
        	<img class="closeBtn" src="${pageContext.request.contextPath}/resources/images/icon-cancel.png"
        							   onclick="history.back();">
      	</h2> 
      	<hr><br>
      	
          <h4>구매자정보 (ID : ${loginMember.memId})</h4>
          <table class="orders-table">
				<tr>
					<td>이름</td>
					<td class="noRight">${loginMember.memName}</td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td class="noRight">${loginMember.memEmail}</td>
				</tr>
				
				<tr>
					<td>휴대폰 번호</td>
					<td class="noRight">${loginMember.memTel}</td>
				</tr>
          </table>
			<br><br>
			
		<form action="${pageContext.request.contextPath}/orders/ordersPayment.or" method="post">
          <h4>받는사람정보&emsp;<input type="button"  id="addrEditBtn" value="정보 변경"></h4>
          <table class="orders-table">
				<tr>
					<td> 이름 </td>
		            <td class="noRight">
		              <input type="text" id="ordersName" name="ordersName" value="${loginMember.memName}"  readonly style="border:none; font-size:15px">
		            </td>
				</tr>
				
				<tr>
					<td> 배송주소</td>
					<td class="noRight">
						<input type="text" id="ordersAddr" name="ordersAddr" value="${loginMember.memAddr}" readonly style="border:none; font-size:15px">
					</td>
				</tr>
				
				<tr>
					<td>연락처</td>
					<td class="noRight">
						<input type="text" id="ordersTel" name="ordersTel" value="${loginMember.memTel}" readonly style="border:none; font-size:15px">
					</td>
				</tr>
				
				<tr>
					<td>배송 요청사항</td>
					<td>
						<input type="text" id="ordersReq" name="ordersReq" style="font-size:18px; width:80%;" required>
					</td>
				</tr>
          </table>
          <br><br>
          
          <h4>주문 상품</h4>
          <!-- 현재 여기에 강혁이 페이지에서 List<Item> => paymentList라고 명명 -->
          <table class="orders-table">
	         <c:forEach var="item" items="${paymentList}">
	         	<tr>
					<td>
		     			<img src="${pageContext.request.contextPath}/resources/images/itemlogo/${item.itemLogo}" alt="logo"> 
					</td>
					<td>
						<h5 class="itemname">${item.itemName}  - ${item.cartCount}개</h5>
						<h5 class="itemPrice">상품가격 <fmt:formatNumber value="${item.itemPrice}" pattern="###,###,###"/>원</h5>
					</td>
					<td>
		        		<h4>
							<c:set var="total" value="${item.itemPrice * item.cartCount}"/>
							<fmt:formatNumber value="${total}" pattern="###,###,###"/>원
						</h4>
					</td>
				</tr>
	          </c:forEach>
	          
	          <c:forEach var="item" items="${paymentList}">
			  		<c:set var="ordersCount" value="${ordersCount + item.cartCount}" />
			  		<c:set var="ordersPrice" value="${ordersPrice + (item.itemPrice*item.cartCount)}" />
	          </c:forEach>
	          <tr>
	          	  <td></td>
		          <td>
		          	  <h4>총 수량</h4>
			          <h4>
			          	<c:out value="${ordersCount}개"></c:out>
			          </h4>
	          	  </td>
	          	  <td>
	          	  	  <h4>최종 결제금액</h4>
	          		  <h4>
	          		  	<fmt:formatNumber value="${ordersPrice}" pattern="###,###,###"/>원
	          		  </h4>
	          	  </td>
	          </tr>
          </table>
          <!-- 위 forEach에서 total은 하나의 상품의 갯수와 가격을 곱한 가격임
          그래서 모든 물품(cart)에서의 총 합이 아니므로 이걸 합해서 총합을 ordersPrice로 넘겨줘야
          또한, 모든 물품의 갯수를 더해서 ordersCount로 넘겨야 함-->
          <br><br>

		<!-- orders 테이블에 넣기 위해 같이 넘기는 값 -->
			<input type="hidden" id="memId" name="memId" value="${loginMember.memId}">
			<input type="hidden" id="ordersCount" name="ordersCount" value="${ordersCount}">
			<input type="hidden" id="ordersPrice" name="ordersPrice" value="${ordersPrice}">

          <table width="900" border="1">
			<tr>
				<td width="20%"> 
					<h4>결제 방법</h4>
				</td>
				
	            <td width="80%">
            	  <input type="radio" id="paymentMethod" name="paymentMethod" value="dwob" checked>
            	  <label for="paymentMethod">무통장입금(가상계좌)</label>
            	  
            	  <table>
            	  	<tr>
            	  		<td width="20%">입금은행</td>
            	  		<td width="80%">
            	  			<select id="bank" name="bank" style="font-size:13pt">
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
            	  			</select>
            	  		</td>
            	  	</tr>
            	  	
            	  	<tr>
            	  		<td>입금기한</td>
            	  		<td>
            	  			<div id="deadLine"></div>
							<script>
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
            	  </table>
	            </td>
			</tr>
          </table>
          
          <br><hr class="mb-4">
          
          <button class="sanda-button" type="submit">결제하기</button>
          
		</form>

      </div>
    </div>
  </div>
<br><br><br><br>


<script>
	document.querySelector("#addrEditBtn").addEventListener('click', (e) => {
		$('#ordersName').prop('readonly', false);
		$('#ordersName').prop('required', true);
		$('#ordersAddr').prop('readonly', false);
		$('#ordersAddr').prop('required', true);
		$('#ordersTel').prop('readonly', false);
		$('#ordersTel').prop('required', true);
		$('#ordersName').attr('style', "border:1px solid; font-size:18px;");
		$('#ordersAddr').attr('style', "border:1px solid; font-size:18px; width:80%;");
		$('#ordersTel').attr('style', "border:1px solid; font-size:18px; width:80%;");
	});
	
	window.onload = function(){	
	 	document.getElementById("ordersAddr").addEventListener("click", function(){
			new daum.Postcode({
	        	oncomplete: function(data) {
					let roadAddr = data.roadAddress;
					let jibunAddr = data.jibunAddress;
					let extraAddr = '';
					
					// extraAddr
					if(roadAddr !='' || jibunAddr !=''){
						if(data.bname != ''){
								extraAddr += data.bname;
							}
							if(data.buildingName != ''){
								extraAddr += extraAddr != '' ? ', ' + data.buildingName : data.buildingName
							}
					}
					
					if(data.userSelectedType=="R"){
						if(roadAddr != ''){
							roadAddr += extraAddr != ''? '(' + extraAddr + ')' : '';
							document.getElementById("ordersAddr").value = roadAddr;
						}
					}
					else if(data.userSelectedType=="J"){
						if(jibunAddr != ''){
							jibunAddr += extraAddr != ''? '(' + extraAddr + ')' : '';
							document.getElementById("ordersAddr").value = jibunAddr;
						}
					}
					
					document.getElementById("ordersAddr").focus();
		    	}
	   		}).open();
	 	});
	}	
	
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>