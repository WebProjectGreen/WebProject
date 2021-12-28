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

<link href="<c:url value='/resources/style/fixzone.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/main.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_header.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_footer.css'/>" rel='stylesheet' type='text/css'>

<sec:csrfMetaTags/>

</head>
<body>

<div id="wrap">
	<!-- 우측 배너 -->
	<%@ include file="../fixzone.jsp" %>
	
	<!-- HEADER -->
	<%@ include file="../header.jsp" %>
	
	<div id="main">
		<div style="margin:40px auto 20px; width:900px;">
			<p style="text-align:center; font-size:1.5em;">회원정보확인</p>
			<div style="text-align:center; font-size:0.8em;">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.username" var="username"/>
					<span style="color:red;">${username}</span> <span style="color:gray;">님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</span>
				</sec:authorize>
			</div>
			<hr style="margin:10px 0 20px;"/>
			<div style="border:1px solid lightgray; padding:10px 20px; text-align:center;">
				<form id="pw" method="POST" onsubmit="return false">
					<sec:csrfInput/>
					비밀번호 : <input type="password" name="user_pw" id="user_pw"/>
				</form>
			</div>
		</div>
		
		<div style="margin:0 auto 120px; width:200px;" class="d-flex justify-content-between">
			<div>
				<button style="width:70px;" class="btn btn-info" onclick="PWsubmit()">확인</button>
			</div>
			<div>
				<button style="width:70px;" class="btn btn-secondary" onclick="back()">취소</button>
			</div>
		</div>
	</div>
	
</div>

<!-- FOOTER -->
<%@ include file="../footer.jsp" %>

</body>

<script>
$(document).ready(function(){
	$("#pw").submit(function(e){
		e.preventDefalut;
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		$.ajax({
			url: "pwcheck",
			type: "POST",
			data: $("#pw").serialize(),
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success: function(data) {
				$("#main").html(data);
			},
			error: function(request,status,error) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#user_pw").focus();
			}
		});
	});
});

function PWsubmit() {
	$("#pw").submit();
}

function back() {
	window.history.back();
}
</script>

</html>