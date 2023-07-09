<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  


<head>
<link href="${pageContext.request.contextPath}/resources/css/item.css?v=<%System.currentTimeMillis(); %>" rel="stylesheet" />
</head>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="packagemain" name="title" />
</jsp:include>  

<div class="item-logo">
	<div class="item-logo-text">
		<p id="text1">베지팜은 파트너 농가와 함께 합니다.</p>
	</div>
</div>

<div class="container" style="width: 1200px"> 
<jsp:include page="/WEB-INF/views/item/sidebar.jsp">
	<jsp:param value="packagemain" name="title" />
</jsp:include>  
	<main class="itemList-main">	
		<button class="insert-btn" onclick="location.href='${pageContext.request.contextPath}/item/insertList.bo'">글쓰기</button>
		<c:forEach items="${itemlist}" var="item">
			<a href="${pageContext.request.contextPath}/item/itemForm.bo?INo=${item.itemNo}" >
				<div class="card">
					<img src="${pageContext.request.contextPath}/resources/images/itemlogo/${item.itemLogo}" alt="logo"> 
					<h5>${item.itemName}</h5>
					<p>${item.itemLocal}</p>
					<p><fmt:formatNumber value="${item.itemPrice}" pattern="#,###"/>원</p>
						
				</div>
			</a>	
		</c:forEach>
	</main>
</div>
