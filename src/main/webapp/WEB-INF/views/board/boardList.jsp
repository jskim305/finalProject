<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	
	#container {
		width: 900px;
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
		margin-top: 30px;
	}

	#qna-heading {
		text-align: center;
		font-weight: bold;
		font-size: 24px;
		margin-bottom: 20px;
	}

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

	.table {
		border-collapse: collapse;
		width: 100%;
	}

	.table th, .table td {
		padding: 10px;
		border: none; /* 세로 선 제거 */
	}

	.table th {
		background-color: #f2f2f2;
		font-weight: bold;
	}

	.table td {
		border-bottom: 1px solid #ccc; /* 가로 선 유지 */
	}
	
	button#enrollBtn {
	    margin-top: 10px;
    padding: 10px 20px;
    font-size: 14px;
    background-color: #4caf50;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
	}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판" name="title"/>
</jsp:include>


<div id="container">
	<h1 id="qna-heading">Q&A 게시판</h1>
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
	  <br><br><br><br>
			<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <c:if test="${pi.nowPage ne 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${pi.nowPage-1}">&laquo;</a>
            </li>
        </c:if>
        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            <li class="page-item${p eq pi.nowPage ? ' active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${p}">${p}</a>
            </li>
        </c:forEach>
        <c:if test="${pi.nowPage ne pi.totalPage}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/board/boardList.bo?nowPage=${pi.nowPage+1}">&raquo;</a>
            </li>
        </c:if>
    </ul>
</nav>
</div>
<pre>




</pre>
<script>
	document.querySelector("#enrollBtn").addEventListener('click', (e) => {
		location.href='${pageContext.request.contextPath}/board/boardForm.bo?tag=문의'; <!-- 버튼을 클릭했을 때 글쓰기 페이지로 이동 -->
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
