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
<title>유저정보 찾기</title>
</head>
<body>

<div id="forget" style="width:100%; height:425px;">
	<h3 style="text-align:center;">이메일로 찾기</h3><br/>
	<hr/>
	<div id="forget_user">
		<form id="forget_form">
			<strong>E-MAIL</strong>&nbsp;&nbsp;<span>가입하신 이메일을 입력해주세요.</span>
			<input type="email" class="form-control" name="user_email" id="user_email"/><br/>
			<div style="margin:20px auto 0; width:100px;">
				<button type="submit" class="btn btn-secondary" id="forget_submit">제출</button>
			</div>
		</form>
	</div>
</div>
</body>

<script>
$(document).ready(function(){
	$("#forget_form").submit(function(e){
		e.preventDefault();
		var email = $("#user_email").val();
		
		if(email != "") {
			$.ajax({
				url: "forget/email/submit?email=" + email,
				type: "GET",
				success : function(data) {
					$("#main").html(data);
				}
			});
		} else {
			alert("이메일을 입력해주세요.");
		}
	});
});
</script>
</html>