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
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style/main.css" rel="stylesheet" type="text/css">
<title>MyPage</title>

<link href="<c:url value='/resources/style/main.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/fixzone.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_header.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_footer.css'/>" rel='stylesheet' type='text/css'>

</head>

<body>

<!-- 우측 배너 -->
<%@ include file="../fixzone.jsp" %>

<div id="wrap">
    <!-- HEADER -->
    <%@ include file="../header.jsp" %>
    
    <div id="main">
	    <div style="margin:20px 0 10px; text-align:center;">
	    	<h3>MY PAGE</h3>
	    	<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="username"/>
				<span>${username}</span><br/>
				<span style="color:gray; font-size:0.9em;">환영합니다.</span>
			</sec:authorize>
	    </div>
	    <hr/>
	    <div class="d-flex justify-content-between" style="margin:30px auto 50px; width:34%; height:200px;">
	    	<div style="width:200px; height:100%;" class="bg-secondary">
	    		<a href="mypage_cart">
	    			<img src="images/mypage/shopping.png" alt="장바구니" />
	    		</a>
	    	</div>
	    	<div style="width:200px; height:100%;" class="bg-secondary">
	    		<a href="mypage_order">
	    			<img src="images/mypage/order.png" alt="주문내역" />
	    		</a>
	    	</div>
	    </div>
	    <div class="d-flex justify-content-between" style="margin:0 auto 120px; width:34%; height:200px;">
	    	<div style="width:200px; height:100%;" class="bg-secondary">
	    		<a href="mypage_user">
	    			<img src="images/mypage/user.png" alt="회원관리" />
	    		</a>
	    	</div>
	    	<div style="width:200px; height:100%;" class="bg-secondary">
	    		<a href="remove">
	    			<img src="images/mypage/signout.png" alt="회원탈퇴" />
	    		</a>
	    	</div>
	    </div>
	</div>
	
</div>

<!-- FOOTER -->
<%@ include file="../footer.jsp" %>

</body>

</html>