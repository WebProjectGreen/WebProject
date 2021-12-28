<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<title>주문내역</title>

<link href="<c:url value='/resources/style/main.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/fixzone.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_header.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_footer.css'/>" rel='stylesheet' type='text/css'>

</head>
<body>

<div class="modal" id="completeModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-body">
				구매확정을 하시겠습니까?<br/>
				상품을 수령한 후 확정버튼을 눌러주세요.
			</div>
			
			<div class="modal-footer">
				<div class="d-flex justify-content-between" style="width:100%;">
					<div>
						<button class="btn btn-info" onclick="order_complete()" data-dismiss="modal">구매확정</button>
					</div>
					<div>
						<button class="btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 우측 배너 -->
<%@ include file="../fixzone.jsp" %>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="../header.jsp" %>
	
	<div style="margin:40px 0 120px;">
		<p style="text-align:center; font-size:1.5em;">주문내역</p>
		<hr style="margin:10px 0;"/>
		<div class="d-flex justify-content-between" style="margin:0 0 10px; width:530px;">
			<div><button class="btn btn-outline-secondary" onclick="serach('all')">전체 (${count_all})</button></div>
			<div><button class="btn btn-outline-secondary" onclick="serach('발송대기')">발송대기 (${count_1})</button></div>
			<div><button class="btn btn-outline-secondary" onclick="serach('배송중')">배송중 (${count_2})</button></div>
			<div><button class="btn btn-outline-secondary" onclick="serach('배송완료')">배송완료 (${count_3})</button></div>
			<div><button class="btn btn-outline-secondary" onclick="serach('구매확정')">구매확정 (${count_4})</button></div>
		</div>
		
		<!-- 주문정보 -->
		<form id="orderinfo" action="orderlist_info" method="GET" style="display:none;">
			<input type="text" id="orderinfo_code" name="order_num" />
		</form>
		<!-- 구매확정 -->
		<form id="order_complete" action="order_complete" method="GET" style="display:none;">
			<input type="text" id="order_complete_code" name="order_num" />
		</form>
		
		<div id="main">
		</div>
	</div>
	
</div>

<!-- FOOTER -->
<%@ include file="../footer.jsp" %>

</body>

<script>
$(document).ready(function(){
	//상품관리 진입시 디폴트 검색
	$.ajax({
		url: "order_list?state=all",
		type: "GET",
		success: function(data) {
			$("#main").html(data);
		}
	});
});

//구매확정
function complete_code(value) {
	$("#order_complete_code").val(value);
}
function order_complete() {
	$("#order_complete").submit();
}
//배송상태 검색
function serach(value) {
	$.ajax({
		url: "order_list?state=" + value,
		type: "GET",
		success: function(data) {
			$("#main").html(data);
		}
	});
}

function addComma(value) {
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value;
}

//주문정보
function order_info(value) {
	$("#orderinfo_code").val(value);
	$("#orderinfo").submit();
}
</script>

</html>