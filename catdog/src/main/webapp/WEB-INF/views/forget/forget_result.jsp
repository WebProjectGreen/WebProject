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
<title>검색 결과</title>
</head>
<body>

<div id="forget" style="width:100%; height:350px;">
	<div style="text-align:center;">
		<h3>검색 결과</h3>
		<span style="color:gray;">일치하는 정보의 계정 목록 입니다.</span>
		
		<table class="table" style="margin:20px 0 0;">
			<thead>
				<tr>
					<th>ID</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${result}" var="dto">
					<tr>
						<td>${dto.user_id}</td>
						<td style="color:gray;">${dto.user_since}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	<div style="margin:50px auto 0; width:65%;" class="d-flex justify-content-between">
		<button class="btn btn-secondary" id="back">뒤로가기</button>
		<button class="btn btn-danger" id="login">로그인</button>
	</div>
</div>

</body>

<script>
$(document).ready(function(){
	$("#back").click(function(){
		location.href = "forget";
	});
	$("#login").click(function(){
		location.href = "login";
	});
});
</script>
</html>