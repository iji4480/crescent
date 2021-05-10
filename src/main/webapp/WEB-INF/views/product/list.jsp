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
                <li class="nav-item"><a class="nav-link active" href="/product/list">전체상품</a></li>
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
            <h1 class="col-md-6 align-self-center"><strong>상품목록</strong></h1>
            <div class="col-md-6 align-self-center text-right">
            	<c:if test="${login.mid == 'admin'}">
	                <a href="/product/prodwrite"><button class="btn btn-success mr-3" type="button"><h5 id="h5Btn">상품추가</h5></button></a>
            	</c:if>
                <a href="/crescent">홈</a>
                <a href="#">-</a>
                <a href="/product/list">상품목록</a>
            </div>
        </div><!-- div row end -->

        <div class="row" id="productlist">
			
        </div><!-- div row end -->
	</div><!--div container end-->
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!-- bootstrap.min.js -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
    
    <script type="text/javascript">
	    $(document).ready(function() {
	    	
	    	function getAllList(){
				$.getJSON("/product/all/${pname}", function(data){
					var str = "";
					
					$(data).each(function(){
						str += "<div class='col-md-4 text-center'><a href='/product/detail?pno="
							+ this.pno + "'><img class='img-thumbnail' src='/product/display?fileName="
							+ this.pimg + "'></a><hr><a><strong>"
		                	+ this.pname + "</strong></a><p>"
		                	+ this.price + "</p><hr></div>";
					});
					$("#productlist").html(str);
				});
			}
		    getAllList();
		    
		});//ready
    </script>
</body>
</html>