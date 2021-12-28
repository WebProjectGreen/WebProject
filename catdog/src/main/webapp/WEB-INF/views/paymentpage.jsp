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
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style/main.css" rel="stylesheet" type="text/css">
<title>MyPage</title>

<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">
<link href="style/mypage.css" rel="stylesheet" type="text/css">
<link href="style/prp.css" rel="stylesheet" type="text/css">

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
</style>

</head>
<body>

<div id="wrap">
   <!-- HEADER -->
   <%@ include file="header.jsp" %>
	
	<div>
		<div style="width:500px; height:500px; margin-right:110px; float:right;">
			<div>
				<p style="font-size:25px; margin-top:-10px;">제라미펫 르네 강아지 고양이 이동가방 숄더백</p>
			</div>
			
			<hr style="background-color:#343a40;"/>
			
			<div id="div" style="float:left;">
				<table>
					<tr>
						<td>가격</td>
					</tr>
					<tr>
						<td>배송방법</td>
					</tr>
					<tr>
						<td>배송비</td>
					</tr>
					<tr>
						<td>색/사이즈</td>
					</tr>
					<tr>
						<td>베이지M</td>
					</tr>
				</table>
			</div>
			
			<div id="div" >
				<table>
					<tr>
						<td><span style="margin-right:30px; margin-left:30px;">&#149</span>   39,000원</td>
					</tr>
					<tr>
						<td><span style="margin-right:30px; margin-left:30px;">&#149</span>   택배</td>
					</tr>
					<tr>
						<td><span style="margin-right:30px; margin-left:30px;">&#149</span>   3,000원</td>
					</tr>
					<tr>
						<td><span style="margin-right:30px; margin-left:30px;">&#149</span>   1</td>
					</tr>
					<tr>
						<td><span style="margin-right:30px; margin-left:30px;">&#149</span>   수량</td>
					</tr>
				</table>
				
				<hr style="background-color:#343a40; margin-bottom:20px;"/>
				
				<p id="total">TOTAL : 39,000원</p>
				
				<div>
					<a id="a1" href="#">바로구매</a>
					<a id="a" href="#">장바구니</a>
					<a id="a" href="#">찜하기</a>
				</div>
			</div>
		</div>
		
		<div style="width:700px; height:500px; margin-top:50px;">
			<img  style="width:650px; height:500px;" src="images/items/fashion/img15.PNG">
		</div>
	</div>
	
	<div>
		<hr style="margin-bottom:100px; margin-top:100px; background-color:#58595B; opacity:30%;"/>
		
		<div style="text-align:center; margin-bottom:100px;">
			<a id="b" href="#">구매후기</a>
			<a id="b" href="#">상품정보</a>
			<a id="b" href="#">상품문의</a>
		</div>
		
		<div>
			<div style="height:280px; background-color:#D8D8D8; margin-bottom:70px;">
				<img src="#" style="height:280px;">
			</div>
		</div>
		
		<div>
			<div style="height:600px; background-color:#D8D8D8; margin-bottom:70px;">
				<img src="#" style="height:60px;">
			</div>
		</div>
		
			<div style="height:600px; background-color:#D8D8D8; margin-bottom:70px; width:700px; margin-left:330px;">
				<img src="#" style="height:600px; width:700px; ">
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
</html>