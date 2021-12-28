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
<!--RWD first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>cats&dogs</title>

<!-- 외부 Source 적용 -->
<link href="style/fixzone.css" rel="stylesheet" type="text/css">
<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">

<sec:csrfMetaTags/>

<style>
#td1 {
	width:20%;
	background-color:#F3F3F3;
	text-align:right;
}
#td2 {
	color:gray;
}
#td3 {
	width:20%;
	height:50px;
	background-color:#F3F3F3;
	text-align:right;
	padding:0 10px 0 0;
}
#td4 {
	padding:0 0 0 10px;
}
</style>

<script>
function addComma(value) {
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value;
}
</script>

</head>
<body onload="calculate()">

<!-- 우측 배너 -->
<%@ include file="../fixzone.jsp" %>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="../header.jsp" %>
	
	<div style="margin:40px auto 120px; width:900px;">
		<p style="text-align:center; font-size:1.5em;">주문정보</p>
		<hr style="margin:10px 0;"/>
		<div style="border:1px solid lightgray; padding:20px 20px 10px;">
			<div class="d-flex align-items-center">
				<span style="font-size:1.5em;">받는사람정보</span>&nbsp;&nbsp;
			</div>
			
			<div style="margin:10px 0;">
				<table style="width:100%;">
					<tbody>
						<tr>
							<td id="td3">
								주문자
							</td>
							<td id="td4">
								<div class="d-flex align-items-center" style="height:100%;">
									<span>${order.user_id}</span>
								</div>
							</td>
						</tr>
						<tr>
							<td id="td3">
								받는이
							</td>
							<td id="td4">
								<div class="d-flex align-items-center" style="height:100%;">
									<span>${order.order_to}</span>
								</div>
							</td>
						</tr>
						<tr>
							<td id="td3">
								주소
							</td>
							<td id="td4">
								<div class="d-flex align-items-center" style="height:100%;">
									<span>${order.order_address}</span>
								</div>
							</td>
						</tr>
						<tr>
							<td id="td3">
								배송메세지
							</td>
							<td id="td4">
								<div class="d-flex align-items-center" style="height:100%;">
									<span>${order.order_message}</span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div style="margin:20px 0;">
			<table class="table" style="text-align:center;">
				<tbody>
					<c:forEach items="${result}" var="dto">
						<tr>
							<td style="width:60%;">
								<div class="d-flex align-items-center" style="height:70px; text-align:left;">
									<div style="background-color:black; height:70px; width:70px;">
										<img id="img_${dto.p_code}" width="100%" height="100%"/>
									</div>
									<div style="margin:0 20px 0;">
										<strong style="font-size:1.2em;" id="name_${dto.p_code}"></strong>
									</div>
									<script>
										$.ajax({
											url: "order_info_img?p_code=" + ${dto.p_code},
											type: "GET",
											success: function(data) {
												$("#img_" + ${dto.p_code}).attr("src", "images/product/" + data);
											}
										});
										$.ajax({
											url: "order_info_name?p_code=" + ${dto.p_code},
											type: "GET",
											success: function(data) {
												$("#name_" + ${dto.p_code}).text(data);
											}
										});
									</script>
								</div>
							</td>
							<td style="width:15%;">
								<div class="d-flex align-items-center" style="height:70px;">
									<div style="width:100%; text-align:right;">
										${dto.order_stock}개
									</div>
								</div>
							</td>
							<td style="width:25%;">
								<div class="d-flex align-items-center" style="height:70px;">
									<div style="width:100%; text-align:right;">
										<span id="iprice_${dto.p_code}"></span>원
										<script>
											//상품가격 콤마
											var price = ${dto.order_price};
											price = addComma(String(price));
											$("#iprice_" + ${dto.p_code}).text(price);
										</script>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div style="border:1px solid lightgray; padding:20px 20px 10px;">
			<div class="d-flex align-items-center">
				<span style="font-size:1.5em;">결제정보</span>
			</div>
			
			<div style="margin:10px 0;">
				<table class="table">
					<tbody>
						<tr>
							<td id="td1">
								총상품가격
							</td>
							<td id="td2">
								<span id="itemtotal"></span>원
							</td>
						</tr>
						<tr>
							<td id="td1">
								배송비
							</td>
							<td id="td2">
								<span id="deltotal"></span>원&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td id="td1">
								총결제금액
							</td>
							<td style="font-size:1.2em; color:black;">
								<span id="fulltotal"></span>원
							</td>
						</tr>
						<tr>
							<td id="td1">
								결제수단
							</td>
							<td>
								<strong>무통장입금</strong>
								<div id="orderby" style="margin:20px 0 0;">
									<span style="font-size:1.3em;">농협은행 123-4567-8912-34</span> 예금주 : 홍길동<br/>
									<span style="color:gray; font-size:0.8em">*정확한 입금을 위해 한번 더 확인해주세요.</span><br/><br/>
									<span style="color:gray;">입금자명</span>&nbsp;<strong>${order.order_bankname}</strong>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div style="margin:20px auto 0; width:100px;">
			<button class="btn btn-secondary" onclick="window.history.back();" style="width:120px; height:50px; font-size:1.2em;">뒤로</button>
		</div>
	</div>
	
</div>

<!-- FOOTER -->
<%@ include file="../footer.jsp" %>

</body>

<script>
var total = ${order.order_total};
var delivery = ${order.order_delivery};

$(document).ready(function(){
	//금액 계산
	var full = total + delivery;
	var str1 = addComma(String(total));
	var str2 = addComma(String(delivery));
	var str3 = addComma(String(full));
	$("#itemtotal").text(str1);
	$("#deltotal").text(str2);
	$("#fulltotal").text(str3);
});
</script>

</html>