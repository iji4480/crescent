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

    <div class="container">
        <div class="row my-4">
            <div class="col-lg-12 text-center">
                <div><h1> 공지 글 수정 </h1></div>
            </div>
        </div><!-- div row end -->
        <div class="row">
            <div class="col-md-8 offset-2">
                <form action="/community/modifyrun" method="post">
                    <input type="hidden" name="nno" value="${board.nno}">
                    <div class="row">
                        <div class="col-md-12">
                            <button class="btn btn-primary" disabled><h5 id="h5Btn">제목</h5></button>
                            <input type="text" class="form-control" id="ntitle" name="ntitle" value="${board.ntitle}">
                        </div>
                    </div><!--제목-->

                    <div class="row my-3">
                        <div class="col-md-12">
                            <button class="btn btn-primary" disabled><h5 id="h5Btn">내용</h5></button>
                            <textarea class="form-control" id="ncontent" name="ncontent" rows="10">${board.ncontent}</textarea>
                        </div>
                    </div><!--내용-->
					<c:if test="${login.mno == 1}">
	                    <div class="row">
	                        <div class="col-md-12 text-center mb-3">
	                            <button class="btn btn-success mr-5" id="modi" type="submit"><h5 id="h5Btn">수정하기</h5></button>
	                            <a href="/community/noticedetail?nno=${board.nno}" class="btn btn-danger"><h5 id="h5Btn">돌아가기</h5></a>
	                        </div>
	                    </div><!-- div row end -->
					</c:if>
                </form>
            </div>
        </div><!-- div row end -->
    </div> <!-- div container end -->
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function() {
			
    		$("#modi").on("click", function() {
    			alert("수정되었습니다.");
    		});//modi
    		
		});//ready
    </script>
</body>
</html>