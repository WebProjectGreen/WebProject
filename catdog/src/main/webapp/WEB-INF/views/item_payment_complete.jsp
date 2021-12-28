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
<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/fixzone.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">

</head>
<body>

<!-- 우측 배너 -->
<%@ include file="fixzone.jsp" %>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="header.jsp" %>
	
	<div style="text-align:center; margin:40px 0 120px;">
		<p style="font-size:1.4em;">주문이 완료되었습니다.</p><br/>
		<span style="color:gray; font-size:0.9em;">주문정보와 배송상태는 마이페이지 > 주문관리에서 확인 가능합니다.</span><br/>
		<span style="color:gray; font-size:0.9em;">구매해주셔서 감사합니다.</span>
		<div class="d-flex justify-content-between" style="width:400px; margin:50px auto 0;">
			<div>
				<a class="btn btn-secondary" href="home">홈으로</a>
			</div>
			<div>
				<a class="btn btn-info" href="mypage_order">주문관리페이지로</a>
			</div>
		</div>
	</div>
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>
</html>