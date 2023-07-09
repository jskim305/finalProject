<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="com.kh.finalProject.member.model.vo.Member" %> --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
 input{border: 1px; 
 }
</style>
<!--  부트스트랩 링크랑 스타일은 작업시 확인하기 위해 임시로 달았습니다 -->





<!-- 회원 조회 삭제 , 수정 폼       -------------------------------------->		
	<h2>관리자 페이지</h2>
	<div>
		<button  id="btn1" >회원조회,삭제</button>
		<table id="output1" class="table table-hover table-sm">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>생성날짜</th>
					<th>전화번호</th>
					<th>주소</th>	
					<th>이메일</th>	
					<th>회원구분</th>	
					<th>삭제여부</th>					
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>생성날짜</th>
					<th>전화번호</th>
					<th>주소</th>	
					<th>이메일</th>	
					<th>회원구분</th>	
					<th>삭제여부</th>	
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<button  id="btn2" >회원수정</button>
		<table id="output2" class="table table-hover table-sm">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>생성날짜</th>
					<th>전화번호</th>
					<th>주소</th>	
					<th>이메일</th>	
					<th>수정여부</th>	
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>생성날짜</th>
					<th>전화번호</th>
					<th>주소</th>	
					<th>이메일</th>					
					<th>수정여부</th>	
				</tr>
			</tbody>
		</table>
	</div>
	
<!-- 주문조회 삭제 , 수정 폼       -------------------------------------->	
	<div>	
		<button id="btn3">주문조회,삭제</button>
		<table id="output3" class="table table-hover table-sm">
			<thead>
				<tr>
					<th>주문상세번호</th>
					<th>주문번호</th>
					<th>상품번호</th>
					<th>가격</th>
					<th>갯수</th>
					<th>상품명</th>
					<th>삭제구분</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>주문상세번호</th>
					<th>주문번호</th>
					<th>상품번호</th>
					<th>가격</th>
					<th>갯수</th>
					<th>상품명</th>
					<th>삭제구분</th>
				</tr>
			</tbody>
		</table>
		<!--------------------  -->
		<button id="btn4">주문수정</button>
		<table id="output4" class="table table-hover table-sm">
			<thead>
				<tr>
					<th>주문상세번호</th>
					<th>주문번호</th>
					<th>상품번호</th>
					<th>가격</th>
					<th>갯수</th>
					<th>상품명</th>
					<th>수정구분</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>주문상세번호</th>
					<th>주문번호</th>
					<th>상품번호</th>
					<th>가격</th>
					<th>갯수</th>
					<th>상품명</th>
					<th>수정구분</th>
				</tr>
			</tbody>
		</table>	
	</div>
<!-- 예약조회 삭제 , 수정 폼       -------------------------------------->				
	<div>	
		<button id="btn5">예약조회,삭제</button>
		<table id="output5" class="table table-hover table-sm">
			<thead>
				<tr>
					<th>예약번호</th>
					<th>회원ID</th>
					<th>농장번호</th>
					<th>예약구역</th>
					<th>예약현황</th>
					<th>예약시작일</th>
					<th>총금액</th>
					<th>작물</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>예약번호</th>
					<th>회원ID</th>
					<th>농장번호</th>
					<th>예약구역</th>
					<th>예약현황</th>
					<th>예약시작일</th>
					<th>총금액</th>
					<th>작물</th>
				</tr>
			</tbody>
		</table>	
			<!--------------------  -->	
		<button id="btn6">예약수정</button>
		<table id="output6" class="table table-hover table-sm">
			<thead>
				<tr>
					<th>예약번호</th>
					<th>회원ID</th>
					<th>농장번호</th>
					<th>예약구역</th>
					<th>예약현황</th>
					<th>예약시작일</th>
					<th>총금액</th>
					<th>작물</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>예약번호</th>
					<th>회원ID</th>
					<th>농장번호</th>
					<th>예약구역</th>
					<th>예약현황</th>
					<th>예약시작일</th>
					<th>총금액</th>
					<th>작물</th>
				</tr>
			</tbody>
		</table>
	</div>
		
		
<!--회원조회 및 삭제----------------------------------------회원----------------->
<script>
$(document).ready(function() {
	  $("#btn1").click(function() {
	    $.ajax({
	      url: "${pageContext.request.contextPath}/member/list",
	      success: function(data) {
	        var value = "";
	        $.each(data, function(index, item) {
	          for (var i = 0; i < item.length; i++) {
	            value += "<tr>";
	            value += "<td>" + item[i].memId + "</td>";    
	            value += "<td>" + item[i].memName + "</td>";  
	            value += "<td>" + item[i].memBirth + "</td>"; 
	            value += "<td>" + item[i].memCreate + "</td>";
	            value += "<td>" + item[i].memTel + "</td>";   
	            value += "<td>" + item[i].memAddr + "</td>";  
	            value += "<td>" + item[i].memEmail + "</td>"; 
	            value += "<td>" + item[i].memStatus + "</td>";
	            value += "<td><button type='button' onclick='deleteMember(\"" + item[i].memId + "\")'>회원삭제</button></td>";
	            value += "</tr>";
	          }
	        });
	        $("#output1 tbody").html(value);
	      },
	      error: function() {
	        console.log("Error occurred");
	      }
	    });
	  });
	});

	function deleteMember(memId) {
	  $.ajax({
	    url: "${pageContext.request.contextPath}/member/adminDrop.my",
	    type: "POST",
	    data: { memId: memId },
	    success: function(){
	      alert("회원삭제가 완료되었습니다.");
	    },
	    error: function(xhr, status, error) {
	      console.log("Error occurred: " + xhr.responseText);
	    }
	  });
	}

</script>
			<!-- 회원수정 ---------------------------회원-->
<script>
	document.querySelector("#btn2").addEventListener('click', (e) => {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/member/list",
	        success(data) {
	        	console.log(data);
	        	
	            var value = "";
	            $.each(data, function(index, item) {
	            	 
	            	for (var i = 0; i < item.length; i++) {	
	            		value += "<tr>";
	                    value += "<td><input class='member-mid' value='" + item[i].memId + "' readonly></td>";
	                    value += "<td><input class='member-mname' value='" + item[i].memName + "' readonly></td>";
	                    value += "<td><input class='member-mbirth' value='" + item[i].memBirth + "'></td>";
	                    value += "<td><input class='member-mcreate' value='" + item[i].memCreate + "' readonly></td>";
	                    value += "<td><input class='member-mtel' value='" + item[i].memTel + "'></td>";
	                    value += "<td><input class='member-maddr' value='" + item[i].memAddr + "'></td>";
	                    value += "<td><input class='member-memail' value='" + item[i].memEmail + "'></td>";
	                    value += "<td><button type='button' class='update-button'>수정하기</button></td>";
	                    value += "</tr>"; 
	               }
	                $("#output2 tbody").html(value); 
	            });
	        },
	        error: console.log
	    });
	});

	$(document).on('click', '.update-button', function() {
	    var row = $(this).closest('tr');
	    var memId = row.find('.member-mid').val();
	    var memName = row.find('.member-mname').val();
	    var memBirth = row.find('.member-mbirth').val();
	    var memTel = row.find('.member-mtel').val();
	    var memAddr = row.find('.member-maddr').val();
	    var memEmail = row.find('.member-memail').val();
		  $.ajax({
		    url: "${pageContext.request.contextPath}/member/adminMemberUpdate.do",
		    type: "POST",
		    data: { 
		    	 	memId: memId,
		            memName: memName,
		            memBirth: memBirth,
		            memTel: memTel,
		            memAddr: memAddr,
		            memEmail: memEmail
		    },
		    success: function() {
		    	alert("회원정보 수정완료");
		    },
		    error: function(xhr, status, error) {
		      console.log("Error occurred: " + xhr.responseText);
		       }
		    });
		});
</script>


<!--주문조회 및 삭제--------------------------------------주문------------------->

<script>
$(document).ready(function() {
	  $("#btn3").click(function() {
	    $.ajax({
	      url: "${pageContext.request.contextPath}/orderDetail/adminOrderList.my",
	      success: function(data) {
	        var value = "";
	        $.each(data, function(index, item) {
	          for (var i = 0; i < item.length; i++) {
	            value += "<tr>";
	            value += "<td>" + item[i].detailNo + "</td>";    
	            value += "<td>" + item[i].ordersNo + "</td>";    
	            value += "<td>" + item[i].itemNo + "</td>";    
	            value += "<td>" + item[i].detailPrice + "</td>";    
	            value += "<td>" + item[i].detailCount + "</td>";
	            value += "<td>" + item[i].itemName + "</td>";
	            value += "<td><button type='button' onclick='adminOrderDeletes(\"" + item[i].detailNo + "\")'>주문삭제</button></td>";
	            value += "</tr>";
	          }
	        });
	        $("#output3 tbody").html(value);
	      },
	      error: function() {
	        console.log("Error occurred");
	      }
	    });
	  });
	});

	function adminOrderDeletes(detailNo) {
	  $.ajax({
	    url: "${pageContext.request.contextPath}/orderDetail/adminOrderDelete.my",
	    type: "POST",
	    data: { detailNo: detailNo },
	    success: function() {
	      alert("주문삭제가 완료되었습니다.");
	    },
	    error: function(xhr, status, error) {
	      console.log("Error occurred: " + xhr.responseText);
	    }
	  });
	}

</script>
			<!-- 주문수정 -------------------------주문 -->
<script>
	document.querySelector("#btn4").addEventListener('click', (e) => {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/orderDetail/adminOrderList.my",
	        success(data) {
	        	console.log(data);
	        	
	            var value = "";
	            $.each(data, function(index, item) {
	            	 
	            	for (var i = 0; i < item.length; i++) {	
	            		value += "<tr>";
	                    value += "<td><input class='order-d1' value='" + item[i].detailNo + "' readonly></td>";
	                    value += "<td><input class='order-d2' value='" + item[i].ordersNo + "' readonly></td>";
	                    value += "<td><input class='order-d3' value='" + item[i].itemNo + "' readonly></td>";
	                    value += "<td><input class='order-d4' value='" + item[i].detailPrice + "'></td>";
	                    value += "<td><input class='order-d5' value='" + item[i].detailCount + "'></td>";
	                    value += "<td><input class='order-d6' value='" + item[i].itemName + "'></td>";
	                    value += "<td><button type='button' class='update2-button'>수정완료</button></td>";
	                    value += "</tr>"; 
	               }
	                $("#output4 tbody").html(value); 
	            });
	        },
	        error: console.log
	    });
	});

	$(document).on('click', '.update2-button', function() {
	    var row = $(this).closest('tr');
	    var detailNo = row.find('.order-d1').val();
	    var ordersNo = row.find('.order-d2').val();
	    var itemNo = row.find('.order-d3').val();
	    var detailPrice = row.find('.order-d4').val();
	    var detailCount = row.find('.order-d5').val();
	    var itemName = row.find('.order-d6').val();
		  $.ajax({
		    url: "${pageContext.request.contextPath}/orderDetail/adminOrderUpdate.my",
		    type: "POST",
		    data: { 
		    		detailNo: detailNo,
		    		ordersNo: ordersNo,
		    		itemNo: itemNo,
		    		detailPrice: detailPrice,
		    		detailCount: detailCount,
		    		itemName: itemName
		    		
		    },
		    success: function() {
		    	alert("주문수정이 완료되었습니다.");
		    },
		    error: function(xhr, status, error) {
		      console.log("Error occurred: " + xhr.responseText);
		       }
		    });
		});
</script>




<!-- 예약조회 및 삭제-----------------------------------------예약-------------- -->
<script>
$(document).ready(function() {
	  $("#btn5").click(function() {
	    $.ajax({
	      url: "${pageContext.request.contextPath}/reservation/adminRezList.my",
	      success: function(data) {
	        var value = "";
	        $.each(data, function(index, item) {
	          for (var i = 0; i < item.length; i++) {
	            value += "<tr>";
	            value += "<td>" + item[i].rezNo + "</td>";    
	            value += "<td>" + item[i].memId + "</td>";    
	            value += "<td>" + item[i].farmNo + "</td>";    
	            value += "<td>" + item[i].rezZone + "</td>";    
	            value += "<td>" + item[i].rezStatus + "</td>";
	            value += "<td>" + item[i].rezStart + "</td>";
	            value += "<td>" + item[i].rezPrice + "</td>";
	            value += "<td>" + item[i].rezItem + "</td>";
	            value += "<td><button type='button' onclick='adminRezDeletes(\"" + item[i].rezNo + "\")'>예약삭제</button></td>";
	            value += "</tr>";
	          }
	        });
	        $("#output5 tbody").html(value);
	      },
	      error: function() {
	        console.log("Error occurred");
	      }
	    });
	  });
	});

	function adminRezDeletes(rezNo) {
	  $.ajax({
	    url: "${pageContext.request.contextPath}/reservation/adminRezDelete.my",
	    type: "POST",
	    data: { rezNo: rezNo },
	    success: function() {
	      alert("예약삭제가 완료되었습니다.");
	    },
	    error: function(xhr, status, error) {
	      console.log("Error occurred: " + xhr.responseText);
	    }
	  });
	}

</script>
			<!-- 예약변경 -------------------------예약 -->
<script>
	document.querySelector("#btn6").addEventListener('click', (e) => {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/reservation/adminRezList.my",
	        success(data) {
	        	console.log(data);
	        	
	            var value = "";
	            $.each(data, function(index, item) {
	            	 
	            	for (var i = 0; i < item.length; i++) {	
	            		value += "<tr>";
	                    value += "<td><input class='order-c1' value='" + item[i].rezNo + "' readonly></td>";
	                    value += "<td><input class='order-c2' value='" + item[i].memId + "' readonly></td>";
	                    value += "<td><input class='order-c3' value='" + item[i].farmNo + "' ></td>";
	                    value += "<td><input class='order-c4' value='" + item[i].rezZone + "' ></td>";
	                    value += "<td><input class='order-c5' value='" + item[i].rezStatus + "'></td>";
	                    value += "<td><input class='order-c6' value='" + item[i].rezStart + "'></td>";
	                    value += "<td><input class='order-c7' value='" + item[i].rezPrice + "'></td>";
	                    value += "<td><input class='order-c8' value='" + item[i].rezItem + "'></td>";
	                    value += "<td><button type='button' class='update3-button'>예약변경</button></td>";
	                    value += "</tr>"; 
	               }
	                $("#output6 tbody").html(value); 
	            });
	        },
	        error: console.log
	    });
	});

	$(document).on('click', '.update3-button', function() {
	    var row = $(this).closest('tr');
	    var rezNo = row.find('.order-c1').val();
	    var memId = row.find('.order-c2').val();
	    var farmNo = row.find('.order-c3').val();
	    var rezZone = row.find('.order-c4').val();
	    var rezStatus = row.find('.order-C5').val();
	    var rezStart = row.find('.order-c6').val();
	    var rezPrice = row.find('.order-c7').val();
	    var rezItem = row.find('.order-c8').val();
		  $.ajax({
		    url: "${pageContext.request.contextPath}/reservation/adminRezUpdate.my",
		    type: "POST",
		    data: { 
		    		rezNo: rezNo,
					memId: memId,
					farmNo: farmNo,
					rezZone: rezZone,
					rezStatus: rezStatus,
					rezStart: rezStart,
					rezPrice: rezPrice,
					rezItem: rezItem
		    },
		    success: function() {
		    	alert("예약변경이 완료되었습니다.");
		    },
		    error: function(xhr, status, error) {
		      console.log("Error occurred: " + xhr.responseText);
		       }
		    });
		});
</script>







































<jsp:include page="/WEB-INF/views/common/footer.jsp"/>