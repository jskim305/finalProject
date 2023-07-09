<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    #container {
        width: 500px;
        margin: auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    th, td {
        height: 30px;
    }

    textarea[name="BContent"], input[name="BTitle"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="수정하기" name="title"/>
</jsp:include>

<br><br>

<div id="container">
    <form action="${pageContext.request.contextPath}/board/boardUpdate.bo" method="post">
        <table class="table">
            <tr>
                <th scope="col">제목</th>
                <td scope="col"><input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}"></td>
            </tr>
            <tr>
                <th scope="col">작성자</th>
                <td scope="col">${board.boardWriter}</td>
            </tr>
            <tr>
                <th scope="col">내용</th>
                <td scope="col">
                    <textarea name="boardContent" rows="10" cols="50">${board.boardContent}</textarea>
                </td>
            </tr>
            <tr>
                <th scope="col">조회수</th>
                <td scope="col">${board.boardCount}</td>
            </tr>
            <tr>
                <th scope="col">작성일</th>
                <td scope="col">${board.boardCreate}</td>
            </tr>
        </table>
		<input type="hidden" name="boardNo" value="${board.boardNo}">
		
		
        <div class="button-group">
            <input type="submit" value="수정완료" class="btn-update">
        </div>
    </form>
</div>
<br><br><br><br>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
