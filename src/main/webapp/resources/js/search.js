/**
 * 검색 기능 스크립트 파일
 */
$('#searchBtn').on("click", function() {
	pname = $("#search").val();
	
	location.href = "/product/list?pname=" + pname;
});

$('#logout').on("click", function(e) {
	e.preventDefault();
	
	alert("로그아웃되었습니다.");
	
	location.href = "/member/logout";
});