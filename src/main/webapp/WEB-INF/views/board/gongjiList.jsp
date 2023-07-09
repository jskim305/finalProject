<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	#container {
		width: 1000px;
		margin: auto;
	}
	table {
		border-collapse: collapse;
		width: 100%;
	}
	th, td {
		border: 1px solid black;
		padding: 8px;
		text-align: center;
	}
	th {
		background-color: #f2f2f2;
	}
	td a {
		color: black;
		text-decoration: none;
	}
	.btn {
		padding: 5px 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
		background-color: #fff;
		cursor: pointer;
	}
	#gul {
		text-align: right;
		margin-top : 30px;
	}
	#qna-heading {
		text-align: center;
		font-weight: bold;
		font-size: 24px;
		margin-bottom: 20px;
	}

	/* 추가된 스타일 */
	.table {
		border-collapse: collapse;
		width: 100%;
	}

	.table th, .table td {
		padding: 10px;
	}

	.table th {
		background-color: #f2f2f2;
		font-weight: bold;
	}

	.table td {
		border: 1px solid #ccc;
	}

	.table a {
		color: black;
		text-decoration: none;
	}

	.pagination {
		display: flex;
		justify-content: center;
		margin-top: 20px;
	}

	.pagination .page-item {
		margin: 0 5px;
	}

	.pagination .page-link {
		padding: 5px 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
		background-color: #fff;
		cursor: pointer;
	}

	.pagination .page-item.active .page-link {
		background-color: #4caf50;
		color: #fff;
	}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판" name="title"/>
</jsp:include>


<div id="container">
	<h1 id="qna-heading">공지사항</h1>
	<table class="table">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
			<th scope="col">조회수</th>
		</tr>
		<c:forEach items="${boardList}" var="board">
			<tr>
				<td>${board.boardNo}</td> 
				<td><a href="${pageContext.request.contextPath}/board/boardDetail.bo?boardNo=${board.boardNo}">${board.boardTitle}</a></td>
				<td>${board.boardWriter}</td>
				<td>${board.boardCreate}</td>
				<td>${board.boardCount}</td>
			</tr>
		</c:forEach>	
	</table>
	  <div id="gul"> <!--오른쪽 아래 글쓰기 버튼임  -->
			<td colspan="6" align="right">
				<button type="button" class="btn btn-outline-secondary" id="enrollBtn">글쓰기</button> <!-- 버튼을 오른쪽 아래에 넣을 부분 -->
			</td>
	  </div>
	
	<nav aria-label="Page navigation example">           <!-- 게시글 1,2,3 등과 같이 밑에 페이지 설정 -->
		<ul class="pagination justify-content-center">
			<c:if test="${pi.nowPage ne 1}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${pi.nowPage-1}" >Previous</a>
				</li>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				<c:choose>
					<c:when test="${p eq pi.nowPage}">
						<li class="page-item active">
							<a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${p}">${p}</a> <!-- 현재 페이지 표시 -->
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${p}">${p}</a> <!-- 다른 페이지 표시 -->
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${ pi.nowPage ne pi.totalPage }">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${pi.nowPage+1}">Next</a>
				</li>
			</c:if>
		</ul>
	</nav>
</div>
<script>
	document.querySelector("#enrollBtn").addEventListener('click', (e) => {
		location.href='${pageContext.request.contextPath}/board/boardForm.bo'; <!-- 버튼을 클릭했을 때 글쓰기 페이지로 이동 -->
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
