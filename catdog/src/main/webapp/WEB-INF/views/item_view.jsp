<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
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
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style/main.css" rel="stylesheet" type="text/css">
<title>MyPage</title>

<link href="style/fixzone.css" rel="stylesheet" type="text/css">
<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">

<sec:csrfMetaTags/>

</head>

<style>
#div {
	font-size:20px;
}
table {
	border-collapse: separate;
  	border-spacing: 0 23px;
}
#a {
	text-decoration:none; 
	background-color:#F9F9F9;
	font-size:20px;
	padding:10px 10px;
	padding-right:30px;
	padding-left:30px;
	color:black;
	border-radius:50px;
	border:2px solid #535378;
}
#a:hover {
	background-color:#EDEDF2;
}
#a1 {
	text-decoration:none; 
	background-color:#535378;
	font-size:20px;
	padding:10px 10px;
	padding-right:30px;
	padding-left:30px;
	color:white;
	border-radius:50px;
	border:2px solid #535378;
}
#a1:hover {
	background-color:#4C4C70;
}
#total {
	font-size:40px;
	margin-bottom:38px;
}
#b {
	text-decoration:none; 
	background-color:#F9F9F9;
	font-size:20px;
	color:black;
	border-radius:50px;
	border:2px solid #535378;
	height:40px;
	padding-top:5px;
	padding-bottom:5px;
	padding-right:30px;
	padding-left:30px;
}
#b:hover {
	background-color:#EDEDF2;
}
table {
  border-collapse: separate;
  border-spacing: 0 50px;
  font-size:25px;
}
</style>
<body onload="resizeIMG()">

<div class="modal" id="completeModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-body">
				장바구니에 추가되었습니다.<br/>
			</div>
			
			<div class="modal-footer">
				<div class="d-flex justify-content-between" style="width:100%;">
					<div>
						<a class="btn btn-info" href="mypage_cart">장바구니페이지로</a>
					</div>
					<div>
						<button class="btn btn-secondary" data-dismiss="modal">상품 더보기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 우측 배너 -->
<%@ include file="fixzone.jsp" %>

<div id="wrap">
   <!-- HEADER -->
   <%@ include file="header.jsp" %>

	
	<div style="height:700px;">
		<div class="d-flex flex-column" id="itemview" style="width:500px; margin-right:110px; float:right;">
			<div class="d-flex justify-content-between">
				<div>
					<p style="font-size:25px; margin-top:-10px;">${result.p_name}</p>
				</div>
				<div>
					<span style="color:gray;">재고 ${result.p_stock}</span>
				</div>
			</div>
			
			<div id="div" style="float:left;">
				<hr style="background-color:#343a40;"/>
				<table>
					<tr>
						<td>가격</td>
						<td>
							<span style="margin-right:30px; margin-left:30px;">&#149</span>
							<span id="price"></span> &#8361;&nbsp;&nbsp;&nbsp;
							<div id="asdf" style="display:inline; color:red; margin:0px; padding:0px;">
								<span style="font-size:0.9em;"><span id="sale" ></span>%</span>
								<span id="oprice" style="text-decoration:line-through; color:lightgray; font-size:0.8em;"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td>배송방법</td>
						<td>
							<span style="margin-right:30px; margin-left:30px;">&#149</span>일반택배
						</td>
					</tr>
					<tr>
						<td>배송비</td>
						<td>
							<span style="margin-right:30px; margin-left:30px;">&#149</span>
							<span id="delivery"></span> &#8361;
						</td>
					</tr>
					<tr>
						<td>수량</td>
						<td>
							<input type="number" id="stock" value="1" min="1" max="${result.p_stock}" style="width:60px;" onchange="caltotal()"> 
						</td>
					</tr>
				</table>
			</div>
			
			<div>
			<!-- form -->
		   <div style="display:none;">
		      <form id="itemform" method="POST">
		         <sec:csrfInput/>
		         <input type="text" name="p_code" id="p_code" value="${result.p_code}"/>
		         <input type="text" name="cart_name" id="cart_name" value="${result.p_name}"/>
		         <input type="text" name="cart_price" id="cart_price"/>
		         <input type="text" name="cart_delivery" id="cart_delivery"/>
		         <input type="text" name="cart_sale" id="cart_sale" value="${result.p_sale}"/>
		         <input type="text" name="cart_ea" id="cart_ea"/>
		      </form>
		   </div>								
			</div>
			
			<div id="div" class="mt-auto">
				<span style="color:gray; font-size:0.8em;">5만원 이상 구매시 무료배송 !!</span>
				<hr style="background-color:#343a40; margin-bottom:20px;"/>
				
				<div style="height:103px;">
					<p id="total" style="margin-bottom:35px;">TOTAL : <span id="totalresult"></span> &#8361;</p>	
				</div>
				
				<div>
					<button id="a1" onclick="directpay()">바로구매</button>
					<sec:authorize access="hasRole('ROLE_USER')">
						<button id="a" onclick="basket()">장바구니</button>
					</sec:authorize>
				</div>
			</div>
		</div>
		
		<div id="mainimg" style="width:700px; margin-top:50px; padding:0 20px; overflow:hidden;">
			<img src="images/product/${result.p_mainimg}" width="100%" style="object-fit:cover;"/>
		</div>
	</div>
	
	<!-- form -->
	<div style="display:none;">
		<form id="itemform" method="POST">
			<sec:csrfInput/>
			<input type="text" name="p_code" id="p_code" value="${result.p_code}"/>
			<input type="text" name="cart_name" id="cart_name" value="${result.p_name}"/>
			<input type="text" name="cart_price" id="cart_price"/>
			<input type="text" name="cart_delivery" id="cart_delivery"/>
			<input type="text" name="cart_sale" id="cart_sale" value="${result.p_sale}"/>
			<input type="text" name="cart_ea" id="cart_ea"/>
		</form>
	</div>
	
	<div>
		<hr style="margin-bottom:100px; margin-top:100px; background-color:#58595B; opacity:30%;"/>
		
		<div style="text-align:center; margin-bottom:100px;">
			<a id="b" href="#">구매후기</a>
			<a id="b" href="#">상품정보</a>
			<a id="b" href="#">상품문의</a>
		</div>
		
		<div>
			<div style="width:100%; background-color:#D8D8D8; margin-bottom:70px;">
				<img src="images/product/sub/${result.p_subimg}" width="100%"/>
			</div>
		</div>
		
		<hr style="margin-bottom:70px; "/>
		
		<div style="margin-bottom:70px; ">
			<p style="font-size:30px; text-align:center;">상품문의</p>
		</div>
		
		<hr style="margin-bottom:70px; "/>
	</div>
	
</div>
<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>

<script>
var total = ${result.p_a_price};
var delivery = ${result.p_delivery};

$(document).ready(function(){
	var price = "${result.p_a_price}";
	var oprice = "${result.p_o_price}";
	var sale = "${result.p_sale}";
	var delivery = "${result.p_delivery}";
	var total = ${result.p_a_price};
	var totalStr = String(total);
	$("#stock").val(1);
	
	price = addComma(price);
	oprice = addComma(oprice);
	totalStr = addComma(totalStr);
	delivery = addComma(delivery);
	
	$("#price").text(price);
	$("#oprice").text(oprice);
	$("#totalresult").text(totalStr);
	$("#sale").text(sale);
	$("#delivery").text(delivery);
	
	if(sale == 0)
		$("#asdf").css("display", "none");
	
	//수량 제한
	$("#stock").keyup(function(){
		var stock = $("#stock").val();
		var max = ${result.p_stock};
		if(stock > max || stock < 1)
			$("#stock").val(max);
	});

});

function addComma(value) {
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value;
}

//장바구니 담기
function basket() {
   var csrfHeader = $("meta[name='_csrf_header']").attr("content");
   var csrfToken = $("meta[name='_csrf']").attr("content");
   var cart_ea = $("#stock").val();
   var queryString = $('#itemform').serialize();
   $("#cart_price").val(total);
   $("#cart_delivery").val(delivery);
   $("#cart_ea").val(cart_ea);
   
   $.ajax({
      url: "shopping_basket",
      type: "POST",
      data: $("#itemform").serialize(),
      beforeSend: function(xhr) {
         xhr.setRequestHeader(csrfHeader, csrfToken);
      },
      success: function(data) {
    	  $("#completeModal").modal();
      },
      error: function() {
    	  alert("이미 추가된 상품입니다.");
      }
   });
}

//바로구매
function directpay() {
	var cart_ea = $("#stock").val();
	
	$("#cart_price").val(total);
	$("#cart_delivery").val(delivery);
	$("#cart_ea").val(cart_ea);
	
	$("#itemform").attr("action", "directpay");
	$("#itemform").submit();
}

//이미지 리사이즈
function resizeIMG() {
	var height = $("#mainimg").height();
	$("#itemview").css("height", height + "px");
	if(height > 660) {
		$("#mainimg").css("height", "700px");
		$("#itemview").css("height", "700px");
	}
}

//토탈 값 계산
function caltotal() {
	var stock = $("#stock").val();
	var price = ${result.p_a_price};
	
	total = price * stock;
	if(total >= 50000) {
		total = price * stock;
		delivery = 0;
		$("#delivery").text("0");
	} else {
		total = price * stock;
		delivery = ${result.p_delivery};
		var del = "${result.p_delivery}"
		del = addComma(del);
		$("#delivery").text(del);
	}
	
	var totalStr = String(total);
	totalStr = addComma(totalStr);
	$("#totalresult").text(totalStr);
}

</script>

</html>