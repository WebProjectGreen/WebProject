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
<title>상품목록</title>
</head>
<body>

<div class="d-flex justify-content-between mb-3">
	<div>
		<span style="font-size:0.9em;">전체 ${count.total}건 │ 의류/하네스 ${count.fashion}건 │ 이동/산책 ${count.walk}건 │ 사료/간식 ${count.food}건 │ 고양이 ${count.cat}건 │ 강아지 ${count.dog}건</span>
	</div>
	<div>
		<button class="btn btn-outline-danger" data-toggle="modal" data-target="#deleteModal">선택 삭제</button>
	</div>
</div>

<table class="table table-bordered" style="text-align:center;">
	<thead>
		<tr class="thead-dark">
			<th style="width:7%;"><input type="checkbox" onclick="selectAll(this)"/></th>
			<th style="width:10%">상품코드</th>
			<th style="width:25%">상품명</th>
			<th style="width:7%">상품분류</th>
			<th style="width:12%">판매가</th>
			<th style="width:5%">재고</th>
			<th style="width:5%">판매</th>
			<th>상품설명</th>
			<th style="width:10%">비고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${result}" var="dto">
			<tr>
			
				<!-- 체크박스 -->
				<td>
					<div class="d-flex align-items-center" style="height:100%;">
						<div style="width:100%;">
							<input type="checkbox" id="checkbox" name="checkbox" value="${dto.p_code}" style="zoom:2.0; transform:translate(0%, 10%);"/>
							<input type="text" id="mainimg_${dto.p_code}" value="${dto.p_mainimg}" style="display:none;" />
							<input type="text" id="subimg_${dto.p_code}" value="${dto.p_subimg}" style="display:none;" />
						</div>
					</div>
				</td>
				
				<!-- 상품코드 -->
				<td style="font-size:0.8em;">
					<div class="d-flex align-items-center" style="height:100%;">
						<div style="width:100%;">
							${dto.p_code}
						</div>
					</div>
				</td>
				
				<!-- 상품명 -->
				<td>
					<div class="d-flex justify-content-between" style="height:100%;">
						<div class="d-flex align-items-center">
							<div style="width:100px; height:100px;">
								<img src="../images/product/${dto.p_mainimg}" width="100%" height="100%"/>
							</div>
						</div>
						<div class="d-flex align-items-center" style="width:150px;">
							<div>
								${dto.p_name}
							</div>
						</div>
					</div>
					
				</td>
				
				<!-- 상품분류 -->
				<td>
					<div class="d-flex align-items-center" style="height:100%;">
						<div style="width:100%;">
							${dto.p_category}
						</div>
					</div>
				</td>
				
				<!-- 판매가 -->
				<td>
					<div class="d-flex align-items-center" style="height:100%;">
						<div style="width:100%;">
							<script>
								var code = "${dto.p_code}";
								var owon = "${dto.p_o_price}";
								var awon = "${dto.p_a_price}";
								owon = addComma(owon);
								awon = addComma(awon);
								
								$("#" + code).text(owon);
								$("#" + code + "r").text(awon);

								function addComma(value) {
								    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
								    return value; 
								}
							</script>
							<del style="color:lightgray; font-size:0.9em;" id="${dto.p_code}"></del>&nbsp;
							<span style="color:lightgray; font-size:0.8em;">${dto.p_sale}%</span><br/>
							<span id="${dto.p_code}r"></span>원
						</div>
					</div>
				</td>
				
				<!-- 재고량 -->
				<td>
					<div class="d-flex align-items-center" style="height:100%;">
						<div style="width:100%;">
							${dto.p_stock}
						</div>
					</div>
				</td>
				
				<!-- 판매량 -->
				<td>
					<div class="d-flex align-items-center" style="height:100%;">
						<div style="width:100%;">
							${dto.p_buy}
						</div>
					</div>
				</td>
				
				<!-- 상품설명 -->
				<td>
					<div class="d-flex align-items-center" style="height:100%;">
						<div style="width:100%;">
							${dto.p_content}
						</div>
					</div>
				</td>
				
				<!-- 비고 -->
				<td>
					<div class="d-flex align-items-center" style="height:100%;">
						<div style="width:100%;">
							<button onclick="p_update(${dto.p_code})" class="btn btn-outline-secondary">상품수정</button>
						</div>
					</div>
				</td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>

<div style="margin:20px auto 0;" class="d-flex justify-content-center">
	<div style="margin:0 10px 0 0;">
		<button id="prev2" class="btn btn-secondary" style="display:none;" onclick="pageprev_end()">&lt;&lt;</button>
	</div>
	<div>
		<button id="prev1" class="btn btn-secondary" style="display:none;" onclick="pageprev()">&lt;</button>
	</div>
	<div class="align-self-center">
		<ul id="pagebutton">
		</ul>
	</div>
	<div>
		<button id="next1" class="btn btn-secondary" style="display:none;" onclick="pagenext()">&gt;</button>
	</div>
	<div style="margin:0 0 0 10px;">
		<button id="next2" class="btn btn-secondary" style="display:none;" onclick="pagenext_end()">&gt;&gt;</button>
	</div>
</div>

</body>

<script>
$(document).ready(function(){
	var currentPage = ${page.cri.pageNum};
	$("#pageValue").val(currentPage);
	
	if(${page.prev}) {
		$("#prev1").css("display", "inline");
		$("#prev2").css("display", "inline");
	}
	if(${page.next}) {
		$("#next1").css("display", "inline");
		$("#next2").css("display", "inline");
	}
	
	var start = ${page.startPage};
	var end = ${page.endPage};
	for(var i = start; i <= end; i++) {
		$("#pagebutton").append("<li><button id='page" + i + "' onclick='pageview(" + i + ")'>" + "&nbsp;" + i + "&nbsp;" + "</button></li>");
	}
	
	$("#page" + currentPage).prop("disabled", true);
	$("#page" + currentPage).css("color", "lightgray");
});

//다음페이지
function pagenext() {
	var end = ${page.endPage};
	$("#pageValue").val(end+1);
	$.ajax({
		url: "pm/list_page",
		type: "POST",
		data: $("#product_search").serialize(),
		success: function(data) {
			$("#product_list").html(data);
		}
	});
}
//이전페이지
function pageprev() {
	var start = ${page.startPage};
	$("#pageValue").val(start-1);
	$.ajax({
		url: "pm/list_page",
		type: "POST",
		data: $("#product_search").serialize(),
		success: function(data) {
			$("#product_list").html(data);
		}
	});
}
//맨 마지막 페이지
function pagenext_end() {
	var end = ${page.realEnd};
	$("#pageValue").val(end);
	$.ajax({
		url: "pm/list_page",
		type: "POST",
		data: $("#product_search").serialize(),
		success: function(data) {
			$("#product_list").html(data);
		}
	});
}
//맨 처음 페이지
function pageprev_end() {
	$("#pageValue").val(1);
	$.ajax({
		url: "pm/list_page",
		type: "POST",
		data: $("#product_search").serialize(),
		success: function(data) {
			$("#product_list").html(data);
		}
	});
}
</script>
</html>