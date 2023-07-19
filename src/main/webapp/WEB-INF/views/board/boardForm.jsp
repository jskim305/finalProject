<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
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
    height: 500px;
    min-width: 800px;
    min-height: 150px;
    max-width: 500px;
    max-height: 500px;
    overflow: auto;
}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="글쓰기" name="title"/>
</jsp:include>

<br><br>

<div id="container">
	 <h2>${tag} 게시글 작성</h2>
	
    <form action="${pageContext.request.contextPath}/board/boardEnroll.bo" method="post" name="enrollfrm" >
        <div class="form-group">
            <label for="boardTitle">제목</label>
            <input type="text" id="boardTitle" name="boardTitle" required>
        </div>
        <div class="form-group">
            <label for="boardWriter">작성자</label>
           <input type="text" id="boardWriter" name="boardWriter" value="${loginMember.memId}" readonly>
     	   <input type="hidden" name="boardTag" value="${tag}">
        </div>
        <!-- <div class="form-group">
            <label for="boardTag">게시글 구분</label>
            <input type="text" id="boardTag" name="boardTag" required>
        </div> -->
        
        
        
         <!--네임은 키와 값으로 들어감    -->
        
        
        <div class="form-group">
            <label for="boardContent">내용</label>
            <textarea id="boardContent" name="boardContent" rows="10" cols="50" required></textarea>
        </div>
        <div class="btn-group">
            <button type="submit" class="btn">등록</button>
            <button type="reset" class="btn btn-reset">초기화</button>
        </div>
    </form>
</div>

<br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
