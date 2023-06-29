<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
   #container{width:500px; margin:auto;}
   th, td{height:30px;}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="상세보기" name="title"/>
</jsp:include>
<br><br>
<div id="container">
   <table class="table">
      <tr>
         <th scope="col">제목</th>
         <td scope="col">${board.bTitle}</td>
      </tr>
      <tr>
         <th scope="col">작성자</th>
         <td scope="col">${board.bWriter}</td>
      </tr>
      <tr>
         <th scope="col">내용</th>
         <td scope="col">
            <textarea name="content" rows="10" cols="50" required>${board.bContent}</textarea>
         </td>
      </tr>
      <tr>
         <th scope="col">조회수</th>
         <td scope="col">${board.bCount}</td>
      </tr>
      <tr>
         <th scope="col">작성일</th>
         <td scope="col">${board.bCreate}</td>
      </tr>
   </table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
