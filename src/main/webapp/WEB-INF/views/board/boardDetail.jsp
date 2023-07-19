<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        width: 100%;
        margin: 0 auto;
    }

    #container {
        width: 800px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
        width: 10%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .form-group1{
   
      width: 95%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .btn-group {
        text-align: center;
        margin-top: 20px;
    }

    .btn {
        margin-top: 10px;
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
    min-width: 700px;
    min-height: 150px;
    max-width: 500px;
    max-height: 500px;
    overflow: auto;
           
    }
    

    #replyForm {
     width: 800px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    
   
    #replyList{
    width: 800px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    
    span{
    display: inline-block; text-align: right;
    }
    
    .replyWriter {
    width: 50%;
    text-align: left;
    font-weight: bold;
}
.replyCreate {
    width: 49%;
}
.replyButtons {
    text-align: right;
    width: 99%;
    border-bottom: 1px solid #ccc;
    padding-bottom: 10px;
    margin-top: -15px;
}

.replyContent {
    width: 50%;
    display: inline-block;
}
input#replyContent {
    height: 50;
    border: 0;
}

.reply-header {
    margin-top: 20px;
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="상세보기" name="title"/>
</jsp:include>

<br><br>
<h2>게시판</h2>
<div id="container">
   <table class="table">
      <tr>
         <th scope="col">제목</th>
         <td scope="col">
            <input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}" readonly>
         </td>
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
   <c:choose>
   		<c:when test="${board.boardTag eq '공지사항'}">
   			<c:if test="${loginMember.memId eq 'admin'}">
   				<a href="${pageContext.request.contextPath}/board/delete?boardNo=${board.boardNo}&boardTag=${board.boardTag}" class="btn-delete">[삭제]</a>
      			<a href="${pageContext.request.contextPath}/board/update?boardNo=${board.boardNo}" class="btn-update">[수정]</a>
   			</c:if>
   		</c:when>
   		<c:otherwise><!-- qna게시판일 경우 -->
   			<c:if test="${(loginMember.memId eq board.boardWriter) or (loginMember.memId eq 'admin')}">
		      	<a href="${pageContext.request.contextPath}/board/delete?boardNo=${board.boardNo}&boardTag=${board.boardTag}" class="btn-delete">[삭제]</a>
		      	<a href="${pageContext.request.contextPath}/board/update?boardNo=${board.boardNo}" class="btn-update">[수정]</a>
			</c:if>
   		</c:otherwise>
   </c:choose>
      	<a href="javascript:window.history.back();" class="btn-update">[뒤로가기]</a>
   </div>
</div>

<!-- 이것도 마찬가지로 boardTag가 공지사항이 아닐경우(qna게시판)에만 reply가 가능하게 조건을 걸었음 -->
<c:if test="${board.boardTag ne '공지사항'}">
<h2>댓글</h2>  
<form id="replyForm">
   <div class="form-group">
      <label for="replyWriter">작성자</label>
      <input type="text" id="replyWriter" name="replyWriter" value="${loginMember.memId}" readonly>
   </div>
   <div class="form-group1">
      <label for="replyContent">내용</label>
      <input style="width: 750px; " id="replyContent" name="replyContent"  required></input>
   <button type="submit" class="btn btn-submit">댓글 등록</button>
   </div>
   <input type="hidden" name="boardNo" value="${board.boardNo}">
</form>

<div id="replyList">
   <div id="replyTemplate" >
      <div class="reply">
      <c:forEach var="reply" items="${replyList}">
         <div class="reply-header">
            <span class="replyWriter">${reply.replyWriter}</span>
            <span class="replyCreate">${reply.replyCreate}</span>
         </div>
         <div class="replyContent">${reply.replyContent}</div>
         
         <c:if test="${(loginMember.memId eq reply.replyWriter) or (loginMember.memId eq 'admin')}">
	         <div class="replyButtons">
	            <button class="btn-update" onclick="updateReply(${reply.replyNo})">수정</button>
	            <button class="btn-delete" onclick="deleteReply(${reply.replyNo})">삭제</button>
	         </div>
         </c:if>
      </c:forEach>
      </div>
   </div>
</div>
</c:if>
<br><br><br>
<script>
//댓글 등록 폼 submit 이벤트 처리
document.querySelector("#replyForm").addEventListener('submit', (e) => {
	e.preventDefault();
	
	const replyWriter = document.querySelector("#replyWriter").value;
	const replyContent = document.querySelector("#replyContent").value;
	const boardNo = document.querySelector("input[name='boardNo']").value;
	
	$.ajax({
	   url: "${pageContext.request.contextPath}/reply/create",
	   data: {
	      replyWriter: replyWriter,
	      replyContent: replyContent,
	      boardNo: boardNo
	   },
	   success: function(result) {
	      console.log(result);
	      document.location.reload();
	   },
	   error: function() {
	      console.log("댓글 등록및 목록조회 실패");
	   }
	});
});
   /* 댓글수정 */
   function updateReply(replyNo) {
      const updatedReplyContent = prompt("댓글 수정", replyContent);
      if (updatedReplyContent === null) {
         return;
      }

      $.ajax({
         url: "${pageContext.request.contextPath}/reply/replyUpdate",
         method: "POST",
         data: {
            replyNo: replyNo,
            replyContent: updatedReplyContent
         },
         success: function(result) {
        	 console.log(result);
        	 document.location.reload();
         },
         error: function() {
            console.log("댓글 수정 실패");
         }
      });
   } 

// 댓글 삭제 함수
   function deleteReply(replyNo) {
       const confirmDelete = confirm("댓글을 삭제하시겠습니까?");
       if (!confirmDelete) {
           return;
       }

       $.ajax({
           url: "${pageContext.request.contextPath}/reply/replyDelete",
           method: "POST",
           data: {
               replyNo: replyNo
           },
           success: function(result) {
           		document.location.reload();
           },
           error: function() {
           		console.log("댓글 삭제 실패");
           }
       });
   }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
