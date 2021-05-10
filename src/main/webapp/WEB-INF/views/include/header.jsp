<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header><!--header-->
	<div class="container">
		<div class="row">
			<a href="/crescent" class="col-md-2 offset-md-4"><img src="/resources/img/cm_logo.png" id="logo"></a>
			<div class="col-md-4 offset-md-2 mt-5 text-right">
				<c:if test="${empty login}">
					<!-- 로그인O -->
					<a href="/member/login">로그인/회원가입</a>
					<a href="/cart" class="ml-3">장바구니</a><br>
				</c:if>
				<c:if test="${not empty login}">
					<!-- 로그인X -->
					<a href="/member/logout" id="logout">로그아웃</a>
					<a href="/cart" class="ml-3">장바구니</a>
					<a href="/member/mypage" class="ml-3">마이페이지</a><br>
				</c:if>
			</div><!-- div col end -->
		</div><!-- div row end -->
	</div><!-- div container end -->
</header><!-- header end -->