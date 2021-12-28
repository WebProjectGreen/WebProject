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
<title>주문관리</title>

<link href="<c:url value='/resources/style/main.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/adminpage.css'/>" rel="stylesheet" type="text/css">

<sec:csrfMetaTags/>

<script>
function addComma(value) {
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value;
}
</script>

<style>
#infobutton {
	border:none;
	outline:none;
	color:#3A8FDA;
	background-color:transparent;
}
#infobutton:hover {
	border:none;
	outline:none;
	color:lightblue;
	background-color:transparent;
}
</style>

</head>
<body class="bg-secondary" style="width:1920px;">

<div id="header" class="d-flex flex-column">
	<div style="width:100%; height:200px; padding:20px;">
		<img src="<c:url value='/resources/images/catdog_logo.svg'/>" alt="로고" width="100%" height="100%" style="filter:brightness(0) invert(1);"/>
	</div>
	<div style="width:100%;">
		<a class="button" id="prp" href="../adminpage/prp">
			<span style="font-size:1.2em;">상품등록</span>
		</a>
		<a class="button" id="button" href="../adminpage/pm">
			<span style="font-size:1.2em;">상품관리</span>
		</a>
		<a class="button" id="button" href="../adminpage/order">
			<span style="font-size:1.2em;">주문관리</span>
		</a>
	</div>
	<div class="mt-auto d-flex flex-column justify-content-end" style="width:100%;">
		<a class="button" id="button" href="../home">
			<span style="font-size:1.2em;">홈화면으로</span>
		</a>
		<form id="logoutForm" action="../logout" method="POST">
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
				<div class="bg-white" style="padding:40px;">
					<h2 id="prp_h2" style="text-align:center;">주문관리</h2>
					<hr style="margin:20px 0;"/>
					<form id="order_search">
						<input type="text" name="page" id="pageValue" style="display:none;"/>
						<div class="d-flex flex-column" style="height:120px;">
							<div class="d-flex pt-2" style="height:35px;">
								<div style="width:15%;">
									<span>회원ID 검색</span>
								</div>
								<div style="width:85%;">
									<input type="text" name="user_id" style="height:100%;"/>
								</div>
							</div>
							<div class="d-flex pt-2" style="height:35px;">
								<div style="width:15%;">
									<span>주문상태 구분</span>
								</div>
								<div style="width:85%;">
									<label><input type="radio" name="state" value="all" checked/> 전체</label>&nbsp;
									<label><input type="radio" name="state" value="주문대기"/> 주문대기</label>&nbsp;
									<label><input type="radio" name="state" value="발송대기"/> 발송대기</label>&nbsp;
									<label><input type="radio" name="state" value="배송중"/> 배송중</label>&nbsp;
									<label><input type="radio" name="state" value="배송완료"/> 배송완료</label>&nbsp;
									<label><input type="radio" name="state" value="구매확정"/> 구매확정</label>
								</div>
							</div>
							<div class="d-flex pt-2" style="height:35px;">
								<div style="width:15%;">
									<span>주문정렬</span>
								</div>
								<div style="width:70%;">
									<label><input type="radio" name="sort" value="ORDER_NUM" checked/> 날짜순</label>&nbsp;
									<label><input type="radio" name="sort" value="ORDER_TOTAL"/> 결제금액순</label>
								</div>
								<div style="width:15%; text-align:right;">
									<label><input type="radio" name="orderby" value="ASC"/> 낮은순</label>&nbsp;
									<label><input type="radio" name="orderby" value="DESC" checked/> 높은순</label>
								</div>
							</div>
						</div>
						<input type="submit" value="검색" class="btn btn-secondary" style="display:block; width:100px; border-radius:20px; margin:0 auto;"/>
					</form>
					
					<hr style="margin:20px 0;"/>
					
					<div id="order_list">
					</div>
					
					<div style="height:50px;"></div>
					
					<!-- 주문정보 -->
					<form id="orderinfo" action="../orderlist_info" method="GET" style="display:none;">
						<input type="text" id="orderinfo_code" name="order_num" />
					</form>
					
				</div>
			</div>
			
		</div>
	</div>
</div>

</body>
<script>
$(document).ready(function(){
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	//좌측 메뉴바 반응형
	var hei = window.innerHeight;
	$("#header").css("height", hei);
	
	$(window).resize(function(){
		var hei = window.innerHeight;
		$("#header").css("height", hei);
	});
	
	//상품관리 진입시 디폴트 검색
	$.ajax({
		url: "order_search",
		type: "POST",
		data: $("#order_search").serialize(),
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		success: function(data) {
			$("#order_list").html(data);
		}
	});
	
	//검색
	$("#order_search").submit(function(e){
		e.preventDefault();
		$.ajax({
			url: "order_search",
			type: "POST",
			data: $("#order_search").serialize(),
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success: function(data) {
				$("#order_list").html(data);
			}
		});
	});
	
});

//배송상태 수정
function state_update(value) {
	var order_num = value;
	var state = $("#order_state_" + order_num).val();
	$.ajax({
		url: "state_update?order_num=" + order_num + "&state=" + state,
		type: "GET",
		success: function(data) {
			$("#order_search").submit();
		}
	});
}

function order_info(value) {
	$("#orderinfo_code").val(value);
	$("#orderinfo").submit();
}
</script>
</html>