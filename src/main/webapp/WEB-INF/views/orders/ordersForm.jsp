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
          <table class="orders-table1">
				<tr>
					<td>이름</td>
					<td>${loginMember.memName}</td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td>${loginMember.memEmail}</td>
				</tr>
				
				<tr>
					<td>휴대폰 번호</td>
					<td>${loginMember.memTel}</td>
				</tr>
          </table>
			<br><br>
			
		<%-- <form action="${pageContext.request.contextPath}/orders/ordersPayment.or" method="post"> --%>
		<form>
          <h4>받는사람정보&emsp;<input type="button"  id="addrEditBtn" value="정보 변경"></h4>
          <table class="orders-table1">
				<tr>
					<td> 이름 </td>
		            <td>
		              <input type="text" id="ordersName" name="ordersName" value="${loginMember.memName}"  readonly style="border:none; font-size:15px">
		            </td>
				</tr>
				
				<tr>
					<td> 배송주소</td>
					<td>
						<input type="text" id="ordersAddr" name="ordersAddr" value="${loginMember.memAddr}" readonly style="border:none; font-size:15px">
					</td>
				</tr>
				
				<tr>
					<td>연락처</td>
					<td>
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
            	  <label for="paymentMethod">카카오페이</label>
	            </td>
			</tr>
		  </table>
          <br><hr class="mb-4">
          
          <button class="sanda-button" id="iamport">결제하기</button>
          
		</form>

      </div>
    </div>
  </div>
<br><br><br><br>


<script>
	document.querySelector("#addrEditBtn").addEventListener('click', (e) => {
		var price = document.getElementById('ordersPrice').value;
		console.log(price);
	    //가맹점 식별코드
	    IMP.init('imp13608827');
	    IMP.request_pay({
	       pg : 'kakaopay',
	       pay_method : 'card', //생략 가능
	       merchant_uid: "order_no_0001" + new Date().getTime(),
	        //merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
	        //merchant_uid : 'merchant_' + new Date().getTime(),
	        name : 'vegFarm', //결제창에서 보여질 이름
	        amount : 100, //실제 결제되는 가격
	        buyer_email : 'iamport@siot.do',
	        buyer_name : '구매자이름',
	        buyer_tel : '010-1234-5678',
	        buyer_addr : '서울 강남구 도곡동',
	        buyer_postcode : '123-456'
	    }, function(rsp) {  // callback 로직
	       console.log(rsp);
	        if ( rsp.success ) {
	           var msg = '결제가 완료되었습니다.';
	            msg += '고유ID : ' + rsp.imp_uid;
	            msg += '상점 거래ID : ' + rsp.merchant_uid;
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            msg += '카드 승인번호 : ' + rsp.apply_num;
/* 	            
	            $.ajax({
	            	url : "${pageContext.request.contextPath}/orders/ordersPaymemt.or";
	            	method: "post";
	            	data : {}
	            });
 */	            
	            
	        } else {
	            var msg = '결제에 실패하였습니다.';
	             msg += '에러내용 : ' + rsp.error_msg;
	        }
	        alert(msg);
	    }
	});

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