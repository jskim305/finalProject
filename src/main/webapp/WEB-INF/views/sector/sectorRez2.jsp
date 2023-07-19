<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.Objects"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<img class="logo"
	src="${pageContext.request.contextPath}/resources/images/v22_2.png"
	alt="logo"
	onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cae32d26dc4bc205934ad2152e3c8528"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<title>베지팜예약프로그램</title>

</head>




<body>

<h3 style="text-align: center; color: white;">ID :
	${loginMember.memId} 님의 예약</h3>




	<div id="container">
		<table style="color: green; font-size: large;">
			<tr>
				<td colspan="4" style="font-size: 12px; color: white;">▽원하시는
					농장을 선택하세요.▽</td>
			</tr>
			<tr>
				<td onclick="handle(1)">
					<div class="f" id="showCalendar1">[김씨네농장]</div>
				</td>
				<td onclick="handle(2)">
					<div class="f" id="showCalendar2">[윤씨네농장]</div>
				</td>
				<td onclick="handle(3)">
					<div class="f" id="showCalendar3">[손씨네농장]</div>
				</td>
				<td onclick="handle(4)">
					<div class="f" id="showCalendar4">[서씨네농장]</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="fn" style="position: relative; top: -20px;">군포시</div>
				</td>
				<td>
					<div class="fn" style="position: relative; top: -20px;">양주시</div>
				</td>
				<td>
					<div class="fn" style="position: relative; top: -20px;">시흥시</div>
				</td>
				<td>
					<div class="fn" style="position: relative; top: -20px;">남양주시</div>
				</td>
			</tr>
			<tr>
				<td colspan="4">
				<label class="fn" style="position: relative; top: -20px;">
						<button id="modalButton">지도보기</button>
				</label> <!-- css모달 -->
					<div id="myModal" class="modal">
						<div class="modal-content">
							<span class="close">&times;</span>
							<!-- 지도API -->
							<div class="box">
								<h2>[오시는 길]</h2>
								<h3>경기도 군포시 둔대동 180-1</h3>
								<div id="map" style="width: 500px; height: 400px; margin: auto;"></div>
							</div>
							<div class="box">
								<h2>[오시는 길]</h2>
								<h3>경기도 양주시 장흥면 일영로502번길 108-33</h3>
								<div id="map2" style="width: 500px; height: 400px; margin: auto;"></div>
							</div>
							<div class="box">
								<h2>[오시는 길]</h2>
								<h3>경기도 시흥시 달월길 93</h3>
								<div id="map3" style="width: 500px; height: 400px; margin: auto;"></div>
							</div>
							<div class="box">
								<h2>[오시는 길]</h2>
								<h3>경기도 남양주시 와부읍 율석리 754-14</h3>
								<div id="map4" style="width: 500px; height: 400px; margin: auto;"></div>
							</div>											
							<!-- 지도 API 끝 -->
						</div>
					</div> <!-- css모달 끝 -->
				</td>		
			</tr>
		</table>



		<script>  
           var modal = document.getElementById("myModal");
var modalButton = document.getElementById("modalButton");
var closeBtn = document.getElementsByClassName("close")[0];

modalButton.onclick = function() {
  modal.style.display = "block"; // 모달 열기
}

closeBtn.onclick = function() {
  modal.style.display = "none"; // 모달 닫기
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none"; // 모달 외부를 클릭하면 모달 닫기
  }
}
           
         </script>


	</div>
	<div id="controller">
		<table>
			<tr>
				<td>※ 동절기에는 운영하지 않습니다. [10월~12월]</td>
			</tr>
			<tr>
				<td>※ 선택불가시 예약이 만료된 구역입니다.</td>
			</tr>
		</table>
		<h1 style="text-align: center;">[2023]예약현황</h1>
		
		<hr>
		<!-- 김씨네농장  -->
		
		<div id="A">
			<form action="${pageContext.request.contextPath}/sector/radioRez.my"
				method="post" onsubmit="return check()">
				<table id="index">
					<thead>
						<tr>
							<td colspan="4">1월~3월</td>
							<td colspan="4">4월~6월</td>
							<td colspan="4">7월~9월</td>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>[1구역</td>
							<td>2구역</td>
							<td>3구역</td>
							<td>4구역]</td>
							<td>[1구역</td>
							<td>2구역</td>
							<td>3구역</td>
							<td>4구역]</td>
							<td>[1구역</td>
							<td>2구역</td>
							<td>3구역</td>
							<td>4구역]</td>
						</tr>
					</tbody>
					<tfoot>
						<!-- 예약표기영역 -->
					</tfoot>
				</table>

				<!--김씨네-->
				<table id="calendar1"
					style="position: relative; top: -34px; border-collapse: separate; border-spacing: 18px;">
					<tfoot>
					</tfoot>
				</table>

				<!--윤씨네-->
				<table id="calendar2"
					style="position: relative; top: -34px; border-collapse: separate; border-spacing: 18px;">
					<tfoot>
						<tr>
						</tr>
					</tfoot>
				</table>
				<!--손씨네-->
				<table id="calendar3"
					style="position: relative; top: -34px; border-collapse: separate; border-spacing: 18px;">
					<tfoot>
						<tr>
						</tr>
					</tfoot>
				</table>
				<!--서씨네-->
				<table id="calendar4"
					style="position: relative; top: -34px; border-collapse: separate; border-spacing: 18px;">
					<tfoot>
						<tr>
						</tr>
					</tfoot>
				</table>
				<button type="submit" id="son()">예약하기</button>
			</form>
		</div>
	</div>






	<!--백그라운드 이미지 영역  -->
	<div id="back">
		<div class="imgaaa">
			<div class="imgview apple" id="1"></div>
			<div class="imgview" id="2"></div>
			<div class="imgview" id="3"></div>
			<div class="imgview" id="4"></div>
		</div>
	</div>
	<div id="bg"></div>
</head>
<body>

	<!-- 백그라운드 이미지 체인지 및 스크립트 영역 -->
	<script>     
   		 let index = 1;   
      function handle(opt) {
        var A=1;
        var B=10;
        document.getElementById(index).className = "imgview";
        if (opt > 0) {
          A += 1;
          if (A > 4) {
            A = 1;
            B += 1;
          }
          index += 1;
          index > 4 ? (index = 1) : index;
        } else {
          A -= 1;
          if (A < 1) {
            A = 4;
            B -= 1;
          }
          index -= 1;
          index < 1 ? (index = 4) : index;
        }
        console.log(index);
		document.getElementById(index).className = "imgview apple";
      }
      function hoverAction(){
      }
      
      
      
      
     
	//농장 radio 스크립트 영역
    	//1번째 농장

		$(document).ready(function() {
		$("#showCalendar1").click(function() {
		    $("#calendar1").show();
		    $("#calendar2").hide();
		    $("#calendar3").hide();
		    $("#calendar4").hide();

		  
		    $.ajax({
		        url: "${pageContext.request.contextPath}/sector/list",
		       
		        success: function(data){
		            var value = "";
		            var value2 = "";
					console.log(data);

		    		for (var i = 0; i < 12; i++) {
		                var sectorStatus = data.list[i].sectorStatus;
		                var sectorNo = data.list[i].sectorNo;
		                var sectorStatusText = sectorStatus === 1|| sectorStatus === 2 ? "disabled" : ""; 
		                var sectorStatusText2 = sectorStatus === 1|| sectorStatus === 2 ? "마감" : "가능"; 
		                var sectorStatusText3 = sectorStatus === 1|| sectorStatus === 2 ? "  style='color: red;'" : "  style='color: skyblue;'"; 
		                value += "<td><input name='radio' type='radio' value='" + sectorNo + "'  " + sectorStatusText + "></input></td>";   
	                
		                value2 += "<td" + sectorStatusText3 + ">" + sectorStatusText2 + "</td>";   
		                		                
		            }//라디오 네임키 기억
		    		$("#calendar1 tfoot").html(value);
		    		$("#index tfoot").html(value2);		            
		        },
		        error: function() {
			        console.log("Error occurred");
		        }
		    });
		});
	});
		
		

    	//2번째 농장
		
		$(document).ready(function() {
			$("#showCalendar2").click(function() {
			    $("#calendar2").show();
			    $("#calendar1").hide();
			    $("#calendar3").hide();
			    $("#calendar4").hide();
			   
			    $.ajax({
			        url: "${pageContext.request.contextPath}/sector/list",
			       
			        success: function(data){
			            var value = "";
			            var value2 = "";
			    		for (var i = 12; i < 24; i++) {
			                var sectorStatus = data.list[i].sectorStatus;
			                var sectorNo = data.list[i].sectorNo;
			                var sectorStatusText = sectorStatus === 1|| sectorStatus === 2  ? "disabled" : ""; 
			                var sectorStatusText2 = sectorStatus === 1|| sectorStatus === 2 ? "마감" : "가능"; 
			                var sectorStatusText3 = sectorStatus === 1|| sectorStatus === 2 ? "  style='color: red;'" : "  style='color: skyblue;'"; 
			                value += "<td><input name='radio' type='radio' value='" + sectorNo + "'  " + sectorStatusText + "></input></td>"; 
			                value2 += "<td" + sectorStatusText3 + ">" + sectorStatusText2 + "</td>";   

			            }
			    $("#calendar2 tfoot").html(value);
			    $("#index tfoot").html(value2);
			        },
			        error: function() {
				        console.log("Error occurred");
			        }
			    });
			});
		});	
		

		//3번째 농장
		
		$(document).ready(function() {
			$("#showCalendar3").click(function() {
			    $("#calendar3").show();
			    $("#calendar1").hide();
			    $("#calendar2").hide();
			    $("#calendar4").hide();
			   
			    $.ajax({
			        url: "${pageContext.request.contextPath}/sector/list",
			       
			        success: function(data){
			            var value = "";
						var value2 = "";
			    		for (var i = 24; i < 36; i++) {
			                var sectorStatus = data.list[i].sectorStatus;
			                var sectorNo = data.list[i].sectorNo;
			                var sectorStatusText = sectorStatus === 1|| sectorStatus === 2  ? "disabled" : "";  
			                var sectorStatusText2 = sectorStatus === 1|| sectorStatus === 2  ? "마감" : "가능";
			                var sectorStatusText3 = sectorStatus === 1|| sectorStatus === 2 ? "  style='color: red;'" : "  style='color: skyblue;'"; 
			                
			                value += "<td><input name='radio' type='radio' value='" + sectorNo + "'  " + sectorStatusText + "></input></td>";  
			                value2 += "<td" + sectorStatusText3 + ">" + sectorStatusText2 + "</td>";   
			            }
			    $("#calendar3 tfoot").html(value);
			    $("#index tfoot").html(value2);
			        },
			        error: function() {
				        console.log("Error occurred");
			        }
			    });
			});
		});
		

		//4번째 농장 
		
		$(document).ready(function() {
			$("#showCalendar4").click(function() {
			    $("#calendar4").show();
			    $("#calendar1").hide();
			    $("#calendar2").hide();
			    $("#calendar3").hide();
			   
			    $.ajax({
			        url: "${pageContext.request.contextPath}/sector/list",
			       
			        success: function(data){
			            var value = "";
						var value2 = "";	

			    		for (var i = 36; i < 48; i++) {
			                var sectorStatus = data.list[i].sectorStatus;
			                var sectorNo = data.list[i].sectorNo;
			                var sectorStatusText = sectorStatus === 1|| sectorStatus === 2 ? "disabled" : ""; 
			                var sectorStatusText2 = sectorStatus === 1|| sectorStatus === 2 ? "마감" : "가능"; 
			                var sectorStatusText3 = sectorStatus === 1|| sectorStatus === 2 ? "  style='color: red;'" : "  style='color: skyblue;'"; 
			                
			                value += "<td><input name='radio' type='radio' value='" + sectorNo + "'  " + sectorStatusText + "></input></td>";  
			                value2 += "<td" + sectorStatusText3 + ">" + sectorStatusText2 + "</td>";    
			            }
			    		
			    $("#calendar4 tfoot").html(value);
			    $("#index tfoot").html(value2);
			        },
			        error: function() {
				        console.log("Error occurred");
			        }
			    });
			});
		});
    </script>

	<script>
    //예약 유효성 체크
	$(document).ready(function() {
	  $("form").submit(function() {
	    var radioChecked = $("input[name='radio']:checked").length > 0;
	    if (!radioChecked) {
	      alert("예약구역을 선택해주세요.^-^");
	      return false; 
	    }
	    return true;
	  });
	});
    </script>
	<script>
	    // 인설트 되기전에 확인 confirm 하기
	    function check(){   	
	   		var check_submit=confirm('${loginMember.memId}님! 해당 구역으로 예약하시겠습니까?'); 		
	    return check_submit;    
	    }
    </script>




	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.3248866031584, 126.905422718028),
			level : 5
		// 확대 레벨인데 3 적당한거 같아요 
		};
		var map = new kakao.maps.Map(container, options);

		var imageSrc = '${pageContext.request.contextPath}/resources/images/marker.png', imageSize = new kakao.maps.Size(
				50, 50), imageOption = {
			offset : new kakao.maps.Point(33, 67)
		};

		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imageOption);
		var markerPosition = new kakao.maps.LatLng(37.3248866031584,
				126.905422718028);

		var marker = new kakao.maps.Marker({
			position : markerPosition,
			image : markerImage
		});

		marker.setMap(map);
	</script>
	<script>
	var container2 = document.getElementById('map2');
	   var options2 = {
	      center: new kakao.maps.LatLng(37.6896238389643, 126.931941975112 ),
	      level: 5 // 확대 레벨인데 3 적당한거 같아요 
	   };
	   var map2 = new kakao.maps.Map(container2, options2);
	   
	   var imageSrc = '${pageContext.request.contextPath}/resources/images/marker.png',
	   imageSize = new kakao.maps.Size(50, 50),
	   imageOption = {offset: new kakao.maps.Point(33, 67)};
		      
	   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	   var markerPosition  = new kakao.maps.LatLng(37.6896238389643, 126.931941975112 );
	
	   var marker = new kakao.maps.Marker({
	      position: markerPosition,
	      image: markerImage
	   });
		      
	   marker.setMap(map2);
	  		
	</script>
	<script>
	  var container3 = document.getElementById('map3');
	   var options3 = {
	      center: new kakao.maps.LatLng(37.3782255359406, 126.752536658388 ),
	      level: 5 // 확대 레벨인데 3 적당한거 같아요 
	   };
	   var map3 = new kakao.maps.Map(container3, options3);
	   
	   var imageSrc = '${pageContext.request.contextPath}/resources/images/marker.png',
	   imageSize = new kakao.maps.Size(50, 50),
	   imageOption = {offset: new kakao.maps.Point(33, 67)};
		      
	   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	   var markerPosition  = new kakao.maps.LatLng(37.3782255359406, 126.752536658388 );
	
	   var marker = new kakao.maps.Marker({
	      position: markerPosition,
	      image: markerImage
	   });
		      
	   marker.setMap(map3);
	</script>
	<script>
	 var container4 = document.getElementById('map4');
	   var options4 = {
	      center: new kakao.maps.LatLng(37.6118770929566, 127.215959062044 ),
	      level: 5 // 확대 레벨인데 3 적당한거 같아요 
	   };
	   var map4 = new kakao.maps.Map(container4, options4);
	   
	   var imageSrc = '${pageContext.request.contextPath}/resources/images/marker.png',
	   imageSize = new kakao.maps.Size(50, 50),
	   imageOption = {offset: new kakao.maps.Point(33, 67)};
		      
	   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	   var markerPosition  = new kakao.maps.LatLng(37.6118770929566, 127.215959062044 );
	
	   var marker = new kakao.maps.Marker({
	      position: markerPosition,
	      image: markerImage
	   });
		      
	   marker.setMap(map4);
	</script>







</body>
<style>
.logo {
	margin: auto;
	display: block;
}
.modal {
	display: none; /* 모달 초기 상태는 숨김으로 설정합니다. */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5); /* 배경을 어둡게 만듭니다. */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
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
	-webkit-transition: opacity 1s ease-in-out;
	-moz-transition: opacity 1s ease-in-out;
	-o-transition: opacity 1s ease-in-out;
	transition: opacity 1s ease-in-out;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
	filter: alpha(opacity = 0);
	opacity: 0;
}

#back .imgview:nth-child(1) {
	background:
		url(${pageContext.request.contextPath}/resources/images/pexels-photo-5677794.jpeg)
		0 0 no-repeat;
	background-size: cover;
}

#back .imgview:nth-child(2) {
	background:
		url(${pageContext.request.contextPath}/resources/images/cook-g0222dc6c7_1920.jpg)
		0 0 no-repeat;
	background-size: cover;
}

#back .imgview:nth-child(3) {
	background:
		url(${pageContext.request.contextPath}/resources/images/food-1475223_1280.jpg)
		0 0 no-repeat;
	background-size: cover;
}

#back .imgview:nth-child(4) {
	background:
		url(${pageContext.request.contextPath}/resources/images/papapapapa.jpg)
		0 0 no-repeat;
	background-size: cover;
}

#back .imgview.apple {
	opacity: 1;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
	filter: alpha(opacity = 1);
}

#container {
	color: white;
}

#controller {
	color: white;
	margin-top: 1rem;
}

h1 {
	color: white;
}

#A {
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
	background-color: rgba(0, 0, 0, 0.8);
}
/*       #calendar1, #calendar2, #calendar3, #calendar4{height: 3px;} */
table {
	border-radius: 20px;
	max-width: 1000px;
	margin: 0 auto;
	padding: 20px;
	background-color: rgba(0, 0, 0, 0.8);
}

th, td {
	padding: 10px;
	text-align: center;
	background-color: rgba(0, 0, 0, 0.8);
}

.f { /*농장이름포커스*/
	cursor: pointer;
	color : white;
}

.fn {
	color: green;
	font-size: 15px;
}

button[type="submit"] { /*버튼꾸미기*/
	background-color: #4caf50;
	width: 100px; /* 너비 설정 */
	height: 40px; /* 높이 설정 */
	cursor: pointer;
	margin-left: 45%;
	border-radius: 20px;
}

input[type="radio"] {
	width: 19px; /* 너비 설정 */
	height: 19px; /* 높이 설정 */
}
</style>
</html>