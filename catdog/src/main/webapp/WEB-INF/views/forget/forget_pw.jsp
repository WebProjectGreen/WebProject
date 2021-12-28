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
<title>비밀번호 찾기</title>

<sec:csrfMetaTags/>

</head>
<body>
<div style="margin:30px 0 0;">
	<h3 style="text-align:center;">비밀번호 변경</h3><br/>
	<hr/>
	<div style="border:1px solid lightgray; border-radius:15px; width:30%; margin:40px auto 120px; padding:15px;">
		<form id="forget_pw" onsubmit="return false">
			<strong>ID</strong>&nbsp;&nbsp;<span style="font-size:0.8em; color:gray;">가입하신 유저 아이디를 입력해주세요</span>
			<input type="text" class="form-control" name="user_id" id="user_id"/><br/>
			<strong>이메일</strong>&nbsp;&nbsp;<span style="font-size:0.8em; color:gray;">가입하신 유저 이메일를 입력해주세요</span><br/>
			<div class="d-flex mb-2">
				<div class="align-self-center">
					<input type="text" name="user_email" class="text-field" id="email" placeholder="email@gmail.com"/>&nbsp;
				</div>
				<div>
		      		<button type="button" class="btn btn-secondary" id="mail_check">코드발송</button>
		      	</div>
	      	</div>
	      	<div id="email_verify" style="display:none;">
	      		<strong>인증번호</strong><br/>
	      		<div class="d-flex">
		      		<div class="align-self-center">
		      			<input type="text" placeholder="인증번호" id="verifycode" style="width:5em;"/>&nbsp;
		      		</div>
		      		<div>
		      			<button type="button" class="btn btn-danger" id="mail_verify_check">인증하기</button>
		      		</div>
	      		</div>
	      	</div>
      	</form>
	</div>
</div>
</body>

<script>

var code;
var user_id = "";

$(document).ready(function(){
	
	//메일 인증 스크립트
	$("#mail_check").click(function(e){
		e.preventDefault();
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		
		var email = $("#email").val();
		
		$.ajax({
			url: "forget/idCheck",
			type: "POST",
			data: $("#forget_pw").serialize(),
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success: function(data) {
				if(data == "success") {
					$.ajax({
						url: "mailverifyCheck?email=" + email,
						type: "GET",
						success:function(data){
							alert("인증 메일이 발송되었습니다.\n (서버 상황에 따라 지연될 수도 있습니다.)");
							user_id = $("#user_id").val();
							$("#mail_check").attr("disabled", true);
							$("#user_id").attr("disabled", true);
							$("#email").attr("disabled", true);
							$("#email_verify").css("display", "");
							$.ajax({
								url: "mailCheck?email=" + email,
								type: "GET",
								success:function(data){
									code = data;
								}
							});
						}
					});
				} else {
					alert("유저 아이디와 이메일이 일치하지 않습니다.");
				}
			}
		});
	});
	
	$("#mail_verify_check").click(function(e){
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		e.preventDefault();
		var ENum = $("#verifycode").val();
		
		if(code == ENum) {
			alert("인증되었습니다.");
			$("#user_id").attr("disabled", false);
			$.ajax({
				url: "forget/pw2",
				type: "POST",
				data: $("#forget_pw").serialize(),
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken);
				},
				success: function(data) {
					$("#main").html(data);
				}
			});
		} else {
			alert("인증번호가 일치하지 않습니다.");
		}
	});
	
});
</script>

</html>