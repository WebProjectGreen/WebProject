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
<title>login</title>

<!-- 외부 Source 적용 -->
<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">
<link href="style/login.css" rel="stylesheet" type="text/css">

</head>
<body>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="header.jsp" %>
	
	<div id="login">
		<span>로그인</span>
		<div class="login-form">
			<form action="login" method="POST">
				<sec:csrfInput />
				<input type="text" name="user_id" class="text-field" placeholder="id">
				<hr style="margin:0 0 10px;"/>
				<input type="password" name="user_pw" class="text-field" placeholder="pw">
				<hr style="margin:0 0 5px;"/>
				<div style="font-size:0.9em" id="verity"></div>
				<input type="checkbox" name="remember-me" id="remember-me"/>
				<label for="remember-me" aria-describedby="rememberMeHelp">
					<span style="font-size:0.9em">자동로그인</span>
				</label>
				<input type="submit" value="로그인" class="submit-btn">
				<input type="button" value="ID/PW 찾기" class="find-btn">
				<input type="button" value="회원가입" class="signup-btn">
			</form>
		</div>
	</div>
	
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>

<script>
$(document).ready(function(){
	$(".signup-btn").click(function(){
		$(location).attr("href", "signup");
	});
	$(".find-btn").click(function(){
		$(location).attr("href", "forget");
	});
	
	<c:choose>
		<c:when test="${not empty error}">  //model의 msg값이 null이 아님 (로그아웃)
			$("#verity").text("${error}");
			$("#verity").css("color", "red");
		</c:when>	
	</c:choose>
});
</script>

</html>