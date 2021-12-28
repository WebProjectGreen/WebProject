`<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>회원가입(개인정보)</title>

</head>
<body>

<div id="signup2" style="width:30%; margin:20px auto; padding:0 10px; border:1px solid lightgray; border-radius:15px;">
	<h3>회원가입</h3>
	<hr style="border:0; height:3px; background:lightgray; margin:0 0 20px;"/>
    <form id="form_signup" name="signup" method="post" onsubmit="return false">
    	<sec:csrfInput/>
    	<p><strong>ID</strong></p>
      	<input type="text" name="user_id" id="id" class="text-field" placeholder="ID 입력" style="margin:0;"/>
      	<div id="id_verity" style="width:100%; font-size:0.8em; margin:0 0 10px;"></div>

      	<p><strong>Password</strong></p>
      	<input type="password" name="user_pw" id="pw" class="text-field" placeholder="PW 입력">
      	
      	<p><strong>Password 확인</strong></p>
      	<input type="password" name="user_pw_verify" id="pw_verity" class="text-field" placeholder="PW 입력" style="margin:0;">
      	<div id="verity" style="width:100%; font-size:0.8em; margin:0 0 10px;"></div>
      	
      	<p><strong>이메일</strong></p>
      	<input type="text" name="user_email" class="text-field" id="email" placeholder="email@gmail.com"/>&nbsp;
      	<button type="button" class="btn btn-secondary" id="mail_check">코드발송</button>
      	<p><strong>인증코드</strong></p>
      	<input type="text" class="text-field" id="email_verify" disabled/>&nbsp;
      	<button type="button" class="btn btn-secondary" id="mail_verify_check" disabled>인증하기</button>
      
        <p><strong>이름</strong><span>*</span></p>
        <input type="text" name="user_name" id="text2" class="text-field">
        
        <div style="margin:0 0 10px;">
	      	<p><strong>생년월일</strong><span>*</span></p>
	      	<select style="width:4em;" name="year">
	      		<option value="0000" selected>선택</option>
	        	<option value="1990">1990</option>
	        	<option value="1991">1991</option>
	        	<option value="1992">1992</option>
	       		<option value="1993">1993</option>
	       		<option value="1994">1994</option>
	        	<option value="1995">1995</option>
	        	<option value="1996">1996</option>
	        	<option value="1997">1997</option>
	        	<option value="1998">1998</option>
	        	<option value="1999">1999</option>
	        	<option value="2000">2000</option>
	     	 </select>년&nbsp;
	      
			<select style="width:4em;" name="month">
				<option value="00" selected>선택</option>
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>월&nbsp;
	      
	      <select style="width:4em;" name="day">
				<option value="00" selected>선택</option>
	       	 	<option value="01">1</option>
	        	<option value="02">2</option>
	        	<option value="03">3</option>
	        	<option value="04">4</option>
	        	<option value="05">5</option>
	        	<option value="06">6</option>
	        	<option value="07">7</option>
	       		<option value="08">8</option>
	        	<option value="09">9</option>
	        	<option value="10">10</option>
	        	<option value="11">11</option>
	        	<option value="12">12</option>
	        	<option value="13">13</option>
	        	<option value="14">14</option>
	        	<option value="15">15</option>
	        	<option value="16">16</option>
	        	<option value="17">17</option>
	        	<option value="18">18</option>
	        	<option value="19">19</option>
	        	<option value="20">20</option>
	        	<option value="21">21</option>
	        	<option value="22">22</option>
	        	<option value="23">23</option>
	        	<option value="24">24</option>
	        	<option value="25">25</option>
	       		<option value="26">26</option>
	        	<option value="27">27</option>
	        	<option value="28">28</option>
	        	<option value="29">29</option>
	        	<option value="30">30</option>
	        	<option value="31">31</option>
	      </select>일
	  </div>
      
      <div style="margin:0 0 10px;">
	      <p><strong>성별</strong><span>*</span></p>
	      <label for="man">남자</label>
	      <input type="radio" name="user_sex" value="m" id="man" checked>
	      <label for="woman">여자</label>
	      <input type="radio" name="user_sex" value="w" id="woman">
      </div>
      
      <span>*</span>&nbsp;&nbsp;<p style="display:inline; font-size:0.8em;">선택사항</p>
      
      <div style="width:35%; margin:20px auto 20px;">
     	 <input type="submit" id="join-btn" class="btn btn-danger" value="가입하기"/>
      </div>
      
	</form>
</div>

</body>

<script>

var code = "";
var idPass = 0;
var pwPass = 0;
var emailPass = 0;
var signin = $("#join-btn");

$(document).ready(function(){
	//비밀번호 감지 스크립트
	$("#pw_verity").keyup(function(){
		var p1 = document.getElementById('pw').value;
		var p2 = document.getElementById('pw_verity').value;
		if(p1 != p2) {
			$("#verity").text("비밀번호가 일치 하지 않습니다.");
			$("#verity").css("color", "red");
			pwPass = 0;
		} else {
			$("#verity").text("비밀번호가 일치 합니다.");
			$("#verity").css("color", "green");
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
				$("#verity").text("비밀번호가 일치 하지 않습니다.");
				$("#verity").css("color", "red");
				pwPass = 0;
			} else {
				$("#verity").text("비밀번호가 일치 합니다.");
				$("#verity").css("color", "green");
				pwPass = 1;
			}
		} else {
			$("#verity").text("");
		}
	});
	
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
				if(data == 1) {
					alert("이미 사용중인 메일입니다.");
				} else {
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
	
	//아이디 중복확인 및 한글 특수문자 감지 스크립트
	$("#id").blur(function(){
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		if(check.test($("#id").val())){ 
			$("#id_verity").text("숫자, 영어만 입력 가능합니다.");
			$("#id_verity").css("color", "red");
			$(this).val("");
			return false;
		}
		if(regExp.test($("#id").val())){ 
			$("#id_verity").text("숫자, 영어만 입력 가능합니다.");
			$("#id_verity").css("color", "red");
			$(this).val("");
			return false;
		}
		var user_id = $("#id").val();
		$.ajax({
			url: "idCheck?user_id=" + user_id,
			type: "GET",
			success:function(data){
				console.log("0 = 중복X / 1 = 중복O : " + data);
				
				if(data == 1) {
					if(user_id == "") {
						$("#id_verity").text("");
						idPass = 0;
					} else {
						$("#id_verity").text("이미 사용중인 아이디입니다.");
						$("#id_verity").css("color", "red");
						idPass = 0;
					}
				} else {
					if(user_id == "") {
						$("#id_verity").text("");
						idPass = 0;
					} else {
						$("#id_verity").text("사용 가능한 아이디입니다.");
						$("#id_verity").css("color", "green");
						idPass = 1;
					}
				}
			}
		});
	});
	
	//가입하기 버튼
	$("#form_signup").submit(function(e){
		e.preventDefault();
		if(idPass == 1) {
			if(pwPass == 1) {
				if(emailPass == 1) {
					var email = $("#email");
					email.attr("disabled", false); //disabled 활성화시 값을 가져오지못함
					
					$.ajax({
						url: "signup_submit",
						type: "POST",
						data: $("#form_signup").serialize(),
						success: function(data){
							console.log("result : " + data);
							alert("회원가입이 완료되었습니다.");
							location.href = "login_view";
						},
						error: function(data){
							alert("error");
						}
					});
				} else {
					alert("이메일 인증을 해주세요.");
				}
			} else {
				alert("비밀번호를 확인해주세요.");
			}
		} else {
			alert("아이디를 확인해주세요.");
		}
	});
		
});
</script>

</html>