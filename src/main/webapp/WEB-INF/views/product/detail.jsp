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
        <div class="row">
            <div class="col-md-12 text-right my-3">
                <a href="/crescent">홈</a>
                <a href="#">-</a>
                <a href="/product/list">상품목록</a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <img id="pimg"><!-- 제품이미지 들어가는곳 -->
            </div>
            <div class="col-md-6">
            	<div class="row">
	            	<div class="col-md-6">
		               <h2 id="pname"></h2><!--  상품이름 -->
	            	</div>
	            	<div class="col-md-6 text-right">
		            	<form action="/product/modify" method="post">
		            		<input type="hidden" id="pno" name="pno" value="${pno}">
		            		<c:if test="${login.mid == 'admin'}">
			            		<button class="btn btn-primary mr-3" type="submit"><h5 id="h5Btn">수정하기</h5></button>
		                    	<button class="btn btn-danger mr-3" type="button" id="delBtn"><h5 id="h5Btn">삭제하기</h5></button>
		            		</c:if>
		            	</form>
	            	</div>
            	</div>
            	<div class="row">
            		<div class="col-md-12">
		            	<hr>
            		</div>
            	</div>
                <div class="row text-center my-5">
                    <div class="col-md-6 text-center">
                        <h3>판매가</h3>
                    </div>
                    <div class="col-md-6 text-center">
                       <h3 id="price"></h3><!--  상품 가격 -->
                    </div>
                </div><!--div row end-->

                <div class="row text-center my-4">
                    <div class="col-md-6 text-center">
                        <h3>수량</h3>
                    </div>
                    <div class="col-md-6 text-center">
                        <select class="form-control" name="cnt" id="cnt">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div><!--div row end-->

                <hr>
                <div class="row">
                    <div class="col-md-7 text-right">
                        <h4>총 가격</h4>
                    </div>
                    <div class="col-md-5 text-right">
                        <h4>20,000원</h4>
                    </div>
                </div><!--div row end-->
                <div class="row text-right mt-3">
                    <div class="col-md-4 offset-md-4">
                        <!-- <button class="btn btn-warning"><h3 id="h3Btn">바로구매</h3></button> -->
                        <a href="/member/cart" class="btn btn-warning"><h3 id="h3Btn">바로구매</h3></a>
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-success" id="addCartBtn"><h3 id="h3Btn">장바구니</h3></button>
<!--                          data-toggle="modal" data-target="#cartUpdate" -->
                    </div>
                    <input type="hidden" id="del1">
                    <input type="hidden" id="del2"><!--파일 삭제를 위한 히든타입 -->
                </div>
            </div>
        </div><!--div row end-->
        <hr>
    </div><!--div container end-->

    <div class="container">
        <div class="row my-3">
            <h2 class="col-md-4 offset-md-4 text-center">인기상품</h2>
        </div>
        <div class="row" id="recommend">
            
        </div><hr><!--div row end-->
    </div><!--div container end-->

    <div class="container ">
        <div class="row mb-3">
            <div class="col-md-8 offset-md-2">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-justified">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#detail">상세설명</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#review">리뷰</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#qna">Q&amp;A</a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div id="detail" class="container tab-pane active"><br>
                        <img src="/resources/product/com_top.jpg">
                        <img id="pdimg"><!-- 제품 상세 이미지 들어가는곳 -->
                        <img src="/resources/product/com_bot.jpg">
                    </div><!--div detail end-->
                    <div id="review" class="container tab-pane fade"><br>
                        <h3>리뷰</h3>
                        <div class="row">
                        	<div class='col-md-12' id="review">
		                        
                        	</div>
                        </div>
                    </div><!--div review end-->
                    <div id="qna" class="container tab-pane fade"><br>
                        <div class="row">
                        	<div class='col-md-12'>
		                        <h3>Q&amp;A</h3>
		                        
		                        
                        	</div>
                        </div>
                    </div><!--div QA end-->
                </div>
            </div>
        </div><!--div row end-->
    </div><!--div container end-->
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <div class="modal fade" id="cartUpdate">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">장바구니 추가완료</h4>
                </div><!-- modal header -->

                <div class="modal-body">
                    <h5>장바구니에 추가되었습니다.</h5>
                </div><!-- modal body -->

                <div class="modal-footer">
                    <button class="btn btn-warning" type="button" id="closeBtn" data-dismiss="modal">닫기</button>
                </div>

            </div><!-- modal content -->
        </div><!-- modal-dialog -->
    </div><!-- div modal fade end -->

    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
    
    <script type="text/javascript">
	    $(document).ready(function(){
	    	var pno = ${pno};
	    	
	    	function getRecom() {
	    		$.getJSON("/product/recom" , function(data){
					var str = "";
					
					$(data).each(function(){
						str += "<div class='col-md-3 text-center'><a href='/product/detail?pno="
							+ this.pno + "'><img class='img-thumbnail' src='/product/display?fileName="
							+ this.pimg + "'></a><hr><a href='/product/detail/?pno="
			                + this.pno + "'>"
			                + this.pname + "</a><p>"
			                + this.price + "원</p><hr></div>";
					});
					$("#recommend").html(str);
				});
			}//getRecom
			getRecom();
	    	
	    	function getReview() {
	    		$.getJSON("/review/product/" + pno , function(data){
					var str = "";
					
					$(data).each(function(){
						var timestamp = this.rwritedate;
						var date = new Date(timestamp);
						
						var formattedTime = date.getFullYear()
											+ "/" + (date.getMonth()+1)
											+ "/" + date.getDate();
						
						str += "<hr><div class='row'><div class='col-md-12'><a href='/community/reviewdetail?rno="
						+ this.rno + "'>"
						+ this.rtitle + "</a></div></div><div class='row'><div class='col-md-8'><p>"
						+ this.mid + "</p></div><div class='col-md-4'><p>"
						+ formattedTime + "</p></div></div><div class='row'><div class='col-md-12'><h5>"
						+ this.rcontent + "</h5></div></div>";
					});
					$("#review").html(str);
				});
			}//getReview
			getReview();
	    	
	    	function getQna() {
	    		$.getJSON("/qna/product/" + pno , function(data){
					var str = "";
					
					$(data).each(function(){
						var timestamp = this.qwritedate;
						var date = new Date(timestamp);
						
						var formattedTime = date.getFullYear()
											+ "/" + (date.getMonth()+1)
											+ "/" + date.getDate();
						
						str += "<hr><div class='row'><div class='col-md-12'><a href='/community/askdetail?qno="
						+ this.qno + "'>"
						+ this.qtitle + "</a></div></div><div class='row'><div class='col-md-8'><p>"
						+ this.mid + "</p></div><div class='col-md-4'><p>"
						+ formattedTime + "</p></div></div><div class='row'><div class='col-md-12'><h5>"
						+ this.qcontent + "</h5></div></div>";
					});
					$("#qna").html(str);
				});
			}//getQna
			getQna();
	    	
	    	$("#addCartBtn").on("click", function() {
	    		
	    		if("${login.mno}" === "") {
	    			alert("로그인 후에 이용해주세요.");
	    			return;
	    		}
	    		
		    	var cnt = $("#cnt option:selected").val();
		    	
				$.ajax({
					type : 'post',
					url : '/cart/addCart',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						mno : "${login.mno}",
						pno : pno,
						cnt : cnt
					}),
					success : function(result) {
						if(result === 'SUCCESS') {
							$("body").attr("class", "modal-open");
							$("body").attr("style", "padding-right: 17px;");
			                $("body").prepend("<div class='modal-backdrop fade show'></div>");
			                $("#cartUpdate").attr("class", "modal fade show");
			                $("#cartUpdate").attr("aria-hidden", "false");
			                $("#cartUpdate").attr("aria-modal", "true");
			                $("#cartUpdate").attr("style", "diplay: block; padding-right: 17px;");
			                $("#cartUpdate").attr("role", "dialog");
			                $("#cartUpdate").show("");
						} else if(result === 'FAIL') {
			                $(".modal-header").html("장바구니 추가 실패");
			                $(".modal-body").html("해당 상품은 이미 장바구니에 담겨있습니다.");
							$("body").attr("class", "modal-open");
							$("body").attr("style", "padding-right: 17px;");
			                $("body").prepend("<div class='modal-backdrop fade show'></div>");
			                $("#cartUpdate").attr("class", "modal fade show");
			                $("#cartUpdate").attr("aria-hidden", "false");
			                $("#cartUpdate").attr("aria-modal", "true");
			                $("#cartUpdate").attr("style", "diplay: block; padding-right: 17px;");
			                $("#cartUpdate").attr("role", "dialog");
			                $("#cartUpdate").show("");
						}
					},
					error : function(result) {
						alert("시스템 에러가 발생하였습니다. 잠시후 다시 시도해주세요.")
					}
				});//ajax
			});//addCartBtn
			
			$("#closeBtn").on("click", function() {
                $("body").attr("class", "");
                $("body").attr("style", "");
                $(".modal-backdrop").remove();
                $("#cartUpdate").attr("class", "modal fade");
                $("#cartUpdate").attr("aria-hidden", "true");
                $("#cartUpdate").attr("aira-modal", "false");
                $("#cartUpdate").attr("style", "diplay: none");
                $("#cartUpdate").attr("role", "");
                $("#cartUpdate").hide("");
            });//onclick
	    	
	    	function getOne() {
	    		$.getJSON("/product/one/" + pno, function(data){
	    			 $('#pimg').attr('src', "/product/display?fileName="+data.pimg);
	    			 $('#pdimg').attr('src', "/product/display?fileName="+ data.pdimg);
	    			 $('#pname').text(data.pname);
	    			 $('#price').text(data.price);
	    			 $('#del1').val(data.pimg);
	    			 $('#del2').val(data.pdimg);
	    			 
	    		});//getJSON
	    	}//getOne
	    	getOne();
	    	
	    	$("#delBtn").on("click" , function() {
	    		var del1 = $('#del1').val();
				var del2 = $('#del2').val();
				
				var targetLi = $(this).closest("li");
				
				$.ajax({
					url: '/product/deleteFile',
					data: {del1: del1, del2:del2},
					dataType: 'text',
					type:'POST',
					success: function(result){
						targetLi.remove();
					}
				});//ajax
				
	    		$.ajax({
	    			type:'delete',
	    			url:'/product/' + pno,
	    			header : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					success: function(result) {
						if(result === 'SUCCESS') {
							alert("삭제 되었습니다.");
							window.location.href = "/product/list";
						}
					}
	    		});//ajax
	    	});//delBtn
	    	
	    });//ready
    </script>
</body>
</html>