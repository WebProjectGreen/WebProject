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
<title>ID/PW 찾기</title>

<!-- 외부 Source 적용 -->
<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/fixzone.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">
<link href="style/forget.css" rel="stylesheet" type="text/css">

</head>
<body>

<!-- 우측 배너 -->
<%@ include file="fixzone.jsp" %>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="header.jsp" %>
	
	<div id="main">
		<div id="forget" style="width:100%; height:425px;" class="d-flex">
			<div id="box">
				<h3>ID 찾기</h3><br/>
				<hr/>
				<div class="d-flex justify-content-between" style="width:100%; margin:40px auto 0;">
					<div id="selectbox">
						<a id="user" href="forget_user">
							<img src="images/forget/user.png" alt="유저정보"/>
						</a>
					</div>
					<div id="selectbox">
						<a id="email" href="forget_email">
							<img src="images/forget/email.png" alt="이메일정보"/>
						</a>
					</div>
				</div>
			</div>
			<div id="box">
				<h3>PW 찾기</h3><br/>
				<hr/>
				<div class="d-flex justify-content-center" style="width:100%; margin:40px auto 0;">
					<div id="selectbox">
						<a id="password" href="forget_pw">
							<img src="images/forget/password.png" alt="비밀번호"/>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>

<script>
$(document).ready(function(){
	//ajax
	$("#user").click(function(event){
		event.preventDefault();		
		$.ajax({
			url : "forget/user",
			success : function(data) {
				$("#main").html(data);
			},
		});		
	});
	$("#email").click(function(event){
		event.preventDefault();		
		$.ajax({
			url : "forget/email",
			success : function(data) {
				$("#main").html(data);
			},
		});		
	});
	$("#password").click(function(event){
		event.preventDefault();		
		$.ajax({
			url : "forget/pw",
			success : function(data) {
				$("#main").html(data);
			},
		});		
	});
});
</script>

</html>