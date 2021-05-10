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
                <li class="nav-item"><a class="nav-link active" href="/community/notice">공지사항</a></li>
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

<div class="container">
    <div class="row my-3">
        <h1 class="col-md-6 align-self-center"><strong>공지사항 상세</strong></h1>
        <div class="col-md-6 align-self-center text-right">
            <a href="/crescent">홈</a>
            <a href="#">-</a>
            <a href="/community/notice">공지사항목록</a>
        </div>
    </div><!-- div row end -->
        
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-12">
                    <h2>${board.ntitle}</h2>
                </div>
            </div><!-- div row end -->
			
			<hr>

            <div class="row">
                <div class="col-md-12">
                    <h5>
                        ${board.ncontent}
                    </h5>
                </div>
            </div><!-- div row end -->
        </div><!-- div jumbotron end -->

        <div class="row">
            <div class="col-md-12 text-right my-3">
            	<c:if test="${login.mno == 1}">
	            	<form action="/community/remove" id="delForm" method="post">
	            		<input type="hidden" name="nno" value="${board.nno}">
		                <button type="button" id="del" class="del btn btn-danger my-3"><h4 id="h4Btn">삭제하기</h4></button>
		                <a href="/community/noticemodify?nno=${board.nno}" class="btn btn-success my-3"><h4 id="h4Btn">수정하기</h4></a>
	            	</form>
            	</c:if>
                <a href="/community/notice" class="btn btn-primary"><h4 id="h4Btn">목록으로</h4></a>
            </div>
        </div><!-- div row end -->
    </div><!-- div container end -->
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function() {
    	
    	$("#del").on("click", function() {
    		var del = confirm("글을 삭제하시겠습니까?")
			if(del == false){
				return;
			}else{
				delForm.submit();
			}
		});//del
	})//ready
    </script>
    
    
</body>
</html>