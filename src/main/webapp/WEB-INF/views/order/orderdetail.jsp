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
            <div class="col-md-12">
                <h1><strong>주문내역</strong></h1>
            </div>
        </div><!-- div row end -->
        
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <div class="jumbotron">
                
                </div>
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
			var orderNumber = ${orderNumber};
			
    		function getOrder() {
				var str ="";
				
				$.getJSON("/order/" + orderNumber, function(data){
		    		
		    		var timestamp = data.orderdate;
					var date = new Date(timestamp);
					
					var formattedTime = date.getFullYear()
										+ "/" + (date.getMonth()+1)
										+ "/" + date.getDate();
					
					str += "<div class='row'><div class='col-md-4'><h5>주문번호</h5><h4>"
						+ data.orderNumber + "</h4></div><div class='col-md-4'><h5>주문일자</h5><h4>"
						+ formattedTime + "</h4></div><div class='col-md-4 text-right'><h5>배송상태</h5><h4>";
						
					if(data.ship == "1") {
						str += "상품준비중</h4></div>";
					} else if(data.ship == "2") {
						str += "배송중</h4></div>";
					} else if(data.ship == "3") {
						str += "배송완료</h4></div>";
					}
					
					str += "</div><div class='row'><table class='table text-center'><thead><tr>"
						+ "<th><h4><strong>상품명</strong></h4></th><th><h4><strong>수량</strong></h4>"
						+ "</th><th><h4><strong>판매가</strong></h4></th></tr></thead><tbody id='detail'>"
						+ "</tbody></table><div class='col-md-12 text-right'><h5>총 주문금액 : " + data.total + "원</h5>"
						+ "<a href='/order/orderlist'><button type='button' class='btn btn-primary'><h4 id='h4Btn'>목록으로</h4></button></a></div>";
						
					$(".jumbotron").html(str);
					getOrderDetail();
		    	});//getJson
			}//getOrder
			getOrder();
	    	
	    	function getOrderDetail() {
	    		var str = "";
		    	$.getJSON("/order/detail/" + orderNumber, function(data){
					$(data).each(function() {
						str += "<tr><td>"
							+ this.pname + "</td><td>"
							+ this.ocnt + "</td><td>"
							+ this.result + "원</td></tr>";
					});//each
					
					$("#detail").html(str);
		    	});//getJson
			}//getOrderDetail
		});//ready
    </script>
</body>
</html> 