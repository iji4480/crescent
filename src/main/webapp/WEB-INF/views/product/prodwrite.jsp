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
                <li class="nav-item"><a class="nav-link" href="/community">커뮤니티</a></li>
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
        <div class="jumbotron my-5">
            <form action="">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <h3 class="text-left">상품명</h3>
                        <input class="form-control" name="pname" id="pname" type="text">
                        <hr>    
                    </div>
                </div>
                <input type="hidden" value="100" id="pcnt" name="">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <h3 class="text-left">판매가</h3>
                        <input class="form-control" name="price" id="price" type="text" placeholder="숫자만 입력해주세요.">
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <h3 class="text-left">상품이미지</h3>
                        <div class="uploadDiv">
							상품 이미지:<input type="file" name="pimg" id="pimg" class="uploadInput">
						</div>
						<button id="uploadBtn" type="button">Upload</button>
						<input type="hidden" id="pimgpath" name="pimgpath">
                        <!--<input class="form-control-file" name="pimg" id="pimg" type="file">  -->
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <h3 class="text-left">상품상세이미지</h3>
                        <!--<input class="form-control-file" name="pdimg" id="pdimg" type="file">  -->
                        <div class="uploadDiv2">
							상품 상세이미지:<input type="file" name="pdimg" id="pdimg" class="uploadInput">
							<button id="uploadBtn2" type="button">Upload2</button>
							<input type="hidden" id="pdimgpath" name="pdimgpath">
						</div>
                        <hr>
                    </div>
                </div>
                <div class="row text-right">
                    <div class="col-md-4 offset-md-4">
                        <!-- <button class="btn btn-success" type="submit"><h4 id="h4Btn">등록하기</h4></button> -->
                       <button type="button" class="btn btn-success" id="productAddbtn"><h4>등록하기</h4></button>
                    </div>
                </div>
				
            </form>
        </div>
    </div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>

    <script type="text/javascript">
	    $(document).ready(function() {
			
		    $("#productAddbtn").on("click", function() {
		    	var pname = $("#pname").val();
				var price = $("#price").val();
				var pcnt= $("#pcnt").val();
				//var pimg = $("#pimg").val();
				var pimg = $("#pimgpath").val();
				var pdimg = $("#pdimgpath").val();
				
				$.ajax({
					type : 'post',
					url : '/product/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
				    dataType : 'text',
				    data : JSON.stringify({
				    	pname: pname,
				    	price: price,
				    	pcnt: pcnt,
				    	pimg: pimg,
				    	pdimg: pdimg		    	
				    }),
				    success : function(result) {
				    	if(result === 'SUCCESS'){
				    		alert("등록 되었습니다.");
				    		window.location.href = "/product/list";
				    	}
				    }
				});//ajax
			});//productAddBtn end
		    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; // 5MB
			
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("파일사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}//checkExtension
			
			var cloneObj = $(".uploadDiv").clone();
			
			$('#uploadBtn').on("click", function(e){
				
				var formData = new FormData();
				
				var inputFile = $("input[name='pimg']");
				
				console.log(inputFile);
				
				var files = inputFile[0].files;
				
				console.log(files);
				
				// 파일 데이터를 폼에 집어넣기
				for(var i = 0; i < files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					
					formData.append("pimg", files[i]);
				}
				console.log(formData);
				
				$.ajax({
					url: '/product/uploadAjaxAction',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					dataType: 'text',
					success: function(result){
						console.log("result" + result);
						alert("product img upload success")
						//showUploadedFile(result);
						 $('#pimgpath').val(result);
						 console.log( "log" +$('#pimgpath').val());
						//$(".uploadDiv2").html(cloneObj.html());
						
					}
				});//ajax
			});//onclick uploadBtn			
			$('#uploadBtn2').on("click", function(e){
				
				var formData = new FormData();
				
				var inputFile = $("input[name='pdimg']");
				
				console.log(inputFile);
				
				var files = inputFile[0].files;
				
				console.log(files);
				
				// 파일 데이터를 폼에 집어넣기
				for(var i = 0; i < files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					
					formData.append("pdimg", files[i]);
				}
				console.log(formData);
				
				$.ajax({
					url: '/product/uploadAjaxAction2',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					dataType: 'text',
					success: function(result){
						alert("product dimg upload success")
						console.log("result" + result);
						 $('#pdimgpath').val(result);
					}
				});//ajax
			});//onclick uploadBtn2		
		});//ready
    </script>
</body>
</html> 