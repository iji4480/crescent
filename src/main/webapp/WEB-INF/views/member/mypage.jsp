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

    <div class="container my-3">
        <div class="col-md-8 offset-md-2">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h3 class="mb-4"><strong>내정보</strong></h3>
                    </div>
                </div><!-- div row end -->
                <div class="row">
                    <div class="col-md-12 text-center" id="myInfo">
                        
                    </div>
                </div><!-- div row end -->
                <div class="row">
                    <div class="col-md-12 text-right">
                        <a href="/member/myinfo" class="text-primary">자세히 보기..</a>
                    </div>
                </div><!-- div row end --><!--내정보-->
                
                <hr>

                <div class="row">
                    <div class="col-md-12 text-center">
                        <h3 class="mb-4"><strong>최근주문내역</strong></h3>

						<div class="row" id="orderNumber">
							
						</div><!-- div row end -->
                        
                    </div>
                </div><!-- div row end -->
                
				<div class="row">
				    <table class="table text-center">
				        <thead>
				            <tr>
				                <th><h4><strong>상품명</strong></h4></th>
				                <th><h4><strong>수량</strong></h4></th>
				                <th><h4><strong>소계</strong></h4></th>
				            </tr>
				        </thead>
				        <tbody id="orderList">
				            
				        </tbody>
				    </table>
				</div><!-- div row end -->

                <div class="row">
                    <div class="col-md-12 text-right">
                    	<h5 id="total"></h5>
                        <a href="/order/orderlist" class="text-primary">자세히 보기..</a>
                    </div>
                </div><!-- div row end --><!--주문내역-->
                
                <hr>

                <div class="row">
                    <div class="col-md-12 text-center">
                        <h3 class="mb-4"><strong>최근작성글</strong></h3>
						<hr>
						<h4>문의</h4>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <tbody id="myQna">
                                
                            </tbody>
                        </table>
                        <hr>
						<h4>리뷰</h4>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <tbody id="myReview">
                                
                            </tbody>
                        </table>
                    </div>
                </div><!-- div row end -->
                
                <div class="row">
                    <div class="col-md-12 text-right">
                        <a href="/community/mycommunity" class="text-primary">자세히 보기..</a>
                    </div>
                </div><!-- div row end --><!--작성한글-->
            </div>
        </div><!-- div row end -->
    </div><!--div container end-->
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!--bootstrap.min.js-->
	<script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var mno = ${login.mno};
			var ordernumber = "";
			
	    	function getUserInfo(){
				var str = "";
		    	$.getJSON("/member/" + mno, function(data){
		    		var timestamp = data.joindate;
					var date = new Date(timestamp);
					
					var formattedTime = date.getFullYear()
										+ "/" + (date.getMonth()+1)
										+ "/" + date.getDate();
					
					str += "<h5>이름 : "
						+ data.name + "</h5><h5>아이디 : "
						+ data.mid + "</h5><h5>전화번호 : "
						+ data.tel1 + "-" + data.tel2 + "-" + data.tel3 + "</h5><h5>"
	                    + formattedTime + "</h5>";
					
					$("#myInfo").html(str);
		    	});//getJson
	    	}//getUserInfo
	    	getUserInfo();
			
			function getOrder() {
				var str ="";
				
				$.getJSON("/order/listMno/" + mno, function(data){
		    		
		    		var timestamp = data.orderdate;
					var date = new Date(timestamp);
					
					var formattedTime = date.getFullYear()
										+ "/" + (date.getMonth()+1)
										+ "/" + date.getDate();
					
					str += "<div class='col-md-4 text-left'><h5>주문번호</h5><h4>"
						+ data.orderNumber + "</h4></div><div class='col-md-4 text-left'><h5>주문일자</h5><h4>"
						+ formattedTime + "</h4></div><div class='col-md-4 text-center'><h5>배송상태</h5><h4>"
						+ "<input type='hidden' id='ordernumber' value='" + data.orderNumber + "'>";
						
					if(data.ship == "1") {
						str += "상품준비중</h4></div>";
					} else if(data.ship == "2") {
						str += "배송중</h4></div>";
					} else if(data.ship == "3") {
						str += "배송완료</h4></div>";
					}
					
					ordernumber += data.orderNumber;
					
					$("#orderNumber").html(str);
					$("#total").text("총 주문금액 : " + data.total + "원");

					getOrderDetail();
		    	});//getJson
			}//getOrder
			getOrder();
	    	
	    	function getOrderDetail() {
	    		var str = "";
	    		
		    	$.getJSON("/order/detail/" + ordernumber, function(data){
		    		console.log(data);
					$(data).each(function() {
						str += "<tr><td>"
							+ this.pname + "</td><td>"
							+ this.ocnt + "</td><td>"
							+ this.result + "원</td></tr>";
					});//each
					
					$("#orderList").html(str);
		    	});//getJson
			}//getOrderDetail
			
	    	function getMyQna() {
				$.getJSON("/qna/myqna/1/3/" + mno, function(data) {
					var str = "";
					
					$(data.list).each(function() {
						var timestamp = this.qwritedate;
						var date = new Date(timestamp);
						
						var formattedTime = date.getFullYear()
											+ "/" + (date.getMonth()+1)
											+ "/" + date.getDate();
						
						str += "<tr><td><a href='/community/askdetail?qno="
							+ this.qno + "'>"
							+ this.qtitle + "</a></td><td>"
							+ formattedTime + "</td></tr>";
					});//each
					$("#myQna").html(str);
				});//getJSON
			}//getMyQna
			getMyQna();
	    	
	    	function getMyReview() {
				$.getJSON("/review/myreview/1/3/" + mno, function(data) {
					var str = "";
					
					$(data.list).each(function() {
						var timestamp = this.rwritedate;
						var date = new Date(timestamp);
						
						var formattedTime = date.getFullYear()
											+ "/" + (date.getMonth()+1)
											+ "/" + date.getDate();
						
						str += "<tr><td><a href='/community/reviewdetail?rno="
							+ this.rno + "'>"
							+ this.rtitle + "</a></td><td>"
							+ formattedTime + "</td></tr>";
					});//each
					$("#myReview").html(str);
				});//getJSON
			}//getMyReview
	    	getMyReview();
	    	
		});//ready
	</script>
</body>
</html>