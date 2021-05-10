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
    
    <div class="container mb-5" id="join">
	    <div class="row">
	        <div class="col-md-4 offset-md-4 text-center">
	            <h1 class="my-5">회원가입</h1>
	
	            <div class="row mb-3">
	                <button class="btn btn-primary" disabled><h6 id="h6Btn">*이름</h6></button>
	                <input class="form-control" type="text" name="name" id="name" placeholder="NAME">
	            </div><!--이름-->
	            <div class="row mb-3">
	                <button class="btn btn-primary" disabled><h6 id="h6Btn">*아이디</h6></button>
	                <input class="form-control" type="text" name="mid" id="mid" placeholder="ID">
	                <button type="button" class="btn btn-warning mt-1" id="idChk">id중복확인</button>
	                <input type="hidden" id="idChkYN" value="N">
	            </div><!--아이디-->
	            <div class="row mb-3">
	                <button class="btn btn-primary" disabled><h6 id="h6Btn">*비밀번호</h6></button>
	                <input class="form-control" type="password" name="pwd" id="pwd" placeholder="PWD">
	            </div><!--비밀번호-->
	            <div class="row mb-3">
	                <button class="btn btn-primary" disabled><h6 id="h6Btn">*비밀번호 확인</h6></button>
	                <input class="form-control" type="password" name="pwdChk" id="pwdChk" placeholder="PWD CHECK">
	            </div><!--비빌번호 확인-->
	            <div class="row text-left">
	                <button class="btn btn-primary" disabled><h6 id="h6Btn">*전화번호</h6></button>
	            </div>
	            <div class="row mb-3">
	                <input class="form-control col-md-3" type="text" name="tel1" id="tel1" maxlength="3" placeholder="010">
	                <input class="form-control col-md-3 offset-md-1" type="text" name="tel2" id="tel2" maxlength="4" placeholder="1234">
	                <input class="form-control col-md-3 offset-md-1" type="text" name="tel3" id="tel3" maxlength="4" placeholder="5678">
	            </div><!--전화번호-->
	            <div class="row">
	                <button class="btn btn-primary" disabled><h6 id="h6Btn">주소</h6></button>
	            </div>
	            <div class="row mb-1">
	                <input class="form-control col-md-4" type="text" name="postcode" id="postcode" placeholder="POSTCODE" disabled>
	                <div class="col-md-4 offset-md-4 ml-2">
	                    <button class="btn btn-warning" type="button" onclick="getPostcode();">우편번호검색</button>
	                </div>
	            </div><!--우편번호-->
	            <div class="row mb-1">
	                <input class="form-control" type="text" name="addr1" id="addr1" placeholder="ADDR" disabled>
	            </div><!--주소-->
	            <div class="row mb-3">
	                <input class="form-control" type="text" name="addr2" id="addr2" placeholder="ADDR DETAIL">
	            </div><!--상세주소-->
	            
	            <div class="text-center">
	                <button class="btn btn-success" type="button" id="joinBtn"><h4 id="h4Btn">회원가입</h4></button>
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
        	
            $("#joinBtn").click(function() {
                if( $.trim( $("#name").val() ) === '' ){
                    alert("이름을 확인 하세요.");
                    $("#name").focus();
                    return;
                }
                if( $.trim( $("#mid").val() ) === '' ){
                    alert("아이디를 확인 하세요.");
                    $("#mid").focus();
                    return;
                }
                if( $.trim( $("#pwd").val() ) === '' ){
                    alert("패스워드를 확인 하세요.");
                    $("#pwd").focus();
                    return;
                }
                if( $.trim( $("#pwdChk").val() ) !== $("#pwd").val() ){
                    alert("패스워드와 패스워드 확인이 다릅니다.");
                    $("#pwd").focus();
                    return;
                }
                if( $.trim( $("#tel1").val() ) === '' ){
                    alert("전화번호를 확인 하세요.");
                    $("#tel1").focus();
                    return;
                }
                if( $.trim( $("#tel2").val() ) === '' ){
                    alert("전화번호를 확인 하세요.");
                    $("#tel2").focus();
                    return;
                }
                if( $.trim( $("#tel3").val() ) === '' ){
                    alert("전화번호를 확인 하세요.");
                    $("#tel3").focus();
                    return;
                }
                if($("#idChkYN").val() === "N") {
                	alert("아이디 중복체크를 확인하세요.");
                	return;
                }


                var name = $("#name").val();
    			var mid = $("#mid").val();
    			var pwd = $("#pwd").val();
    			var tel1 = $("#tel1").val();
    			var tel2 = $("#tel2").val();
    			var tel3 = $("#tel3").val();
    			var postcode = $("#postcode").val();
    			var addr1 = $("#addr1").val();
    			var addr2 = $("#addr2").val();
    			
    			$.ajax({
    				type : 'post',
    				url : '/member/joinInfo',
    				headers : {
    					"Content-Type" : "application/json",
    					"X-HTTP-Method-Override" : "POST"
    				},
    			    dataType : 'text',
    			    data : JSON.stringify({
    			    	name : name,
    			    	mid: mid,
    			    	pwd : pwd,
    			    	tel1 : tel1,
    			    	tel2 : tel2,
    			    	tel3 : tel3,
    			    	postcode : postcode,
    			    	addr1 : addr1,
    			    	addr2 : addr2
    			    }),
    			    success : function(result) {
    			    	if(result === 'SUCCESS'){
    			    		alert("회원가입에 성공하였습니다.");
    			    		self.location = "/member/login";
    			    	}
    			    },
    			    error : function(result) {
						console.log("에러발생!!");
					}
    			});
                
            });//joinBtn

            $("#idChk").on("click", function() {
            	
				var mid = $("#mid").val();
				
            	if($.trim(mid) === "") {
					alert("아이디를 입력해주세요.");
					return;
				}
            	
				$.ajax({
					type : 'post',
					url : '/member/' + mid,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					success : function(data){
						var jsonData = null;
						
						if(data !== "") {
							jsonData = JSON.parse(data);
						}
						if(jsonData !== null) {
							//중복o
							alert("중복된 아이디입니다.");
						} else {
							//중복x
							alert("사용가능한 아이디입니다.");
							$("#idChkYN").val("Y");
						}
					},
					error : function(result) {
						console.log("에러발생");
					}
				});//ajax
			});//idchk
			
        });//ready
    </script>

<!--카카오 주소 API-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
		//$(document).ready(function() {
			
	        function getPostcode() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                	
	                    var addr = '';
	                    var extraAddr = '';
	                    
	                    if (data.userSelectedType === 'R') {
	                        addr = data.roadAddress;
	                    } else {
	                        addr = data.jibunAddress;
	                    }
	                    
	                    if(data.userSelectedType === 'R'){
	                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                            extraAddr += data.bname;
	                        }
	                        if(data.buildingName !== '' && data.apartment === 'Y'){
	                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                        }
	                        if(extraAddr !== ''){
	                            extraAddr = ' (' + extraAddr + ')';
	                        }
	                        document.getElementById("addr2").value = extraAddr;
	                    } else {
	                        document.getElementById("addr2").value = '';
	                    }
	                    
	                    document.getElementById('postcode').value = data.zonecode;
	                    document.getElementById("addr1").value = addr;
	                    document.getElementById("addr2").focus();
	                }
	            }).open();
	        }//getPostcode
	//});//ready
    </script><!--카카오 주소 API end-->
</body>
</html>