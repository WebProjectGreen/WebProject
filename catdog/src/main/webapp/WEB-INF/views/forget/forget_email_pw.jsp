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

</head>
<body>

<div id="signup2" style="width:30%; margin:20px auto; padding:0 10px; border:1px solid lightgray; border-radius:15px;">
	<h3 style="text-align:center; margin:10px 10px;">비밀번호 찾기</h3>
	<hr style="border:0; height:3px; background:lightgray; margin:0 0 20px;"/>
    <form id="form_chk_next" name="signup" method="post" onsubmit="return false">
    	<sec:csrfInput/>
      	<p><strong>이메일</strong></p>
      	<input type="text" name="user_email" class="text-field" id="email" placeholder="email@gmail.com"/>&nbsp;
      	<button type="button" class="btn btn-secondary" id="mail_check">코드발송</button>
      	<p><strong>인증코드</strong></p>
      	<input type="text" class="text-field" id="email_verify" disabled/>&nbsp;
      	<button type="button" class="btn btn-secondary" id="mail_verify_check" disabled>인증하기</button>
      
        <div style="width:35%; margin:20px auto 20px;">
     	   <input type="submit" id="join-btn" class="btn btn-danger" value="확인"/>
        </div>
      
	</form>
</div>

</body>

<script>

var code = "";
var emailPass = 0;

$(document).ready(function(){
	
	//메일 인증 스크립트
	$("#mail_check").click(function(e){
		e.preventDefault();
		var email = $("#email").val();
		var checkbox = $("#email_verify");
		var checkbox_button = $("#mail_verify_check");
		
		$.ajax({
			url: "mailverifyCheck?email=" + email,
			type: "GET",
			success:function(data){
				alert("인증 메일이 발송되었습니다.\n (서버 상황에 따라 지연될 수도 있습니다.)");
				
				$.ajax({
					url: "mailCheck?email=" + email,
					type: "GET",
					success:function(data){
						checkbox.attr("disabled", false);
						checkbox_button.attr("disabled", false);
						code = data;
					}
				});
			}
		});
	});
	
	$("#mail_verify_check").click(function(e){
		e.preventDefault();
		var email = $("#email");
		var email_button = $("#mail_check");
		var checkbox = $("#email_verify");
		var checkbox_button = $("#mail_verify_check");
		
		var ENum = $("#email_verify").val();
		
		if(code == ENum) {
			alert("인증되었습니다.");
			email.attr("disabled", true);
			email_button.attr("disabled", true);
			checkbox.attr("disabled", true);
			checkbox_button.attr("disabled", true);
			emailPass = 1;
		} else {
			alert("인증번호가 일치하지 않습니다.");
		}
	});
	
	// 확인 버튼
	$("#form_chk_next").submit(function(e){
		e.preventDefault();
		if(emailPass == 1) {
			var email = $("#email");
			email.attr("disabled", false); //disabled 활성화시 값을 가져오지못함
			
			$.ajax({
				url : "forget/pwChange",
				success : function(data) {
					$("#main").html(data);
				},
			});	
		} else {
			return alert("이메일 인증을 해주세요.");
		}
		 
	});
		
});
</script>

</html>