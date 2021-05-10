<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <a href="/resources/product/list" class="input-group-text"><img src="/resources/icon/search.svg"></a>
                        </div>
                    </div>
                </li>
            </ul><!-- ul nav end -->
        </div><!-- div container end -->
    </nav><!-- nav end -->
	
	<div class="container text-center">
		<div class="row">
			<div class="col-md-4 offset-md-4 text-center my-5">
				<div class="jumbotron">
					<h3>${find.name}님의 아이디는</h3>
					
					<h4><strong style="color: blue;">${find.mid}</strong>입니다.</h4>
				</div>
				
				<a href="/member/login" class="btn btn-success"><h4 id="h4Btn">로그인창으로</h4></a>
			</div>
		</div>
	</div>
		
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    	
    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
    
	<script type="text/javascript">
		$(document).ready(function() {
			var find = "${find.mid}";
			
			if(find === "") {
				alert("일치하는 정보가 없습니다.");
				location.href = "/member/find";
			};
		});
	</script>
</body>
</html>































