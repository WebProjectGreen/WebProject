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
		<h2>검색 결과가 없습니다.</h2>
		<span style="color:gray;">유저 정보를 제대로 기입했는지 다시 확인해주세요.</span>
	</div>
	<div style="margin:50px auto 0; width:100px;">
		<button class="btn btn-secondary" id="back">뒤로가기</button>
	</div>
</div>
</body>

<script>
$(document).ready(function(){
	$("#back").click(function(){
		location.href = "forget";
	});
});
</script>

</html>