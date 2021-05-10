<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap.min.css -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!--custom.css-->
<link href="/resources/css/custom.css" rel="stylesheet">
<!--jquery.min.js-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>CRESCENT MOON</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/cm_icon.png">
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
        
    <nav>
        <div class="container">
            <ul class="nav nav-tabs nav-justified" id="nav">
                <li class="nav-item"><a class="nav-link" href="/community/notice">공지사항</a></li>
                <li class="nav-item"><a class="nav-link" href="/product/list">전체상품</a></li>
                <li class="nav-item"><a class="nav-link" href="/community/">커뮤니티</a></li>
                <li class="nav-item">
                    <div class="input-group">
                        <input class="form-control" type="text" id="search">
                        <div class="input-group-append">
                            <button type="button"class="input-group-text" id="searchBtn"><img src="/resources/icon/search.svg"></button>
                        </div>
                    </div>
                </li>
            </ul><!-- ul nav end -->
        </div><!-- div container end -->
    </nav><!-- nav end -->
    
    <div class="container mb-5" id="login">
        <div class="row">
            <form class="col-md-4 offset-md-4 text-center" action="/member/loginPost" method="post">
                <h1 class="my-5">로그인</h1>
                <div class="input-group my-3">
                    <span class="input-group-text">
                        <img src="/resources/icon/person.svg">
                    </span>
                    <input class="form-control" type="text" name="mid" id="mid" placeholder="ID">
                </div>
                <div class="input-group my-3">
                    <span class="input-group-text">
                        <img src="/resources/icon/key.svg">
                    </span>
                    <input class="form-control" type="password" name="pwd" id="pwd" placeholder="PWD">
                </div>
                <div class="row">
                    <div class="text-left col-md-7">
                        <a href="/member/find">아이디/비밀번호 찾기</a><br>
                        <a href="/member/join">회원가입</a>
                    </div>
                    <div class="text-right col-md-5">
                        <button class="btn btn-success" type="submit"><h4 id="h4Btn">로그인</h4></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
</body>
</html>