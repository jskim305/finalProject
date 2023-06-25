<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
 	<link href="${pageContext.request.contextPath}/resources/css/main.css?after" rel="stylesheet" />
 
	 <div class="container">
        <div class="header">
            <div class="logo"></div>
            <div class="top-links">
                <a href="#">로그인</a>
                <a href="#">장바구니</a>
                <a href="#">회원가입</a>
                <a href="#">내역확인</a>
            </div>
            <div class="middle-links">
                <a href="#">베지팜이란?</a>
                <a href="#">농지예약</a>
                <a href="#">패키지</a>
                <a href="#">문의사항</a>
                <a href="#">공지사항</a>
                <a href="#" hidden="">로그인전용 또는 관리자전용페이지</a>
            </div>
            <img src="https://via.placeholder.com/1500x500" alt="Header Image">
        </div>

        <div class="main">
            <div class="sidebar">
                <h3>상품 리스트</h3>
                <p>상품 1</p>
                <p>상품 2</p>
                <p>상품 3</p>
            </div>
            <div class="content">
                <div class="card">
                    <img src="https://via.placeholder.com/500x200" alt="Card Image">
                    <h3>제목 1</h3>
                    <p>텍스트 1</p>
                </div>
                <div class="card">
                    <img src="https://via.placeholder.com/500x200" alt="Card Image">
                    <h3>제목 2</h3>
                    <p>텍스트 2</p>
                </div>
                <div class="card">
                    <img src="https://via.placeholder.com/500x200" alt="Card Image">
                    <h3>제목 3</h3>
                    <p>텍스트 3</p>
                </div>
                <div class="card">
                    <img src="https://via.placeholder.com/500x200" alt="Card Image">
                    <h3>제목 1</h3>
                    <p>텍스트 1</p>
                </div>
                <div class="card">
                    <img src="https://via.placeholder.com/500x200" alt="Card Image">
                    <h3>제목 2</h3>
                    <p>텍스트 2</p>
                </div>
                <div class="card">
                    <img src="https://via.placeholder.com/500x200" alt="Card Image">
                    <h3>제목 3</h3>
                    <p>텍스트 3</p>
                </div>
            </div>
        </div>
</head>
<body>
    