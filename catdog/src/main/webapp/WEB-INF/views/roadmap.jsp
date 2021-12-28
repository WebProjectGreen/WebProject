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
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style/main.css" rel="stylesheet" type="text/css">
<title>MyPage</title>

<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">
<link href="style/fixzone.css" rel="stylesheet" type="text/css">

</head>
<body>

<!-- 우측 배너 -->
<%@ include file="fixzone.jsp" %>

<div id="wrap">
   <!-- HEADER -->
   <%@ include file="header.jsp" %>
	<div style="height:600px; margin-bottom:100px;">
		
		<div style="margin-top:40px; margin-bottom:40px;">
			<p style="font-size:40px; color:#535378; text-align:center;">오시는길</p>
		</div>
		
		<hr style="margin-bottom:80px; width:250px; background-color:black;"/>
		
		<div id="daumRoughmapContainer1639472965785" class="root_daum_roughmap root_daum_roughmap_landing" 
			 style="float:left; margin-right:60px;">
		</div>
		
		<div >
			<p>경기 수원시 팔달구 매산로1가 11-12 아이메카 7층 그린컴퓨터아카데미</p>
			
			<p>우편번호 : 16455</p>
			
			<p>0507-1487-2111</p>
			
			<p style="margin-bottom:0px;">운영시간</p>
			<p style="margin-bottom:0px;">평일 09:00 - 22:00</p>
			<p style="margin-bottom:0px;">금요일 09:00 - 19:30</p>
			<p>토요일 09:00 - 17:00</p>
			
			<p>본관 : 수원역 9번출구 50M 지점. 신한은행, 스타벅스 길 건너</p>
			<p>신관 : 수원역 13번출구 바로 앞. 아이메카 상가 5,7,11층</p>
		</div>
		
	</div>
	
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1639472965785",
			"key" : "28fmp",
			"mapWidth" : "600",
			"mapHeight" : "400"
		})
		
		.render();
	
</script>

</div>
<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>
</html>