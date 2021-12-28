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
<title>cats&dogs</title>
<!-- 외부 Source 적용 -->
<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/fixzone.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">
<link href="style/item.css" rel="stylesheet" type="text/css">

<script>
var imgArr = [];
var imgboxArr = [];
</script>

</head>
<body onload="resizeIMG()">

<!-- 우측 배너 -->
<%@ include file="fixzone.jsp" %>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="header.jsp" %>
	
	<div id="items">
		<div class="d-flex" style="margin:40px 0 20px;">
			<div>
				<span style="font-size:1.5em;">${value}</span>&nbsp;&nbsp;
				<span class="badge badge-secondary">${itemCount}</span>
			</div>
		</div>
		<hr style="margin:20px 0;"/>
		<div id="main">
			<ul>
				<c:forEach items="${result}" var="dto">
					<li id="items">
						<div id="imgbox_${dto.p_code}" style="overflow:hidden; border-radius:10px; margin:0 0 5px;">
							<a id="item_box" href="item_view?code=${dto.p_code}">
								<img id="img_${dto.p_code}" src="images/product/${dto.p_mainimg}" width="100%" style="object-fit:cover;">
							</a>
							<script>
								//height 310px 제한
								var img = $("#img_" + ${dto.p_code});
								var imgbox = $("#imgbox_" + ${dto.p_code});
								imgArr.push(img);
								imgboxArr.push(imgbox);
							</script>
						</div>
						<div style="height:105px;">
							<div>
								<div style="color:#3A3A3A; font-size:0.9em;">${dto.p_name}</div>
								<hr style="margin:5px 0;"/>
								<div id="sale_${dto.p_code}">
									<del style="color:lightgray; font-size:0.8em;" id="oprice_${dto.p_code}"></del>&nbsp;
									<span style="color:red; font-size:0.7em;">${dto.p_sale}%</span><br/>
								</div>
								<strong style="font-size:1.1em;" id="aprice_${dto.p_code}"></strong>원
								<script>
									var sale = "${dto.p_sale}";
									if(sale == 0) 
										$("#sale_" + ${dto.p_code}).css("display", "none");
									var owon = "${dto.p_o_price}";
									var awon = "${dto.p_a_price}";
									owon = addComma(owon);
									awon = addComma(awon);
									$("#oprice_" + ${dto.p_code}).text(owon);
									$("#aprice_" + ${dto.p_code}).text(awon);
									
									function addComma(value) {
									    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
									    return value;
									}
								</script>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
</div>

<div style="height:120px;"></div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>

<script>
//이미지 리사이즈
function resizeIMG() {
	for(var i = 0; i < imgArr.length; i++) {
		var height = imgArr[i].height();
		if(height > 310) {
			imgboxArr[i].css("height", "310px");
		}
	}
}
</script>

</html>