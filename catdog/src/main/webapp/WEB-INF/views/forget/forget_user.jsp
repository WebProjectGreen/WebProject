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
<title>유저정보 찾기</title>
</head>
<body>

<div id="forget" style="width:100%; height:425px;">
	<h3 style="text-align:center;">유저정보로 찾기</h3><br/>
	<hr/>
	<form id="forget_form">
		<sec:csrfInput/>
		<div id="forget_user">
			<strong>이름</strong>&nbsp;&nbsp;<span>선택사항에 기입하신 이름을 적어주세요.</span>
			<input type="text" class="form-control" name="user_name" id="user_name"/><br/>
			<strong>생년월일</strong>&nbsp;&nbsp;<span>선택사항에 기입하신 생년월일을 적어주세요.</span>
			<select class="form-control" name="year" id="year">
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
			</select>&nbsp;년&nbsp;
			<select class="form-control" name="month" id="month">
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
			</select>&nbsp;월&nbsp;
			<select class="form-control" name="day" id="day">
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
			</select>&nbsp;일&nbsp;
		</div>
		<div style="margin:20px auto 0; width:100px;">
			<button type="submit" class="btn btn-secondary" id="forget_submit">제출</button>
		</div>
	</form>
</div>

</body>

<script>
$(document).ready(function(){
	$("#forget_form").submit(function(e){
		e.preventDefault();
		var name = $("#user_name").val();
		var year = $("#year").val();
		var month = $("#month").val();
		var day = $("#day").val();

		if(name != "") {
			if(year != "0000" && month != "00" & day != "00") {
				$.ajax({
					url: "forget/user/submit",
					type: "POST",
					data: $("#forget_form").serialize(),
					success : function(data) {
						$("#main").html(data);
					}
				});
			} else {
				alert("생년월일을 입력해주세요.");
			}
		} else {
			alert("이름을 입력해주세요.");
		}
	});
});
</script>
</html>