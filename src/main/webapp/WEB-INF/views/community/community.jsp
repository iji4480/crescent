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
            <h1 class="col-md-6 align-self-center"><strong>커뮤니티</strong></h1>
            <div class="col-md-6 align-self-center text-right">
                <a href="/crescent">홈</a>
                <a href="#">-</a>
                <a href="/community/">커뮤니티</a>
            </div>
        </div><!-- div row end -->

        <div class="row">
            <div class="col-md-12">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-justified">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#qna" id="qnaNav">QnA</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#review" id="reviewNav">리뷰</a>
                    </li>
                </ul>
                
                <!-- Tab panes -->
                <!--==============문의===============-->
                <div class="tab-content">
                    <div id="qna" class="container tab-pane active"><br>
                        <div class="container">
                            <div class="row">
                                <table class="table table-hover">
                                    <thead>
                                        <tr class="text-center">
                                            <th id="cummuTh"><h4><strong>상품이미지</strong></h4></th>
                                            <th><h4><strong>상품명</strong></h4></th>
                                            <th><h4><strong>제목</strong></h4></th>
                                            <th><h4><strong>작성자</strong></h4></th>
                                            <th><h4><strong>작성일</strong></h4></th>
                                        </tr>
                                    </thead>
                                    <tbody id="qnaList">
                                        
                                    </tbody>
                                </table>
                            </div><!--div row end-->
                            
                            <div class="row">
                                <div class="col-md-12 text-right">
                                    <a href="/community/askwrite" class="btn btn-success"><h5 id="h5Btn">문의 작성하기</h5></a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="pagination  justify-content-center" id="qnaPage">
                                    	
                                    </ul>
                                </div>
                            </div><!-- div row end -->
                        </div><!--div container end-->
                    </div><!--div qna end-->

                    <!--==============리뷰===============-->
                    <div id="review" class="container tab-pane fade"><br>
                        <div class="container">
                            <div class="row">
                                <table class="table table-hover">
                                    <thead>
                                        <tr class="text-center">
                                            <!-- <th><h4>상품이미지</h4></th> -->
                                            <th id="cummuTh"><h4><strong>상품이미지</strong></h4></th>
                                            <th><h4><strong>상품명</strong></h4></th>
                                            <th><h4><strong>제목</strong></h4></th>
                                            <th><h4><strong>작성자</strong></h4></th>
                                            <th><h4><strong>작성일</strong></h4></th>
                                        </tr>
                                    </thead>
                                    <tbody id="reviewList">
                                    	
                                    </tbody>
                                </table>
                            </div><!--div row end-->

                            <div class="row">
                                <div class="col-md-12 text-right">
                                    <a class="btn btn-success" href="/community/reviewwrite"><h5 id="h5Btn">리뷰 작성하기</h5></a>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="pagination  justify-content-center" id="reviewPage">
                                        
                                    </ul>
                                </div>
                            </div><!-- div row end -->
                        </div><!--div container end-->
                    </div><!--div review end-->
                </div>
            </div>
        </div><!--div row end-->
    </div><!--div container end-->
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		var page = 1;
    		
    		function getQnaList(page) {
				$.getJSON("/qna/list/" + page, function(data) {
					var str = "";
					
					$(data.list).each(function() {
						
						var timestamp = this.qwritedate;
						var date = new Date(timestamp);
						
						var formattedTime = date.getFullYear()
											+ "/" + (date.getMonth()+1)
											+ "/" + date.getDate();
						
						str += "<tr class='text-center'><td id='cummuTd'><h4><img src='/product/display?fileName="
							+ this.pimg + "' id='cummuReImg'></h4></td><td id='cummuTd'><h4><br>"
							+ this.pname + "</h4></td><td id='cummuTd'><h4><br><a href='/community/askdetail?qno=" + this.qno + "'>"
							+ this.qtitle + "</a></h4></td><td id='cummuTd'><h4>"
							+ this.mid + "</h4></td><td id='cummuTd'><h4>"
							+ formattedTime + "</h4></td></tr>";
							
					});//each
					$("#qnaList").html(str);
					printPagingQna(data.pageMaker);
				});//getJSON
			}//getQnaList
    		getQnaList(page);
			
    		function getReviewList(page) {
				$.getJSON("/review/list/" + page, function(data) {
					var str = "";
					
					$(data.list).each(function() {
						var timestamp = this.rwritedate;
						var date = new Date(timestamp);
						
						var formattedTime = date.getFullYear()
											+ "/" + (date.getMonth()+1)
											+ "/" + date.getDate();
						
						str += "<tr class='text-center'><td id='cummuTd'><h4><img src='/product/display?fileName="
							+ this.pimg + "' id='cummuReImg'></h4></td><td id='cummuTd'><h4><br>"
							+ this.pname + "</h4></td><td id='cummuTd'><h4><br><a href='/community/reviewdetail?rno=" + this.rno + "'>"
							+ this.rtitle + "</a></h4></td><td id='cummuTd'><h4><br>"
							+ this.mid + "</h4></td><td id='cummuTd'><h4><br>"
							+ formattedTime + "</h4></td></tr>";
					});//each
					$("#reviewList").html(str);
					printPagingReview(data.pageMaker);
				});//getJSON
			}//getReviewList
			getReviewList(page);
			
			function setCategory() {
				if(${cate.cate != null}) {
					$("#qnaNav").attr("class", "nav-link");
					$("#reviewNav").attr("class", "nav-link active");
					$("#qna").attr("class", "container tab-pane fade");
					$("#review").attr("class", "container tab-pane active");
				}
				
			}//getCategory
			setCategory();
			
			function printPagingQna(pageMaker) {
				var str = "";
				
				if(pageMaker.prev) {
					str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
				}
				
				for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
					var strClass = pageMaker.cri.page == i ? ' active' : '';
					str += "<li class='page-item" + strClass + "'><a href='" + i + "' class='page-link'>" + i + "</a></li>";
				}
				
				if(pageMaker.next) {
					str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
				}
				
				$("#qnaPage").html(str);
			}//printPaging
			
			function printPagingReview(pageMaker) {
				var str = "";
				
				if(pageMaker.prev) {
					str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
				}
				
				for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
					var strClass = pageMaker.cri.page == i ? ' active' : '';
					str += "<li class='page-item" + strClass + "'><a href='" + i + "' class='page-link'>" + i + "</a></li>";
				}
				
				if(pageMaker.next) {
					str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
				}
				
				$("#reviewPage").html(str);
			}//printPagingReview
			
			$("#qnaPage").on("click", "li a", function(e) {
				e.preventDefault();
				
				replyPage = $(this).attr("href");
				
				getQnaList(replyPage);
			});//qnaPage
			
			$("#reviewPage").on("click", "li a", function(e) {
				e.preventDefault();
				
				replyPage = $(this).attr("href");
				
				getReviewList(replyPage);
			});//reviewPage
			
		});//ready
    </script>
</body>
</html>