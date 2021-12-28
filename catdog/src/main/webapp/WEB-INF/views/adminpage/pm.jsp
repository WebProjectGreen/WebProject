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
<title>상품관리</title>

<sec:csrfMetaTags />

<style>
td {
	height:125px;
}

ul {
	list-style:none;
	margin:0;
	padding:0;
}
li {
	margin:0;
	padding:0;
	border:0;
	float:left
}
#pagebutton button {
	color:black;
	background-color:transparent;
	border:0;
	outline:0;
	font-size:1.2em;
}
#pagebutton button:hover {
	color:gray;
}
</style>

<link href="<c:url value='/resources/style/main.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/adminpage.css'/>" rel="stylesheet" type="text/css">

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

<div class="modal" id="deleteModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-body">
				정말 삭제하시겠습니까?<br/>
				상품의 데이터는 다시 복구가 불가능합니다.
			</div>
			
			<div class="modal-footer">
				<div class="d-flex justify-content-between" style="width:100%;">
					<div>
						<button class="btn btn-danger" onclick="product_delete()" data-dismiss="modal">삭제</button>
					</div>
					<div>
						<button class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="d-flex">
	<div id="innerbox" style="width:300px;"></div>
	
	<div style="width:100%; padding:50px 0 0;">
		<div id="wrap">
		
			<div id="main">
				<div class="bg-white" style="padding:40px;">
					<h2 id="prp_h2" style="text-align:center;">상품관리</h2>
					<hr style="margin:20px 0;"/>
					<form id="product_search">
						<sec:csrfInput/>
						<input type="text" name="page" id="pageValue" style="display:none;"/>
						<div class="d-flex flex-column" style="height:120px;">
							<div class="d-flex pt-2" style="height:35px;">
								<div style="width:15%;">
									<span>상품명</span>
								</div>
								<div style="width:85%;">
									<input type="text" name="sName" style="height:100%;"/>
								</div>
							</div>
							<div class="d-flex pt-2" style="height:35px;">
								<div style="width:15%;">
									<span>상품분류</span>
								</div>
								<div style="width:85%;">
									<label><input type="radio" name="category" value="all" checked/> 전체</label>&nbsp;
									<label><input type="radio" name="category" value="fashion"/> 의류/하네스</label>&nbsp;
									<label><input type="radio" name="category" value="walk"/> 이동/산책</label>&nbsp;
									<label><input type="radio" name="category" value="food"/> 사료/간식</label>&nbsp;
									<label><input type="radio" name="category" value="cat"/> 고양이</label>&nbsp;
									<label><input type="radio" name="category" value="dog"/> 강아지</label>
								</div>
							</div>
							<div class="d-flex pt-2" style="height:35px;">
								<div style="width:15%;">
									<span>상품정렬</span>
								</div>
								<div style="width:70%;">
									<label><input type="radio" name="sort1" value="P_CODE" checked/> 신상품순</label>&nbsp;
									<label><input type="radio" name="sort1" value="P_NAME"/> 이름순</label>&nbsp;
									<label><input type="radio" name="sort1" value="P_A_PRICE"/> 가격순</label>&nbsp;
									<label><input type="radio" name="sort1" value="P_STOCK"/> 재고량순</label>&nbsp;
									<label><input type="radio" name="sort1" value="P_BUY"/> 판매량순</label>
								</div>
								<div style="width:15%; text-align:right;">
									<label><input type="radio" name="sort2" value="ASC"/> 낮은순</label>&nbsp;
									<label><input type="radio" name="sort2" value="DESC" checked/> 높은순</label>
								</div>
							</div>
						</div>
						<input type="submit" value="검색" class="btn btn-secondary" style="display:block; width:100px; border-radius:20px; margin:0 auto;"/>
					</form>
					
					<hr style="margin:20px 0;"/>
					
					<div id="product_list">
					</div>
					
					<div style="height:50px;"></div>
					
					<input type="text" id="parent" style="display:none;"/>
				</div>
			</div>
			
		</div>
	</div>
</div>

</body>

<script>
$(document).ready(function(){
	
	//상품관리 진입시 디폴트 검색
	$.ajax({
		url: "defaultlist",
		type: "GET",
		success: function(data) {
			$("#product_list").html(data);
		}
	});
	
	//좌측 메뉴바 반응형
	var hei = window.innerHeight;
	$("#header").css("height", hei);
	
	$(window).resize(function(){
		var hei = window.innerHeight;
		$("#header").css("height", hei);
	});
	
	//검색
	$("#product_search").submit(function(e){
		e.preventDefault();
		$.ajax({
			url: "pm/list",
			type: "POST",
			data: $("#product_search").serialize(),
			success: function(data) {
				$("#product_list").html(data);
			}
		});
	});
});

//상품수정
function p_update(e) {
	console.log(e);
	$("#parent").val(e);
	window.open("p_update", "상품수정", "width = 600, height = 700, top = 150, left = 650");	
}

//상품삭제
function product_delete() {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	var p_codeArray = [];
	var p_mainimgArray = [];
	var p_subimgArray = [];
	
	$("#checkbox:checked").each(function(i){
		var p_code = this.value;
		p_codeArray.push(p_code);
		p_mainimgArray.push($("#mainimg_" + p_code).val());
		p_subimgArray.push($("#subimg_" + p_code).val());
	});
	
	$.ajax({
		url: "p_delete",
		type: "POST",
		dataType: "json",
		data: {
			"code" : p_codeArray,
			"mainimg" : p_mainimgArray,
			"subimg" : p_subimgArray
		},
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		success: function(data) {
			$("#product_search").submit();
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert("에러" + textStatus + " : " + errorThrown);
		}
	});
	
}

//체크박스 전체 선택
function selectAll(selectAll) {
	const checkboxes = document.getElementsByName("checkbox");
	
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	});
}

//페이지 이동
function pageview(value) {
	$("#pageValue").val(value);
	$.ajax({
		url: "pm/list_page",
		type: "POST",
		data: $("#product_search").serialize(),
		success: function(data) {
			$("#product_list").html(data);
		}
	});
}
</script>
</html>