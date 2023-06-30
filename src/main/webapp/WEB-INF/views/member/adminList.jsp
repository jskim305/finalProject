<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">


<jsp:include page="/WEB-INF/views/common/header.jsp"/>





<style>
div{width: 50%;}
table {border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;    }
th{text-align: left;}
thead {font-weight: bold;
  color: #fff;
  background: #73a839;}
 td, th {padding: 1em .5em;
  vertical-align: middle;}
 td {border-bottom: 1px solid rgba(0,0,0,.1);}
a{}
 @media all and (max-width: 768px) {table, thead, tbody, th, td, tr {
   display: block;}
 th {text-align: right;}
  table{position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);}
  thead {
    float: left;
    white-space: nowrap;}
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  tr {display: inline-block;
    vertical-align: top;}
  th{border-bottom: 1px solid #a39485;}
  td {border-bottom: 1px solid #e5e5e5;}}
</style>


<!-- 
M_ID     아이디
M_NAME   이름
M_BIRTH  생년월일
M_CREATE 생성날짜
M_TEL    전화번호
M_ADDR   주소
M_EMAIL  이메일
M_STATUS 유져
ADMIN   
--> 

		<div>
			<h2>관리자 전용 페이지</h2>		
			
			
		<button onclick="a1();">회원관리</button>
	<table >
		<thead>
		<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>생성날짜</th>
				<th>전화번호</th>
				<th>주소</th>	
				<th>이메일</th>	
				<th>회원구분</th>	
		</tr>
		</thead>
	</table>
	<table id="output1">
		<tbody>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>생성날짜</th>
				<th>전화번호</th>
				<th>주소</th>	
				<th>이메일</th>	
				<th>회원구분</th>	
			</tr>
		</tbody>
	</table>

	<!-- 	<button onclick="a2();">주문관리</button>
		<table >
		<thead>
		<tr>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
				배송현황 ERD가 없는듯 하다		
		</tr>
		</thead>
	</table>
	<table id="output">
		<tbody>
			<tr>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
				<th>ㅁㅁ</th>
			</tr>
		</tbody>
	</table>	
		
		
		<button onclick="a3();">예약관리</button>
		<table>
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
	</table>
	<table id="output">
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
		 -->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		</div>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		 <script>
			function a1(){
				$.ajax({
					url:"adminList.do",
					success:function(result){
						console.log(result);
						let value = "";
						type = "post"
						for(let i=0; i<result.length; i++)
							value += "<tr>"
							+ "<th>" + result[i].mid + "</th>";
							+ "<th>" + result[i].mpwd + "</th>";
							+ "<th>" + result[i].mname + "</th>";
							+ "<th>" + result[i].mbirth + "</th>";
							+ "<th>" + result[i].mcreate + "</th>";
							+ "<th>" + result[i].mtel + "</th>";
							+ "<th>" + result[i].maddr + "</th>";
							+ "<th>" + result[i].memail + "</th>";
							+ "<th>" + result[i].mstatus + "</th>";						
							+ "</tr>";
							$("#output1").html(value);	
					},
					error:function(){
						console.log("실패");
					}	
				});
			}
		</script>
		<!-- 
		<script>
			function a2(){
				$.ajax({
					url:"${pageContext.request.contextPath}/member/adminAll????",
					success:function(result){
						console.log(result);
						let value = "";
						for(let i=0; i<result.length; i++)
							value += "<tr>"
							+ "<th>" + result[i].id + "</th>"
							+ "<th>" + result[i].pwd + "</th>"
							+ "<th>" + result[i].name + "</th>"
							+ "<th>" + result[i].gender  + "</th>"
							+ "<th>" + result[i].birthday + "</th>"
							+ "<th>" + result[i].email + "</th>"
							+ "<th>" + result[i].zipcode + "</th>"
							+ "<th>" + result[i].address + "</th>"
							+ "<th>" + result[i].datailaddress + "</th>"
							+ "<th>" + result[i].job + "</th>"
							+ "</tr>";
							$("#output2").html(value);	
					},
					error:function(){
						console.log("실패");
					}	
				});
			}
		</script>
		
		<script>
			function a3(){
				$.ajax({
					url:"${pageContext.request.contextPath}/member/",
					success:function(result){
						console.log(result);
						let value = "";
						for(let i=0; i<result.length; i++)
							value += "<tr>"
							+ "<th>" + result[i].id + "</th>"
							+ "<th>" + result[i].pwd + "</th>"
							+ "<th>" + result[i].name + "</th>"
							+ "<th>" + result[i].gender  + "</th>"
							+ "<th>" + result[i].birthday + "</th>"
							+ "<th>" + result[i].email + "</th>"
							+ "<th>" + result[i].zipcode + "</th>"
							+ "<th>" + result[i].address + "</th>"
							+ "<th>" + result[i].datailaddress + "</th>"
							+ "<th>" + result[i].job + "</th>"
							+ "</tr>";
							$("#outpu3").html(value);	
					},
					error:function(){
						console.log("실패");
					}	
				});
			}
		</script> -->
		




















<jsp:include page="/WEB-INF/views/common/footer.jsp"/>








