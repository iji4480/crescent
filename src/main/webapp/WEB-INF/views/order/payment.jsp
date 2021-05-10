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
        <div class="row">
            <div class="col-md-12 text-center my-3">
                <h1><strong>결제</strong></h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th><h4><strong>상품</strong></h4></th>
                            <th><h4><strong>상품명</strong></h4></th>
                            <th><h4><strong>수량</strong></h4></th>
                            <th><h4><strong>소계</strong></h4></th>
                        </tr>
                    </thead>
                    <tbody id="list">
                        
                    </tbody>
                </table>
            </div>
        </div><!-- div row end -->
        
        <hr>
        
        <div class="row">
            <div class="col-md-12 text-right" id="total">
            	
            </div>
        </div><!-- div row end -->

        <div class="jumbotron mt-3" id="payJumbo">
        	<form class="form" action="/order/paying" method="post">
	            <div class="row">
	                <div class="col-md-4 offset-md-1">
	                    <div class="row mb-3">
	                        <button class="btn btn-info" disabled><h5 id="h5Btn">받는 곳</h5></button>
	                    </div>
	                    <div class="row mb-1">
	                        <input class="form-control col-md-4" type="text" name="postcode" id="postcode" placeholder="POSTCODE" readonly="readonly">
	                        <div class="ml-2">
	                            <button class="btn btn-warning" id="searchPost" type="button">우편번호검색</button>
	                        </div>
	                    </div><!--우편번호-->
	                    <div class="row mb-1">
	                        <input class="form-control" type="text" name="addr1" id="addr1" placeholder="ADDR" readonly="readonly">
	                    </div><!--주소-->
	                    <div class="row mb-3">
	                        <input class="form-control" type="text" name="addr2" id="addr2" placeholder="ADDR DETAIL">
	                    </div><!--상세주소-->
	                </div><!-- 받는곳 -->
	                
	                <div class="col-md-4 offset-md-2">
	                    <div class="row mb-3">
	                        <button class="btn btn-info" disabled><h5 id="h5Btn">받는 분</h5></button>
	                    </div>
	                    <div class="row mb-1">
	                        <input class="form-control col-md-5" type="text" name="name" id="name" placeholder="NAME">
	                    </div>
	                    
	                    <div class="row my-3">
	                        <button class="btn btn-info" disabled><h5 id="h5Btn">연락처</h5></button>
	                    </div>
	                    <div class="row mb-3">
	                        <input class="form-control col-md-3" type="text" name="tel1" id="tel1" maxlength="3" placeholder="010">
	                        <input class="form-control col-md-3 offset-md-1" type="text" name="tel2" id="tel2" maxlength="4" placeholder="1234">
	                        <input class="form-control col-md-3 offset-md-1" type="text" name="tel3" id="tel3" maxlength="4" placeholder="5678">
	                    </div><!--전화번호-->
					</div><!--받는분-->
                </div><!-- div row end -->
                <div class="row">
                	<div class="col-md-12 text-center">
                		<input type="hidden" name="mno" value="${login.mno}">
						<button type="submit" id="payBtn" class="btn btn-success"><h3 id="h3Btn">결제하기</h3></button>
                	</div>
                </div>
        	</form>
		</div><!-- div jumbotron end -->
            
		<div class="row">
			<div class="col-md-12 text-center">
				<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
					<input type="hidden" name="cmd" value="_xclick" /><!-- 구매요청 -->
					<input type="hidden" name="business" value="alsrbxotest@test.com" /><!-- 상점계정 -->
					<input type="hidden" id="price" name="amount" value="" /><!-- 금액 -->
					<input type="hidden" id="pno" name="item_number" value=""><!-- 상품코드 -->
					<input type="hidden" id="pname" name="item_name" value="" /><!-- 상품이름 -->
					<input type="hidden" name="return" value="http://localhost:8181/order/complite" /><!-- 결제후 이동되는 페이지 -->
					<input type="hidden" name="notify_url" value="http://localhost:8181/order/complite" /><!-- IPN메세지 받을 페이지 -->
					<input type="hidden" name="cancel_return" value="http://localhost:8181/order/complite" /><!-- 결제 취소 페이지 -->
					<input type="hidden" name="charset" value="UTF-8" /><!-- 인코딩 -->
					<input type="hidden" name="currency_type" value="USD" />
					<button type="submit" class="btn btn-info"><h3 id="h3Btn">페이팔 모의결제</h3></button>
					<h5>해당 버튼은 페이팔 모의결제 시스템을 이용해 결제시스템을 체험하는 목적으로 만들었습니다.</h5>
					<h5>페이팔 모의결제를 체험하기 위해서는 페이팔 샌드박스 테스트계정이 필요합니다.</h5>
				</form>
			</div>
		</div>
	</div><!-- div container end -->
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!-- 장바구니에서 선택된 상품 목록 -->
    <input type="hidden" id="length" value="${length}">
    <c:forEach var="i" begin="0" end="${length}">
		<input type=hidden id="cnoArr${i}" value="${cnoArr[i]}">
	</c:forEach>
    <!-- 장바구니에서 선택된 상품 목록 -->
    
    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
	
    <script type="text/javascript">
    	$(document).ready(function() {
    		var length = $("#length").val();
			var arr = new Array();
			
			for(let i = 0; i < length; i++) {
				arr[i] = $("#cnoArr"+i).val();
			}
			
    		function getCartList() {//장바구니에서 선택된 목록 불러오기
				$.getJSON("/order/cartlist/" + arr, function(data) {
					var str = "";
					var formStr = "";
					
					$(data).each(function(i, cart) {
						str += "<tr><td id='cartPayTd'><img src='/product/display?fileName=" + cart.pimg + "' id='cartPayImg'></td>"
							+ "<td id='cartPayTd'><h4><strong>" + cart.pname + "</strong></h4></td>"
							+ "<td id='cartPayTd'><h4><strong>" + cart.cnt + "</strong></h4></td>"
							+ "<td id='cartPayTd'><h4><strong>" + cart.result + "</strong></h4></td></tr>";
						
                        formStr += "<input type='hidden' name='orderDetail[" + i + "].pno' id='pno" + i + "' value='" + cart.pno + "'>"
                        		+ "<input type='hidden' name='orderDetail[" + i + "].ocnt' id='ocnt" + i + "' value='" + cart.cnt + "'>"
                        		+ "<input type='hidden' name='orderDetail[" + i + "].result' id='result" + i + "' value='" + cart.result + "'>"
                        		+ "<input type='hidden' name='cnoArr' value='" + arr[i] + "'?>";
                        
                        $("#pname").val(this.pname);
                        $("#pno").val(this.pno);
                        $("#price").val((this.result/1000));
					});//each
					
					$("#list").html(str);
					$(".form").append(formStr);
				});//getJSON
			}//getCartList
    		getCartList();
			
    		function getTotal() {//총 주문금액 계산
				$.getJSON("/order/total/" + arr, function(data) {
					$("#total").html("<h4>총 주문금액 : " + data.total + "원</h4>");
					$(".form").append("<input type='hidden' name='total' id='data.total' value='" + data.total + "'>");
				});//getJSON
			}//getTotal
			getTotal();
			
			function getMember() {//회원정보에 저장된 이름, 주소, 전화번호 불러오기
				$.getJSON("/member/" + ${login.mno}, function(data) {
// 					console.log(data);
					$("#postcode").val(data.postcode);
					$("#addr1").val(data.addr1);
					$("#addr2").val(data.addr2);
					$("#name").val(data.name);
					$("#tel1").val(data.tel1);
					$("#tel2").val(data.tel2);
					$("#tel3").val(data.tel3);
				});//getJSON
			}//getMember
			getMember();
			
			$("#payBtn").on("click", function(e) {
				e.preventDefault();
				
				var formObj = $(".form");
				
				alert("결제가 완료되었습니다.");
				
				formObj.submit();
			});//payBtn
			
		});//ready
    </script>
    
    <!--카카오 주소 API-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#searchPost").on("click", function() {
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
			});//searchPost
			
		});//ready
    </script><!--카카오 주소 API end-->
</body>
</html>