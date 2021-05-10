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
					<h3>비밀번호 변경</h3>
					<form action="/member/update" id="update" method="post">
						
					</form>
				</div>
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
			var mid = "${find.mid}";
			
			var str = "";
			
			if(mid !== "") {
				str += "<h4>아이디 : ${find.mid}</h4>"
					+ "<input type='hidden' name='mid' value='${find.mid}'>"
					+ "<input class='form-control' type='password' name='pwd' id='pwd' placeholder='PWD'>"
					+ "<input class='form-control mt-1' type='password' id='pwdChk' placeholder='PWD CHECK'>"
					+ "<button class='btn btn-success mt-3' id='chg' type='submit'><h4 id='h4Btn'>변경하기</h4></button>";
				
				$("#update").html(str);
				
			} else if (mid === "") {
				alert("일치하는 정보가 없습니다.");
				location.href = "/member/find";
			}
			
			$("#chg").on("click", function(e) {
				e.preventDefault();
				if( $.trim( $("#pwd").val() ) == '' ){
	                   alert("변경하실 비밀번호를 입력하세요.");
	                   $("#pwd").focus();
	                   return;
				}//if
				if( $.trim( $("#pwdChk").val() ) == '' ){
	                   alert("비밀번호를 체크해주세요.");
	                   $("#pwdChk").focus();
	                   return;
				}//if
                if( $.trim( $("#pwdChk").val() ) !== $("#pwd").val() ){
                    alert("패스워드와 패스워드 확인이 다릅니다.");
                    $("#pwd").focus();
                    return;
                }
				 
				alert("비밀번호가 변경되었습니다.")
				update.submit();
			});//chgBtn
			
		});//ready
	</script>
</body>
</html>