<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  


<aside>
	<ul class="sidebar" >
			<li><a href="${pageContext.request.contextPath}/item/itemlist.bo">전체보기</a></li>
			<li><a href="${pageContext.request.contextPath}/item//findItems.bo?category=과일">과일</a>
				<ul class="subBar">
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=사과">사과</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=배">배</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=수박">수박</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=멜론">멜론</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=참외">참외</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=자두">자두</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=복숭아">복숭아</a></li>
				</ul>
			</li>
			<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=채소">채소</a>
				<ul class="subBar">
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=고구마">고구마</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=감자">감자</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=무">무</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=나물">나물</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=버섯">버섯</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=쌈채">쌈채</a></li>
				</ul>
			</li>
			<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=견과류">견과류</a>
				<ul class="subBar">
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=아몬드">아몬드</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=호두">호두</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=땅콩">땅콩</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=밤">밤</a></li>
				</ul>
			</li>
			<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=곡물">곡물</a>
				<ul class="subBar">
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=백미">백미</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=흑미">흑미</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=찹쌀">현미</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=흑미">흑미</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=콩류">콩류</a></li>
					<li><a href="${pageContext.request.contextPath}/item/findItems.bo?category=깨">깨</a></li>
				</ul>
			</li>
		</ul>
</aside>

