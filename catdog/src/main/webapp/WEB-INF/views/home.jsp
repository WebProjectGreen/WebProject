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
<title>Home</title>

<!-- 외부 Source 적용 -->
<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/fixzone.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_body1.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">

</head>
<body>

<!-- 우측 배너 -->
<%@ include file="fixzone.jsp" %>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="header.jsp" %>
	<!-- BODY-->
	<%@ include file="body.jsp" %>
</div>

<!-- BODY - BOTTOM -->
<div id="body_bottom" class="container-fluid mb-5">
	<div class="d-flex">
		<div>
			<span style="display:block;">
				<strong style="font-size:1.5em;">이벤트</strong>&nbsp;EVENT
			</span>
			<div style="width:100%; height:90%; border-radius:20px; background-color:black; overflow:hidden;">
				<img src="images/event.PNG" alt="이벤트" style="height:100%"/>
			</div>
		</div>
		<div>
			<div class="d-flex" style="justify-content:space-between;">
				<div>
					<strong style="font-size:1.5em;">상품후기</strong>&nbsp;REVIEW
				</div>
				<div>
					<button class="btn btn-outline-dark" style="border:0;">더보기</button>
				</div>
			</div>
			<hr style="border:0; height:1px; background:black; margin:0;"/>
			<div style="width:100%; height:89%; padding:0 0;" class="d-flex flex-column">
				<div id="review" class="m-auto">
					<div id="review_img">
					</div>
				</div>
				<div id="review" class="m-auto">
					<div id="review_img">
					</div>
				</div>
				
				<div id="review" class="m-auto">
					<div id="review_img">
					</div>
				</div>
				
				<div id="review" class="m-auto">
					<div id="review_img">
					</div>
				</div>
			</div>
			<hr style="border:0; height:1px; background:black; margin:0;"/>
		</div>
	</div>
</div>

<!-- BODY - BOTTOM - PROMOTION -->
<div id="wrap">
	<div id="body_bottom_promotion" class="d-flex justify-content-between mb-5" style="width:100%; height:120px;">
		<div><img src="images/promotion/promotion_bottom_01.png" alt="프로모션1"/></div>
		<div><img src="images/promotion/promotion_bottom_02.png" alt="프로모션2"/></div>
		<div><img src="images/promotion/promotion_bottom_03.png" alt="프로모션3"/></div>
		<div><img src="images/promotion/promotion_bottom_04.png" alt="프로모션4"/></div>
	</div>
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>

</html>