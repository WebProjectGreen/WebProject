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
<title>cats&dogs</title>
</head>
<body>

<table class="table" style="text-align:center;">
	<thead>
		<tr class="thead-dark">
			<th style="width:15%;">주문일자</th>
			<th style="width:40%;">상품정보</th>
			<th style="width:10%;">수량</th>
			<th style="width:15%;">결제금액</th>
			<th style="width:10%;">배송상태</th>
			<th style="width:10%;">비고</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${result}" var="dto">
		<tr>
			<td>
				<div class="d-flex align-items-center" style="height:100px;">
					<div style="width:100%;">
						<span style="color:gray;">${dto.order_date}</span>
					</div>
				</div>
			</td>
			<td>
				<div class="d-flex align-items-center" style="height:100px; text-align:left;">
					<div style="background-color:black; height:100px; width:100px;">
						<img id="img_${dto.order_num}" width="100%" height="100%"/>
					</div>
					<div style="margin:0 20px 0;">
						<strong style="font-size:1.2em;" id="p_name_${dto.order_num}"></strong>
						<script>
							$.ajax({
								url: "orderlist_name?order_num=" + ${dto.order_num},
								type: "GET",
								success: function(data) {
									$("#p_name_" + ${dto.order_num}).text(data);
								}
							});
							$.ajax({
								url: "orderlist_img?order_num=" + ${dto.order_num},
								type: "GET",
								success: function(data) {
									$("#img_" + ${dto.order_num}).attr("src", "images/product/" + data);
								}
							});
						</script>
					</div>
				</div>
			</td>
			<td>
				<div class="d-flex align-items-center" style="height:100px;">
					<div style="width:100%;">
						<span id="stock_${dto.order_num}"></span>
						<script>
							$.ajax({
								url: "orderlist_stock?order_num=" + ${dto.order_num},
								type: "GET",
								success: function(data) {
									$("#stock_" + ${dto.order_num}).text(data);
								}
							});
						</script>
					</div>
				</div>
			</td>
			<td>
				<div class="d-flex align-items-center" style="height:100px;">
					<div style="width:100%;">
						<span id="total_${dto.order_num}"></span>원
						<script>
							var total = ${dto.order_total} + ${dto.order_delivery};
							total = addComma(String(total));
							$("#total_" + ${dto.order_num}).text(total);
						</script>
					</div>
				</div>
			</td>
			<td>
				<div class="d-flex align-items-center" style="height:100px;">
					<div style="width:100%;">
						${dto.order_state}
					</div>
				</div>
			</td>
			<td>
				<div class="d-flex align-items-center" style="height:100px;">
					<div style="width:100%;">
						<button class="btn btn-danger mb-1" style="display:none;" id="ordercomplete_${dto.order_num}" onclick="complete_code(${dto.order_num})" data-toggle="modal" data-target="#completeModal">
							구매확정
						</button>
						<button class="btn btn-outline-secondary" onclick="order_info(${dto.order_num})">주문정보</button>
					</div>
					<script>
						var state = "${dto.order_state}";
						if(state == "배송완료")
							$("#ordercomplete_" + ${dto.order_num}).css("display", "");
					</script>
				</div>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>