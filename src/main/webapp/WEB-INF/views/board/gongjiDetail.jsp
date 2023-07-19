<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
   

    #container {
       width: 900px;
		margin: auto;
    }

    h2 {
        text-align: center;
        margin-top: 0;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-group input[type="text"],
    .form-group textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .btn-group {
        text-align: center;
        margin-top: 20px;
    }

    .btn {
        padding: 10px 20px;
        font-size: 14px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn-reset {
        background-color: #ccc;
        margin-left: 10px;
    }
     textarea {
     height: 150px;
    min-width: 800px;
    min-height: 300px;
    max-width: 500px;
    max-height: 500px;
    overflow: auto;
   
}

  #replyForm {
      width: 60%;
      margin: 0 auto;
   }
</style>


<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="상세보기" name="title"/>
</jsp:include>

<br><br>
<h2>공지게시판</h2>
<div id="container">
   <table class="table">
      <tr>
         <th scope="col">제목</th>
         <td scope="col"><input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}" readonly></td>
         
      </tr>
      <tr>
         <th scope="col">작성자</th>
         <td scope="col">${board.boardWriter}</td>
      </tr>
      <tr>
         <th scope="col">내용</th>
         <td scope="col">
            <textarea name="boardContent" rows="10" cols="50" readonly>${board.boardContent}</textarea>
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
   
    <div class="button-group">
     
      <a href="${pageContext.request.contextPath}/board/delete?boardNo=${board.boardNo}" class="btn-delete">삭제</a>
      <a href="${pageContext.request.contextPath}/board/update?boardNo=${board.boardNo}" class="btn-update">수정</a> 
      <a href="${pageContext.request.contextPath}/board/gongjiList.bo?boardNo=${board.boardNo}" class="btn-update">뒤로가기</a> 
   </div>
</div>
<br><br><br><br>

  
  
  
 

   
   
   

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
