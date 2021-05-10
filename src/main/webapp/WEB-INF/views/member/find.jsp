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
    
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2 mt-5">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-justified" >
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#idfind">아이디 찾기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#pwfind">비밀번호 찾기</a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div id="idfind" class="container tab-pane active my-5"><br>
	                    <form id="findIdForm" action="/member/findId" method="post">
	                        <div class="col-md-12 text-center my-2">
	                            <button class="btn btn-secondary" type="button" disabled>
	                               이름
	                            </button>
	                            <input name="name" id="name" type="text" size="30" placeholder="NAME">
	                        </div>
	                        
	                        <div class="col-md-12 text-center">
	                            <button type="button" class="btn btn-secondary" disabled>
	                                전화번호
	                            </button>
	                            <input name="tel1"  id="tel1" type="text" maxlength="3" size="5">
	                            - <input name="tel2"  id="tel2" type="text" maxlength="4" size="6">
	                            - <input name="tel3"  id="tel3" type="text" maxlength="4" size="6">
	                        </div>
	                        <div class="col-md-12 text-center my-4">
	                               <button class="btn btn-success my-4" id="findId" type="button">
	                                   <h5 id="h5Btn">아이디 찾기</h5>
	                               </button>
	                        </div>
                        </form>
                    </div><!--div idfind end-->
                    
                    <div id="pwfind" class="container tab-pane my-5 fade"><br>
	                    <form id="findPwdForm" action="/member/findPwd" method="post">
	                        <div class="col-md-12 text-center my-2">
	                            <button class="btn btn-secondary" type="button" disabled>
	                                아이디
	                            </button>
	                            <input name="mid" id="pwId" type="text" size="30" placeholder="ID">
	                        </div>
	                        <div class="col-md-12 text-center my-2">
	                            <button class="btn btn-secondary" type="button" disabled>
	                                이름
	                            </button>
	                            <input name="name" id="pwName" type="text" size="30" placeholder="NAME">
	                        </div>
	                         
	                        <div class="col-md-12 text-center">
	                            <button type="button" class="btn btn-secondary" disabled>
	                                전화번호
	                            </button>
	                            <input name="tel1" id="pwTel1" type="text" maxlength="3" size="5">
	                            - <input name="tel2" id="pwTel2" type="text" maxlength="4" size="6">
	                            - <input name="tel3" id="pwTel3" type="text" maxlength="4" size="6">
	                        </div>
							
	                        <div class="col-md-12 text-center my-4">
	                            <button class="btn btn-success my-4" id="findPw" type="submit">
	                                <h5 id="h5Btn">비밀번호 찾기</h5>
	                            </button>                            
	                        </div>
	                    </form>
                    </div><!--div pwfind end-->
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
    		
		     $("#findId").on("click", function() {
		                if( $.trim( $("#name").val() ) == '' ){
		                    alert("이름을 입력하세요.");
		                    $("#name").focus();
		                    return;
		                    
		                }if( $.trim( $("#tel1").val() ) == '' ){
		                    alert("전화번호를 입력하세요.");
		                    $("#tel1").focus();
		                    return;
		                    
		                }if( $.trim( $("#tel2").val() ) == '' ){
		                    alert("전화번호를 입력하세요.");
		                    $("#tel2").focus();
		                    return;
		                    
		                }if( $.trim( $("#tel3").val() ) == '' ){
		                    alert("전화번호를 입력하세요.");
		                    $("#tel3").focus();
		                    return;
		                    
		                }
		    	  	                
		                findIdForm.submit();
		     	});//findId
		                
     			$("#findPw").on("click", function(e) {
     				e.preventDefault();
	                if( $.trim( $("#pwId").val() ) == '' ){
	                    alert("아이디를 입력하세요.");
	                    $("#pwId").focus();
	                    return;
	                }if( $.trim( $("#pwName").val() ) == '' ){
	                    alert("이름을 입력하세요.");
	                    $("#pwName").focus();
	                    return;
	                    
	                }if( $.trim( $("#pwTel1").val() ) == '' ){
	                    alert("전화번호를 입력하세요.");
	                    $("#pwTel1").focus();
	                    return;
	                    
	                }if( $.trim( $("#pwTel2").val() ) == '' ){
	                    alert("전화번호를 입력하세요.");
	                    $("#pwTel2").focus();
	                    return;
	                    
	                }if( $.trim( $("#pwTel3").val() ) == '' ){
	                    alert("전화번호를 입력하세요.");
	                    $("#pwTel3").focus();
	                    return;
	                    
	                }//if
	                
	    			findPwdForm.submit();
     			});//pwdBtn
     			
    	});//ready
    </script>
</body>
</html>