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
    
</style>


<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="상세보기" name="title"/>
</jsp:include>

<br><br>

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
      <a href="${pageContext.request.contextPath}/board/boardList.bo?boardNo=${board.boardNo}" class="btn-update">뒤로가기</a> 
   </div>
</div>
<br><br><br><br>
 <!-- 댓글 표시 부분      댓글 시작 !-->
   <h3>댓글</h3>
   <div id="replyList">
      <c:forEach items="${replyList}" var="reply">
	         <div class="reply">
		            <div class="reply-header">
		               <span class="replyWriter">${reply.replyWriter}</span>
		               <span class="replyCreate">${reply.replyCreate}</span>
		            </div>
	            <div class="replyContent">${reply.replyContent}</div>
	         </div>
      </c:forEach>
   </div>
   
   <!-- 댓글 등록 폼 -->
   <h3>댓글 작성</h3>
   <form id="replyForm">
	      <div class="form-group">
		         <label for="replyWriter">작성자</label>
		         <input type="text" id="replyWriter" name="replyWriter" required>
	      </div>
	      <div class="form-group">
		         <label for="replyContent">내용</label>
		         <textarea id="replyContent" name="replyContent" rows="3" required></textarea>
	      </div>
	       <input type="hidden" name="boardNo" value="${board.boardNo}">  <!--  어려우니 복습-->
      <button type="submit" class="btn btn-submit">댓글 등록</button>
   </form>

 <!--  스크립트 시작 -->
<script>
   // 댓글 등록 폼 제출 시 AJAX 요청 처리
   document.querySelector("#replyForm").addEventListener('submit', (e) => {
      e.preventDefault();
      
      const replyWriter = document.querySelector("#replyWriter").value;
      const replyContent = document.querySelector("#replyContent").value;
      
      // AJAX 요청을 통해 댓글 등록 처리
      $.ajax({
         url: "${pageContext.request.contextPath}/reply/create",
         method: "POST",
         data: {
            replyWriter: replyWriter,  //앞에게 키 뒤에것이 밸류값
            replyContent: replyContent,
            boardNo: "${board.boardNo}" // 게시글 번호
         },
         success: function(response) {
            // 등록 후 화면 갱신
            if (response.success) {
               selectReplyList(); // 댓글 목록 조회 함수 호출
               document.querySelector("#replyWriter").value = ""; // 작성자 초기화
               document.querySelector("#replyContent").value = ""; // 내용 초기화
            } else {
               console.log(response.message); // 등록 실패 시 오류 메시지 출력
            }
         },
         error: function(xhr, status, error) {
            console.log(error); // 오류 발생 시 콘솔에 출력
         }
      });
   });
   
   // 댓글 목록 조회 함수
/*    function selectReplyList() {
      $.ajax({
         url: "${pageContext.request.contextPath}/reply/list",
         method: "GET",
         data: {
            boardNo: "${board.boardNo}" // 게시글 번호
         },
         success: function(response) {
            // 댓글 목록을 표시하는 코드 작성
            let replyList = response.replyList;
            let replyHtml = '';
            for (let i = 0; i < replyList.length; i++) {
               let reply = replyList[i];
               replyHtml += `
                  <div class="reply">
                     <div class="reply-header">
                        <span class="reply-writer">${reply.replyWriter}</span>
                        <span class="reply-date">${reply.replyCreate}</span>
                     </div>
                     <div class="reply-content">${reply.replyContent}</div>
                  </div>
               `;
            }
            document.querySelector("#replyList").innerHTML = replyHtml;
         },
         error: function(xhr, status, error) {
            console.log(error); // 오류 발생 시 콘솔에 출력
         }
      }); 
   }*/
   
   // 페이지 로드 시 댓글 목록 조회
/*    selectReplyList(); */


</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp" />
