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
            <h1 class="col-md-6 align-self-center"><strong>리뷰 작성페이지</strong></h1>
        </div><!-- div row end -->
            
        <div class="row my-3">
            <div class="col-md-4">
                <select class="form-control" id="productlist">
                	
                </select>
            </div>
        </div><!-- div row end -->

        <form action="/community/reviewWrite" method="post">
	        <div class="row">
	            <div class="col-md-6">
	                <h4>제목</h4>
	                <input class="form-control" type="text" id="rtitle" name="rtitle" maxlength="20">
	            </div>
	        </div><!-- div row end -->
	    
	        <hr>
	        <textarea class="form-control" id="rcontent" name="rcontent" rows="10"></textarea>
	        <input type="hidden" id="mno" name="mno" value="${login.mno}">
	        <input type="hidden" id="pno" name="pno">
        </form>
		        
        <hr>
        <div class="row">
            <div class="col-md-6 uploadDiv">
                <input type="file" class="form-control-file" name="uploadFile" multiple>
		        <button id="uploadBtn">이미지업로드</button>
            </div>
            <div class="col-md-6 text-right">
                <button type="button" class="btn btn-success" id="writeBtn"><h4 id="h4Btn">리뷰 작성</h4></button>
            </div>
        </div><!-- div row end -->
       
	    <div class="uploadResult">
			<ul id="imgLi">
				<!-- 업로드된 파일이 들어갈 자리 -->
			</ul>
		</div>
    </div><!-- div container end -->
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		
			function getProductList() {//상품목록 불러오기
				$.getJSON("/product/all", function(data) {
					var str = "";
					
					$(data).each(function(){
						
						str += "<option value='"
							+ this.pno + "' >"
							+ this.pname + "</option>";
					});
					$("#productlist").html(str);
				});//getJSON
			}//getProductList
			getProductList();
			
			var regex = new RegExp("(.*?)\.(jpg|png)$");
			var maxSize = 5242880;
			
			function check(fileName, fileSize) {//이미지파일인지 확인
				if(fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(!regex.test(fileName)) {
					alert(".jpg 또는 .png파일만 업로드 가능합니다.");
					return false;
				}
				return true;
			}//check
			
			$('#uploadBtn').on("click", function(e){
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
    			var files = inputFile[0].files;
				
				
    			for(var i = 0; i < files.length; i++) {
					if(!check(files[i].name, files[i].size)) {
						return false;
					}//if
					
					formData.append("uploadFile", files[i]);
				}//for
    			
    			$.ajax({
					url : '/review/imgUpload',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						uploadedFile(result);
					},//success
					error : function() {
						console.log("에러발생!!");
					}//error
				});//ajax
			});//uploadBtn
			
			var uploadresult = $(".uploadResult ul");
			
			function uploadedFile(uploadResultArr) {//업로드한 파일 불러오기
				var str = "";
				
				$(uploadResultArr).each(function(i, obj) {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					
					str += "<li data-path='" + obj.uploadPath
						+ "' data-uuid='" + obj.uuid
						+ "' data-filename='" + obj.fileName + "'></li>";
				});//each
				uploadresult.append(str);
			}//uploadedFile
			
    		$("#writeBtn").on("click", function() {//작성버튼 클릭
    			$("#pno").val($("select option:selected").val());
    			
    			var formObj = $("form");
    			var str = "";
    			
    			$(".uploadResult ul li").each(function(i, obj) {
					var jobj = $(obj);
					
					str += "<input type='hidden' name='imageList[" + i + "].fileName'"
						+ "value='" + jobj.data("filename") + "'>"
						+ "<input type='hidden' name='imageList[" + i + "].uuid'"
						+ "value='" + jobj.data("uuid") + "'>"
						+ "<input type='hidden' name='imageList[" + i + "].uploadPath'"
						+ "value='" + jobj.data("path") + "'>";
				});//each
    			
				formObj.append(str);
    			
    			formObj.submit();
			});//writeBtn
			
		});//ready
    </script>
</body>
</html>