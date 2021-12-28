<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품수정목록</title>

<style>
#prp_form input, #p_category {
	display:inline-block;
	width:150px;
}
#prp_form label {
	margin:0 30px 0 0;
}
#formbox1 {
	width:350px;
	margin:0 0 10px;
}
#formbox2 {
	width:170px;
	padding:5px 0 0;
	text-align:right;
}
#formbox3 {
	width:180px;
	text-align:left;
}
</style>

</head>
<body>

<div style="width:100%; padding:20px; text-align:center;">
	<h2 id="prp_h2">상품수정</h2>
	<hr style="margin:20px 0;"/>
	<form action="p_update_submit?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data" id="prp_form">
		<div class="d-flex justify-content-between" id="formbox1">
			<div id="formbox2">
				<label for="p_category">상품 카테고리</label>
			</div>
			<div id="formbox3">
				<select class="form-control" name="p_category" id="p_category">
		        	<option value="fashion">의류/하네스</option>
		        	<option value="walk">이동/산책</option>
		        	<option value="food">사료/간식</option>
		       		<option value="cat">고양이</option>
		       		<option value="dog">강아지</option>
				</select>
				<input type="text" id="Get_category" value="${dto.p_category}" style="display:none;"/>
				<script>
					var category = $("#Get_category").val();
					console.log(category);
					if(category == "fashion")
						$("#p_category").val("fashion").prop("selected", true);
					else if(category == "walk")
						$("#p_category").val("walk").prop("selected", true);
					else if(category == "food")
						$("#p_category").val("food").prop("selected", true);
					else if(category == "cat")
						$("#p_category").val("cat").prop("selected", true);
					else if(category == "dog")
						$("#p_category").val("dog").prop("selected", true);
				</script>
			</div>
		</div>
		<div class="d-flex justify-content-between" id="formbox1">
			<div id="formbox2">
				<label for="p_name">상품 이름</label>
			</div>
			<div id="formbox3">
				<input type="text" name="p_name" id="p_name" class="form-control" style="width:280px;" value="${dto.p_name}"/>
			</div>
		</div>
		<div class="d-flex justify-content-between" id="formbox1">
			<div id="formbox2">
				<label for="p_price">상품 가격</label>
			</div>
			<div id="formbox3">
				<input type="text" name="p_price" id="p_price" class="form-control" value="${dto.p_o_price}"/>&nbsp;원
			</div>
		</div>
		<div class="d-flex justify-content-between" id="formbox1">
			<div id="formbox2">
				<label for="p_delivery">상품 배송비</label>
			</div>
			<div id="formbox3">
				<input type="text" name="p_delivery" id="p_delivery" class="form-control" value="${dto.p_delivery}"/>&nbsp;원
			</div>
		</div>
		<div class="d-flex justify-content-between" id="formbox1">
			<div id="formbox2">
				<label for="p_sale">상품 할인율</label>
			</div>
			<div id="formbox3">
				<input type="text" name="p_sale" id="p_sale" class="form-control" value="${dto.p_sale}"/>&nbsp;%
			</div>
		</div>
		<div class="d-flex justify-content-between" id="formbox1">
			<div id="formbox2">
				<label for="p_stock">상품 재고수</label>
			</div>
			<div id="formbox3">
				<input type="text" name="p_stock" id="p_stock" class="form-control" value="${dto.p_stock}"/>&nbsp;개
			</div>
		</div>
		<div class="d-flex justify-content-between" id="formbox1">
			<div id="formbox2">
				<label for="p_content">상품 설명</label>
			</div>
			<div id="formbox3">
				<textarea rows="5" cols="35" name="p_content" id="p_content" >${dto.p_content}</textarea>
			</div>
		</div>
		<div class="d-flex justify-content-between" id="formbox1">
			<div id="formbox2">
				<label for="p_mainimg">썸네일 사진 변경</label>
			</div>
			<div id="formbox3">
				<input type="file" name="p_mainimg" id="p_mainimg" style="width:300px;"/>
			</div>
		</div>
		<div class="d-flex justify-content-between" id="formbox1">
			<div id="formbox2">
				<label for="p_subimg">상세설명 사진 변경</label>
			</div>
			<div id="formbox3">
				<input type="file" name="p_subimg" id="p_subimg" style="width:300px;"/>
			</div>
		</div>
		<div style="width:100px; margin:40px auto 0;">
			<input type="submit" class="btn btn-outline-secondary" value="수정" style="width:100px; border-radius:20px;"/>
		</div>
		
		<input type="text" name="p_code" value="${dto.p_code}" style="display:none;">
		<input type="text" name="p_old_mainimg" value="${dto.p_mainimg}" style="display:none;">
		<input type="text" name="p_old_subimg" value="${dto.p_subimg}" style="display:none;">
	</form>
	
</div>

</body>

</html>