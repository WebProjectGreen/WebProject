<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>fixzone</title>
</head>
<body>

<div id="fixzone">
	<div style="width:100%; height:40%; padding:10px; margin-top:-10px; margin-bottom:10px;">
		<img src="images/catdog_logo.svg" width="100%" height="110%"/>
	</div>
	
	<div >
		<sec:authorize access="isAnonymous()">
			<p style="margin-bottom:-50px; margin-top:30px;">로그인이 필요합니다.</p>
		</sec:authorize>
	</div>
	
	<div style="width:100%; height:10%; margin-bottom:-20px; margin-top:30px;">	
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.username" var="username"/>
			<span style="font-size:23px;">${username}</span>
		</sec:authorize>
	</div>
	<div style="width:100%; height:10%;">
	
	</div>
	<div class="d-flex flex-column" style="width:100%; height:40%;">
	
		<div class="mb-auto" style="width:100%; height:30%;">
		
			<sec:authorize access="isAnonymous()">
			<button onclick="location.href='login_view'">로그인</button>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_USER')">
			<button onclick="location.href='mypage'">마이페이지</button>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button onclick="location.href='adminpage'">관리페이지</button>
			</sec:authorize>
			
		</div>
		<div class="m-auto" style="width:100%; height:30%;">
			<sec:authorize access="isAnonymous()">
			<button onclick="location.href='forget'">ID/PW찾기</button>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER')">
			<button onclick="location.href='mypage_cart'">장바구니</button>
			</sec:authorize>
		</div>
		<div class="mt-auto" style="width:100%; height:30%;">
			<sec:authorize access="isAnonymous()">
			<button onclick="location.href='signup'">회원가입</button>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<form id="logoutForm" action="logout" method="POST">
					<sec:csrfInput/>
					<button type="submit">로그아웃</button>
				</form>
			</sec:authorize>
		</div>
	</div>
</div>

</body>

<script>
var resizeTimer;
var Xset;
var Yset;

//우측 배너 반응형
$(document).ready(function(){
	Xset = $(window).width();
	Yset = $(window).height();
	$("#fixzone").css("left", Xset - 240 + "px");
	$("#fixzone").css("top", Yset/3 + "px");
	$("#fixzone").css("visibility", "visible");
});

$(window).bind('resize', function() {
	Xset = $(window).width();
	Yset = $(window).height();
    window.clearTimeout(resizeTimer);
    resizeTimer = window.setTimeout(resizeFunction, 100);
});
function resizeFunction(){
	$("#fixzone").css("left", Xset - 240 + "px");
	$("#fixzone").css("top", Yset/3 + "px");
}

</script>

</html>