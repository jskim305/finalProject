<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<head>
  <title>무통장 입금 안내</title>
</head>

	<div class="container">
		<div class="pay-area">
		  <h1>무통장 입금 안내</h1>
		  <p>아래는 무통장 입금을 위한 계좌 정보입니다. 입금 시 아래 계좌로 송금해주시기 바랍니다.</p>
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
		  <p>입금 완료 후 아래 연락처로 연락하여 입금 확인을 안내해주시기 바랍니다.</p>
		  <p>베지팜 고객센터: XXXX-XXXX</p>
		  <p>이메일: vegefarm@naver.com</p>
		  
		  <div class="btn-area">
			<button type="submit" class="btn-reservation" onclick="iamport()">결제하기</button>
		 </div>
		<div>
		<img alt="" src="${pageContext.request.contextPath}/resources/images/money.jpg">
		</div>
		</div>	
	</div>

<style>
	.pay-area {margin: 70px 0}
	.pay-area h1 {margin-bottom: 10px}
	.pay-area p {margin-bottom: 10px}
	.pay-area table {margin-bottom: 10px; padding: 20px; background: #eee;  border-collapse: separate; border-spacing: 10px 0;}
</style>

<script>

	function iamport(){
		//가맹점 식별코드
		IMP.init('imp13608827');
		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card', //생략 가능
		    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호
		    //merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '상품1' , //결제창에서 보여질 이름
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
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>




