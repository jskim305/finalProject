<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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


<div class="container" style="width: 1000px">
	<jsp:include page="/WEB-INF/views/item/sidebar.jsp">
		<jsp:param value="packagemain" name="title" />
	</jsp:include>  
	<main class="item-Form-main">
		<form name="frm">
			<h1>상품등록페이지</h1>
			<table>			
				<tr>
					<td>상품구분</td>
					<td><input name="itemSector" placeholder="예 과일,사과"></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td> <input name="itemName" placeholder="상품명을 입력해주세요."> </td>
				</tr>			
				<tr>
					<td>가격</td>
					<td><input name="itemPrice" type="number" placeholder="숫자만 입력해주세요"></td>
				</tr>			
				<tr>
					<td>상품설명</td>
					<td><input name="itemContent" placeholder="상품을 설명을 입력해주세요."></td>
				</tr>			
				<tr>
					<td>재배 농가</td>
					<td><input name="itemLocal" placeholder="재배 농가를 입력해주세요"></td>
				</tr>			
				<tr>
					<td>재고량</td>
					<td><input name="itemCount" type="number" placeholder="숫자만 입력해주세요"></td>
				</tr>				
				<tr>
					<td>사용할 로고 파일명</td>
					<td><input name="itemLogo"></td>
				</tr>			
			</table>
		</form> 
		<button type="button" class="iteminsert-btn" onclick="insertItem()">저장</button>
		
	</main>
</div>
<script>
	const insertItem = () => {
	    frm.method = 'post';
	    frm.action = '${pageContext.request.contextPath}/item/insertItem.bo';
	    frm.submit();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />