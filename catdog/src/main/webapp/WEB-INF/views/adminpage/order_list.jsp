<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>order_list</title>
</head>
<body>

<div class="mb-3">
	<span style="font-size:0.9em;">전체 ${count_all}건 │ 주문대기 ${count_1}건 │ 발송대기 ${count_2}건 │ 배송중 ${count_3}건 │ 배송완료 ${count_4}건 │ 구매확정 ${count_5}건</span>
</div>

<table class="table table-bordered" style="text-align:center;">
	<thead>
		<tr class="thead-dark">
			<th style="width:15%;">주문일자</th>
			<th style="width:10%;">주문자</th>
			<th style="width:35%;">상품정보</th>
			<th style="width:10%;">수량</th>
			<th style="width:15%;">결제금액</th>
			<th style="width:15%;">배송상태</th>
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
				<div class="d-flex align-items-center" style="height:100px;">
					<div style="width:100%;">
						<span>${dto.user_id}</span>
					</div>
				</div>
			</td>
			<td>
				<div class="d-flex align-items-center" style="height:100px; text-align:left;">
					<div style="background-color:black; height:100px; width:100px;">
						<img id="img_${dto.order_num}" width="100%" height="100%"/>
					</div>
					<div style="margin:0 20px 0;">
						<button id="infobutton" onclick="order_info(${dto.order_num})">
							<span style="font-size:1.2em;" id="p_name_${dto.order_num}"></span>
						</button>
						<script>
							$.ajax({
								url: "../orderlist_name?order_num=" + ${dto.order_num},
								type: "GET",
								success: function(data) {
									$("#p_name_" + ${dto.order_num}).text(data);
								}
							});
							$.ajax({
								url: "../orderlist_img?order_num=" + ${dto.order_num},
								type: "GET",
								success: function(data) {
									$("#img_" + ${dto.order_num}).attr("src", "../images/product/" + data);
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
								url: "../orderlist_stock?order_num=" + ${dto.order_num},
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
						<div id="state_${dto.order_num}">
							<select name="state" id="order_state_${dto.order_num}">
								<option value="1">주문대기</option>
								<option value="2">발송대기</option>
								<option value="3">배송중</option>
								<option value="4">배송완료</option>
							</select>
							<input type="button" value="수정" onclick="state_update(${dto.order_num})"/>
						</div>
						<span id="complete_${dto.order_num}" style="display:none;">구매확정</span>
						<script>
							var state = "${dto.order_state}";
							if(state == "구매확정") {
								$("#state_" + ${dto.order_num}).css("display", "none");
								$("#complete_" + ${dto.order_num}).css("display", "");
							} else {
								if(state == "주문대기")
									state = "1";
								else if(state == "발송대기")
									state = "2";
								else if(state == "배송중")
									state = "3";
								else if(state == "배송완료")
									state = "4";
								$("#order_state_" + ${dto.order_num}).val(state).prop("selected", true);
							}
						</script>
					</div>
				</div>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>