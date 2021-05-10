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
                <li class="nav-item"><a class="nav-link active" href="/community/">커뮤니티</a></li>
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
            <h1 class="col-md-6 align-self-center"><strong>Q&amp;A 수정 페이지</strong></h1>
        </div><!-- div row end -->
        
        <div class="row">
            <div class="col-md-6">
            	<input type="hidden" id="qno" name="qna" value="${qno}">
                <h4>글제목</h4>
                <input class="form-control" type="text" id="qtitle" name="qtitle" maxlength="20">
            </div>
        </div><!-- div row end -->
        
        <hr>

        <textarea class="form-control" id="qcontent" name="qcontent" rows="10"></textarea>

        <div class="row">
            <div class="col-md-12 text-right">
                <button class="btn btn-primary my-3" id="modBtn"><h4 id="h4Btn">Q&amp;A 수정</h4></button>
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
			var qno = $("#qno").val();
    		
    		function getDetail() {
				$.getJSON("/qna/" + qno, function(data) {
					$("#qtitle").attr("value", data.qtitle);
					$("#qcontent").html(data.qcontent);
				});//getJSON
			}//getDetail
			getDetail();
    		
    		$("#modBtn").on("click", function() {
				var qtitle = $("#qtitle").val();
				var qcontent = $("#qcontent").val();
				
				$.ajax({
					type : 'patch',
					url : '/qna/' + qno,
					heade : {
						"Content-Type" : "apllication/json",
						"X-HTTP-Method-Override" : "PATCH"
					},
					contentType : "application/json",
					data : JSON.stringify({
						qno : qno,
						qtitle : qtitle,
						qcontent : qcontent
					}),
					dataType : 'text',
					success : function(result) {
						console.log("result : " + result);
						if(result === 'SUCCESS') {
							alert("수정되었습니다.");
							location.href="/community/askdetail?qno=" + qno;
						}
					}
				});//ajax
			});//modBtn
			
		});//ready
    </script>
</body>
</html>