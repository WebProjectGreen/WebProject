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
<title>비밀번호 변경</title>

<style>
#td1 {
	width:30%;
	height:50px;
	background-color:#F3F3F3;
	text-align:right;
	padding:0 10px 0 0;
}
#td2 {
	padding:0 0 0 10px;
}
#td3 {
	width:20%;
	height:50px;
	background-color:#F3F3F3;
	text-align:right;
	padding:0 10px 0 0;
}
</style>

<sec:csrfMetaTags/>

</head>
<body>

<div style="border:1px solid lightgray; padding:20px; text-align:center; margin:30px 0 120px;">
	<form id="form_pw_change" onsubmit="return false">
		<table style="width:40%; margin:0 auto;">
			<tbody>
				<tr>
					<td id="td1" style="width:40%;">
						ID
					</td>
					<td id="td2">
						<div class="d-flex align-items-center" style="height:100%;">
							<input type="text" name="user_id" id="user_id" value="${user_id}" style="width:100%;" disabled/>
						</div>
					</td>
				</tr>
				<tr>
					<td id="td1" style="width:40%;">
						새 비밀번호
					</td>
					<td id="td2">
						<div class="d-flex align-items-center" style="height:100%;">
							<input type="password" name="user_pw" id="pw" style="width:100%;"/>
						</div>
					</td>
				</tr>
				<tr>
					<td id="td1" style="width:40%;">
						새 비밀번호 확인
					</td>
					<td id="td2">
						<div class="d-flex align-items-center" style="height:100%;">
							<input type="password" id="pw_verity" style="width:100%;"/>
						</div>
						<div id="verity" style="width:100%; font-size:0.8em; margin:0 0 10px;"></div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="d-flex justify-content-center" style="margin:10px 0 0;">
			<button type="submit" class="btn btn-danger" style="width:80px;">수정</button>
		</div>
	</form>
</div>

</body>

<script>
var pwPass = 0;
$(document).ready(function(){
	//비밀번호 감지 스크립트
	$("#pw_verity").keyup(function(){
		var p1 = document.getElementById('pw').value;
		var p2 = document.getElementById('pw_verity').value;
		if(p1 != p2) {
			pwPass = 0;
		} else {
			pwPass = 1;
		}
		if(p1 == "") {
			$("#verity").text("");
			pwPass = 0;
		}
	});
	
	$("#pw").keyup(function(){
		var p1 = document.getElementById('pw').value;
		var p2 = document.getElementById('pw_verity').value;
		if(p2 != "") {
			if(p1 != p2) {
				pwPass = 0;
			} else {
				pwPass = 1;
			}
		} else {
			$("#verity").text("");
		}
	});
		
	//비밀번호 변경
	$("#form_pw_change").submit(function(e){
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		e.preventDefault();
		if(pwPass == 1) {
			$("#user_id").attr("disabled", false);
			$.ajax({
				url: "forget/pwchg",
				type: "POST",
				data: $("#form_pw_change").serialize(),
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken);
				},
				success: function(data){
					alert("비밀번호 변경이 완료되었습니다.");
					location.href = "login";
				},
				error: function(data){
					alert("error");
				}
			});
		} else {
			alert("비밀번호가 일치하지 않습니다.");
		}
	});
});

</script>

</html>