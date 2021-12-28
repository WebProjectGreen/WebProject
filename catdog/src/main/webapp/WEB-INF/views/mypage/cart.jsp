<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<!DOCTYPE html>
<html lang="ko" id="html">
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
<title>장바구니</title>

<link href="<c:url value='/resources/style/main.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/fixzone.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_header.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_footer.css'/>" rel='stylesheet' type='text/css'>

<sec:csrfMetaTags/>

</head>
<body>
<!-- 우측 배너 -->
<%@ include file="../fixzone.jsp" %>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="../header.jsp" %>
	
	<div style="margin:40px 0 120px;">
		<div id="top">
			<div style="text-align:center;">
				<p style="font-size:40px; color:#535378;">장바구니</p>
			</div>
			<hr style="margin:10px 0;"/>
		</div>
		
		<div id="main">
		</div>
		
		<div class="d-flex justify-content-center">
			<div>
				<button class="btn btn-info" id="paybutton" style="width:200px; height:70px; font-size:1.5em;" onclick="cartpay()">구매하기</button>
			</div>
		</div>
	</div>
	
</div>

<!-- FOOTER -->
<%@ include file="../footer.jsp" %>

</body>

<script>
var price = 0;
var delivery = 0;

$(document).ready(function(){
	//상품관리 진입시 디폴트 검색
	$.ajax({
		url: "cart_list",
		success: function(data) {
			$("#main").html(data);
		}
	});
});

function addComma(value) {
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value;
}

//체크박스 전체 선택
function selectAll(selectAll) {
	const checkboxes = document.getElementsByName("checkbox");
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	});
	itemselect();
}

//장바구니 아이템 선택
function itemselect() {
	var chk_arr = [];
	var price_arr = [];
	var del_arr = [];
	var total_price = 0;
	var total_del = 0;
	var full = 0;
	
	$("input[name=checkbox]:checked").each(function(){
		var chk = $(this).val();
		var price = $("#input_price_" + chk).val();
		var del = $("#input_del_" + chk).val();
		chk_arr.push(chk);
		price_arr.push(price);
		del_arr.push(del);
	});
	
	price_arr.forEach(function(x){
		total_price += Number(x);
	});
	del_arr.forEach(function(x){
		if(total_del < Number(x))
			total_del = Number(x);
	});
	if(total_price >= 50000)
		total_del = 0;
	
	full = total_price + total_del;
	total_price = addComma(String(total_price));
	total_del = addComma(String(total_del));
	full = addComma(String(full));
	
	$("#price").text(total_price);
	$("#delivery").text(total_del);
	$("#total").text(full);
	
}

//장바구니 삭제
function delete_cart() {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	var chk_arr = [];
	$("input[name=checkbox]:checked").each(function(){
		var chk = $(this).val();
		chk_arr.push(chk);
	});
	
	$.ajax({
		url: "cart_delete",
		type: "POST",
		dataType: "json",
		data: { "code" : chk_arr },
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		success: function(data) {
			location.reload();
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert("에러" + textStatus + " : " + errorThrown);
		}
	});
}

var isEmpty = function(val){
	if(val === '' || val === null || val === undefined 
    	|| (val !== null && typeof(val) === 'object' && !Object.keys(val).length)){
       	return true;
    } else {
    	return false;
    }
};
 
//구매하기
function cartpay() {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	var chk_arr = [];
	$("input[name=checkbox]:checked").each(function(){
		var chk = $(this).val();
		chk_arr.push(chk);
	});
	
	if(!(isEmpty(chk_arr))) {
		$.ajax({
			url: "cartpay",
			type: "POST",
			data: { "code" : chk_arr },
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success: function(data) {
				$("#top").css("display", "none");
				$("#paybutton").css("display", "none");
				$("#main").html(data);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("에러" + textStatus + " : " + errorThrown);
			}
		});
	} else {
		alert("선택된 상품이 없습니다.");
	}
		
}

</script>
</html>