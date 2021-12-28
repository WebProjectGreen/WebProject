<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!--RWD first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>관리자 페이지</title>

<link href="<c:url value='/resources/style/main.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/adminpage.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/style/prp.css'/>" rel="stylesheet" type="text/css">

</head>
<body class="bg-secondary" style="width:1920px;">

<div id="header" class="d-flex flex-column">
	<div style="width:100%; height:200px; padding:20px;">
		<img src="<c:url value='/resources/images/catdog_logo.svg'/>" alt="로고" width="100%" height="100%" style="filter:brightness(0) invert(1);"/>
	</div>
	<div style="width:100%;">
		<a class="button" id="prp" href="adminpage/prp">
			<span style="font-size:1.2em;">상품등록</span>
		</a>
		<a class="button" id="button" href="adminpage/pm">
			<span style="font-size:1.2em;">상품관리</span>
		</a>
		<a class="button" id="button" href="adminpage/order">
			<span style="font-size:1.2em;">주문관리</span>
		</a>
	</div>
	<div class="mt-auto d-flex flex-column justify-content-end" style="width:100%;">
		<a class="button" id="button" href="home">
			<span style="font-size:1.2em;">홈화면으로</span>
		</a>
		<form id="logoutForm" action="logout" method="POST">
			<sec:csrfInput/>
			<button class="button_logout" type="submit">
				<span style="font-size:1.2em;">로그아웃</span>
			</button>
		</form>
		<div style="height:17px;"></div>
	</div>
</div>

<div class="d-flex">
	<div id="innerbox" style="width:300px;"></div>
	
	<div style="width:100%; padding:50px 0 0;">
		<div id="wrap">
		
			<div id="main">
				<div style="padding:230px 0 0;">
					<span style="font-size:5.0em">환영합니다.</span><br/>
					&nbsp;&nbsp;<span style="font-size:1.5em">관리자 페이지 입니다.</span>
				</div>
			</div>
			
		</div>
	</div>
</div>

</body>

<script>
$(document).ready(function(){
	//좌측 메뉴바 반응형
	var hei = window.innerHeight;
	$("#header").css("height", hei);
	
	$(window).resize(function(){
		var hei = window.innerHeight;
		$("#header").css("height", hei);
	});
});
</script>

</html>