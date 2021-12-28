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
<title>cart_list</title>

</head>
<body>

<table class="table" style="text-align:center;">
	<thead>
		<tr class="thead-dark">
			<th style="width:10%;"><input type="checkbox" id="selectall" onclick="selectAll(this)"/>&nbsp;<label for="selectall">전체선택</label></th>
			<th style="width:60%;">상품정보</th>
			<th style="width:15%;">상품금액</th>
			<th style="width:15%;">배송비</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${result}" var="dto">
		<tr>
			<td>
				<div class="d-flex align-items-center" style="height:100px;">
					<div style="width:100%;">
						<input type="checkbox" id="checkbox" name="checkbox" value="${dto.p_code}" onchange="itemselect()" style="zoom:2.0; transform:translate(0%, 10%);"/>
					</div>
				</div>
			</td>
			<td>
				<div class="d-flex align-items-center" style="height:100px; text-align:left;">
					<div style="background-color:black; height:100px; width:100px;">
						<img id="img_${dto.p_code}" width="100%" height="100%"/>
						<script>
							$.ajax({
								url: "cartlist_img?p_code=" + ${dto.p_code},
								type: "GET",
								success: function(data) {
									$("#img_" + ${dto.p_code}).attr("src", "images/product/" + data);
								}
							});
						</script>
					</div>
					<div style="margin:0 20px 0;">
						<strong style="font-size:1.2em;">${dto.cart_name}</strong>
						<hr style="margin:5px 0;"/>
						<div style="font-size:0.9em;">
							구매수량 <span>${dto.cart_ea}</span>개
						</div>
					</div>
				</div>
			</td>
			<td>
				<div class="d-flex align-items-center" style="height:100px;">
					<div style="width:100%;">
						<span style="color:red; font-size:0.8em; display:none;" id="sale_${dto.p_code}">${dto.cart_sale}%</span>&nbsp;
						<span id="price_${dto.p_code}"></span>원
						<input type="text" id="input_price_${dto.p_code}" value="${dto.cart_price}" style="display:none;"/>
						<script>
							var sale = ${dto.cart_sale};
							if(!(sale == 0)) {
								$("#sale_" + ${dto.p_code}).css("display", "");
							}
							var price = "${dto.cart_price}";
							price =  addComma(price);
							$("#price_" + ${dto.p_code}).text(price);
						</script>
					</div>
				</div>
			</td>
			<td>
				<div class="d-flex align-items-center" style="height:100px;">
					<div style="width:100%;">
						<span id="delivery_${dto.p_code}"></span>원
						<input type="text" id="input_del_${dto.p_code}" value="${dto.cart_delivery}" style="display:none;"/>
						<script>
							var del = ${dto.cart_delivery};
							//가장 높은 배송비 선택
							if(delivery < del)
								delivery = del;
							del =  addComma(String(del));
							$("#delivery_" + ${dto.p_code}).text(del);
						</script>
					</div>
				</div>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<button class="btn btn-outline-danger" onclick="delete_cart()">선택 삭제</button>

<div style="border:3px solid lightgray; width:800px; height:100px; padding:25px; margin:20px auto; text-align:center;">
	<span style="color:gray;">총 상품가격&nbsp;&nbsp;<strong style="color:black; font-size:1.1em;" id="price">0</strong>&nbsp;원 +</span>
	<span style="color:gray;">총 배송비&nbsp;&nbsp;<strong style="color:black; font-size:1.1em;" id="delivery">0</strong>&nbsp;원 =</span>
	<span style="color:gray;">총 주문금액&nbsp;&nbsp;<strong style="color:red; font-size:1.5em;" id="total">0</strong>&nbsp;원</span>
</div>

</body>
</html>