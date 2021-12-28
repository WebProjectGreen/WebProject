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
<title>상품등록</title>

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
				<div class="bg-white" style="padding:40px; text-align:center;">
					<h2 id="prp_h2">상품등록처리</h2>
					<hr style="margin:20px 0;"/>
					<form action="prp/submit?${_csrf.parameterName}=${_csrf.token}" method="POST" id="prp_form" enctype="multipart/form-data">
						<div class="d-flex justify-content-between" id="formbox1">
							<div id="formbox2">
								<label for="p_category">상품 카테고리</label>
							</div>
							<div id="formbox3">
								<select class="form-control" name="p_category" id="p_category">
									<option value="" selected>선택</option>
						        	<option value="fashion">의류/하네스</option>
						        	<option value="walk">이동/산책</option>
						        	<option value="food">사료/간식</option>
						       		<option value="cat">고양이</option>
						       		<option value="dog">강아지</option>
								</select>
							</div>
						</div>
						<div class="d-flex justify-content-between" id="formbox1">
							<div id="formbox2">
								<label for="p_name">상품 이름</label>
							</div>
							<div id="formbox3">
								<input type="text" name="p_name" id="p_name" class="form-control" style="width:300px;"/>
							</div>
						</div>
						<div class="d-flex justify-content-between" id="formbox1">
							<div id="formbox2">
								<label for="p_price">상품 가격</label>
							</div>
							<div id="formbox3">
								<input type="text" name="p_price" id="p_price" class="form-control"/>&nbsp;원
							</div>
						</div>
						<div class="d-flex justify-content-between" id="formbox1">
							<div id="formbox2">
								<label for="p_delivery">상품 배송비</label>
							</div>
							<div id="formbox3">
								<input type="text" name="p_delivery" id="p_delivery" class="form-control"/>&nbsp;원
							</div>
						</div>
						<div class="d-flex justify-content-between" id="formbox1">
							<div id="formbox2">
								<label for="p_sale">상품 할인율</label>
							</div>
							<div id="formbox3">
								<input type="text" name="p_sale" id="p_sale" class="form-control" value="0"/>&nbsp;%
							</div>
						</div>
						<div class="d-flex justify-content-between" id="formbox1">
							<div id="formbox2">
								<label for="p_stock">상품 재고수</label>
							</div>
							<div id="formbox3">
								<input type="text" name="p_stock" id="p_stock" class="form-control"/>&nbsp;개
							</div>
						</div>
						<div class="d-flex justify-content-between" id="formbox1">
							<div id="formbox2">
								<label for="p_content">상품 설명</label>
							</div>
							<div id="formbox3">
								<textarea rows="5" cols="35" name="p_content" id="p_content"></textarea>
							</div>
						</div>
						<div class="d-flex justify-content-between" id="formbox1">
							<div id="formbox2">
								<label for="p_mainimg">썸네일 사진</label>
							</div>
							<div id="formbox3">
								<input type="file" name="p_mainimg" id="p_mainimg" style="width:300px;"/>
							</div>
						</div>
						<div class="d-flex justify-content-between" id="formbox1">
							<div id="formbox2">
								<label for="p_subimg">상세설명 사진</label>
							</div>
							<div id="formbox3">
								<input type="file" name="p_subimg" id="p_subimg" style="width:300px;"/>
							</div>
						</div>
						<div style="width:100px; margin:40px auto 0;">
							<input type="submit" class="btn btn-outline-secondary" value="등록" style="width:100px; border-radius:20px;"/>
						</div>
					</form>
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