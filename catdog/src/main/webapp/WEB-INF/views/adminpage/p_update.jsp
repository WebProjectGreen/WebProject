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
<title>상품수정</title>

</head>
<body style="width:100%; height:699px;">

<input type="text" id="child" style="display:none; color:white; border:none;"/>

<div id="updateMain" style="width:100%; height:100%;">
	<div class="d-flex align-items-center" style="width:100%; height:100%;">
		<div style="margin:auto; width:27%; height:23%;">
			<div class="spinner-border text-secondary" style="zoom:5.0;"></div>
		</div>
	</div>
</div>

</body>

<script>
$(document).ready(function(){
	document.getElementById("child").value = opener.document.getElementById("parent").value;
	var p_code = $("#child").val();
	$.ajax({
		url: "p_update_list?p_code=" + p_code,
		type: "GET",
		success: function(data) {
			$("#updateMain").html(data);
		}
	});
});
</script>

</html>