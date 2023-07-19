<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	 
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	


<head>
	<link href="${pageContext.request.contextPath}/resources/css/admin.css?v=<%System.currentTimeMillis(); %>" rel="stylesheet" />
</head>



<!-- main logo -->
	<div class="admin-logo">
		<div class="admin-logo-text">
			<p id="text1">[VEG_FARM]</p>
			<br>
			<p id="text1">농장주의 성공을 이끄는 기업.</p>
			<p id="text2">System admin</p>
	<div class="container">
		<button type="button" id="x" class="btn btn-warning" data-toggle="modal" data-target="#memberModal">회원관리</button>
		<button type="button" id="x" class="btn btn-warning" data-toggle="modal" data-target="#memberModa2">주문관리</button>
		<button type="button" id="x" class="btn btn-warning" data-toggle="modal" data-target="#memberModa3">예약관리</button>
	</div>
		</div>
	</div>
<body>

	<!-- 회원조회 모달 -->
	<div class="modal" id="memberModal" tabindex="-1" role="dialog"
		aria-labelledby="memberModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="memberModalLabel">회원관리</h5>
				</div>
				<div class="modal-body">				
					<div class="container">
						<div>
							<button id="btn1" class="btn btn-success">회원조회,삭제</button>
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
									</tr>
								</thead>
								<tbody>
									<tr>
									</tr>
								</tbody>
							</table>
						</div>
						<div>
							<button id="btn2" class="btn btn-warning">회원수정</button>
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
									</tr>
								</thead>
								<tbody>
									<tr>
									</tr>
								</tbody>
							</table>
						</div>
					</div><!-- 여기까지 컨테이너 -->
				</div>
			</div>
		</div>
	</div>




<!-- 상품 모달 -->
	<div class="modal" id="memberModa2" tabindex="-1" role="dialog"
		aria-labelledby="memberModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="memberModalLabel">주문관리</h5>
				</div>
				<div class="modal-body">
					<div class="container">
						<div>
							<button id="btn3" class="btn btn-success">주문조회,삭제</button>
							<table id="output3" class="table table-hover table-sm">
								<thead>
									<tr>
										<th>주문상세번호</th>
										<th>주문번호</th>
										<th>상품번호</th>
										<th>가격</th>
										<th>갯수</th>
										<th>상품명</th>
										<th>배송현황</th>
										<th>회원ID</th>
										<th>이름</th>
									</tr>
								</thead>
								<tbody>
									<tr>

									</tr>
								</tbody>
							</table>
							<button id="btn4" class="btn btn-warning">배송수정</button>
							<table id="output4" class="table table-hover table-sm">
								<thead>
									<tr>
										<th>주문상세번호</th>
										<th>주문번호</th>
										<th>상품번호</th>
										<th>가격</th>
										<th>갯수</th>
										<th>상품명</th>
										<th>배송현황</th>
										<th>회원ID</th>
										<th>이름</th>
									</tr>
								</thead>
								<tbody>
									<tr>

									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 여기까지 컨테이너 -->
				</div>
			</div>
		</div>
	</div>

	<!-- 예약 모달 -->
	<div class="modal" id="memberModa3" tabindex="-1" role="dialog"
		aria-labelledby="memberModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="memberModalLabel">예약 관리</h5>
				</div>
				<div class="modal-body">
					<div class="container">
						<div>
							<button id="btn5" class="btn btn-success">예약조회,삭제</button>
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

									</tr>
								</tbody>
							</table>
							<button id="btn6" class="btn btn-warning">예약수정</button>
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

									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 여기까지 컨테이너 -->
				</div>
			</div>
		</div>
	</div>

</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<!--회원조회 및 삭제----------------------------------------회원----------------->
<script>
$(document).ready(function() {
	  $("#btn1").click(function() {
	    $.ajax({
	      url: "${pageContext.request.contextPath}/member/list",
	      success: function(data) {
	        var value = "";
	        
	        for (var i = 0; i < data.list.length; i++) {
		           value += "<tr>";
		            value += "<td>" + data.list[i].memId + "</td>";    
		            value += "<td>" + data.list[i].memName + "</td>";  
		            value += "<td>" + data.list[i].memBirth + "</td>"; 
		            value += "<td>" + data.list[i].memCreate.year + "-" + data.list[i].memCreate.monthValue + "-" + data.list[i].memCreate.dayOfMonth + "</td>";
		            value += "<td>" + data.list[i].memTel + "</td>";   
		            value += "<td>" + data.list[i].memAddr + "</td>";  
		            value += "<td>" + data.list[i].memEmail + "</td>"; 
		            value += "<td>" + data.list[i].memStatus + "</td>";
		            value += "<td><button type='button' onclick='deleteMember(\"" + data.list[i].memId + "\")'>회원삭제</button></td>";
		            value += "</tr>";
		            console.log(data.list[i]);
	        }
	        $("#output1 tbody").html(value);
	        
	        //버튼클릭시 보이거나 숨김처리
	        $("#btn1").click(function() {
	  		  $("#output1 tbody").toggle(); 		  
	  		  if ($("#output1 tbody").is(":visible")) {
	  		    isOutputHidden = false; 
	  		  } else {
	  		    isOutputHidden = true; 
	  		  }
	  		});	        	        
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
	            var value = "";
	            	 
            	for (var i = 0; i < data.list.length; i++) {	
            		value += "<tr>";
                    value += "<td><input class='member-mid' value='" + data.list[i].memId + "' readonly></td>";
                    value += "<td><input class='member-mname' value='" + data.list[i].memName + "' readonly></td>";
                    value += "<td><input class='member-mbirth' value='" + data.list[i].memBirth + "'></td>";
                    value += "<td><input class='member-mcreate' value='" + data.list[i].memCreate.year + "-" + data.list[i].memCreate.monthValue + "-" + data.list[i].memCreate.dayOfMonth + "' readonly></td>";
                    value += "<td><input class='member-mtel' value='" + data.list[i].memTel + "'></td>";
                    value += "<td><input class='member-maddr' value='" + data.list[i].memAddr + "'></td>";
                    value += "<td><input class='member-memail' value='" + data.list[i].memEmail + "'></td>";
                    value += "<td><button type='button' class='update-button'>수정하기</button></td>";
                    value += "</tr>"; 
				}
                $("#output2 tbody").html(value); 
                
                //버튼클릭시 보이거나 숨김처리
    	        $("#btn2").click(function() {
    	  		  $("#output2 tbody").toggle(); 		  
    	  		  if ($("#output2 tbody").is(":visible")) {
    	  		    isOutputHidden = false; 
    	  		  } else {
    	  		    isOutputHidden = true; 
    	  		  }
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
	            value += "<td>" + item[i].detailSituation + "</td>";
	            value += "<td>" + item[i].memId + "</td>";
	            value += "<td>" + item[i].memName + "</td>";
	            value += "<td><button type='button' onclick='adminOrderDeletes(\"" + item[i].detailNo + "\")'>주문삭제</button></td>";
	            value += "</tr>";
	          }
	        });
	        $("#output3 tbody").html(value);
	        
	        //버튼클릭시 보이거나 숨김처리
	        $("#btn3").click(function() {
	  		  $("#output3 tbody").toggle(); 		  
	  		  if ($("#output3 tbody").is(":visible")) {
	  		    isOutputHidden = false; 
	  		  } else {
	  		    isOutputHidden = true; 
	  		  }
	  		});
	        
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

			<!-- 배송수정 -------------------------주문 -->
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
	                    value += "<td><input class='order-d4' value='" + item[i].detailPrice + "' readonly></td>";
	                    value += "<td><input class='order-d5' value='" + item[i].detailCount + "' readonly></td>";
	                    value += "<td><input class='order-d6' value='" + item[i].itemName + "' readonly></td>";
	                    value += "<td><input class='order-d6' value='" + item[i].detailSituation + "'></td>";
	                    value += "<td><input class='order-d6' value='" + item[i].memId + "' readonly></td>";
	                    value += "<td><input class='order-d6' value='" + item[i].memName + "' readonly></td>";
	                    value += "<td><button type='button' class='update2-button'>수정완료</button></td>";
	                    value += "</tr>"; 
	               }
	                $("#output4 tbody").html(value); 
	                
	                //버튼클릭시 보이거나 숨김처리
	    	        $("#btn4").click(function() {
	    	  		  $("#output4 tbody").toggle(); 		  
	    	  		  if ($("#output4 tbody").is(":visible")) {
	    	  		    isOutputHidden = false; 
	    	  		  } else {
	    	  		    isOutputHidden = true; 
	    	  		  }
	    	  		});                	                
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

	        
	        
	        //버튼클릭시 보이거나 숨김처리
	        $("#btn5").click(function() {
	  		  $("#output5 tbody").toggle(); 		  
	  		  if ($("#output5 tbody").is(":visible")) {
	  		    isOutputHidden = false; 
	  		  } else {
	  		    isOutputHidden = true; 
	  		  }
	  		});
	        
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
	                
	                //버튼클릭시 보이거나 숨김처리
	    	        $("#btn6").click(function() {
	    	  		  $("#output6 tbody").toggle(); 		  
	    	  		  if ($("#output6 tbody").is(":visible")) {
	    	  		    isOutputHidden = false; 
	    	  		  } else {
	    	  		    isOutputHidden = true; 
	    	  		  }
	    	  		});
	                                
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

  	
<style>
 input{
  width: 75px;
 }
 input[readonly] {
    border: none;
    outline: none;
    }	
 #x {width: 287px;
 }
</style>