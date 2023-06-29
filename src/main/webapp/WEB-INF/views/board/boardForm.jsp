<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#container{width:500px; margin:auto;}
	th, td{height:30px;}
	input {width:250px;}
	.guide {display:none;}
	.ok {color:green;}
	.error {color:red;}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="글쓰기" name="title"/>
</jsp:include>
<br><br>
	<div id="container">
	<form action="${pageContext.request.contextPath}/board/boardEnroll.bo" method="post" name="enrollfrm" > 
		
			<table class="table">
				<tr>
					<th scope="col" >제목</th>
					<td scope="col" >
						<input name="bTitle" required>
					</td>
				</tr>
				<tr>
					<th scope="col">작성자</th>
					<td scope="col">
						<input name="bWriter" <%-- value="${loginMember.mId}" --%> >
					</td>
				</tr>
				<tr>
					<th scope="col">내용</th>
					<td scope="col">
						<textarea name="bContent" rows="10" cols="50" required></textarea>
					</td>
				</tr>
				
				<tr>
					<th scope="col" >게시글구분</th>
					<td scope="col" >
						<input name="bTag" required>
					</td>
				</tr>
			</table>
			<button type="submit" class="btn btn-outline-success">등록</button>&emsp;
			<button type="reset" class="btn btn-outline-success">초기화</button>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />



















