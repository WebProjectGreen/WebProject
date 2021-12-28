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
<link href="style/fixzone.css" rel="stylesheet" type="text/css">
<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">

<sec:csrfMetaTags/>

<style>
#td1 {
	width:20%;
	background-color:#F3F3F3;
	text-align:right;
}
#td2 {
	color:gray;
}
#td3 {
	width:20%;
	height:50px;
	background-color:#F3F3F3;
	text-align:right;
	padding:0 10px 0 0;
}
#td4 {
	padding:0 0 0 10px;
}
</style>

<script>
var p_code = [];
var order_price = [];
var order_stock = [];
var total = 0;
var delivery = 0;

function addComma(value) {
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value;
}
</script>

<sec:csrfInput/>

</head>
<body onload="calculate()">

<!-- 우측 배너 -->
<%@ include file="fixzone.jsp" %>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="header.jsp" %>
	
	<div style="margin:40px auto 120px; width:900px;">
		<p style="text-align:center; font-size:1.5em;">주문/결제</p>
		<hr style="margin:10px 0 20px;"/>
		<div style="border:1px solid lightgray; padding:20px 20px 10px;">
			<div class="d-flex align-items-center">
				<span style="font-size:1.5em;">받는사람정보</span>&nbsp;&nbsp;
				<button class="btn btn-secondary" onclick="addressAPI()">배송지 찾기</button>
				<div class="ml-auto">
					<label for="addresschk">기본 배송지</label>&nbsp;<input type="checkbox" id="addresschk" checked/>
				</div>
			</div>
			
			<div style="margin:10px 0;">
				<form id="saveAddress">
					<table style="width:100%;">
						<tbody>
							<tr>
								<td id="td3">
									받는이
								</td>
								<td id="td4">
									<div class="d-flex align-items-center" style="height:100%;">
										<input type="text" id="to" name="address_to" value="${addressinfo.address_to}" style="width:100px;"/>
									</div>
								</td>
							</tr>
							<tr>
								<td id="td3">
									우편번호
								</td>
								<td id="td4">
									<div class="d-flex align-items-center" style="height:100%;">
										<input type="text" name="zip_code" value="${addressinfo.zip_code}" id="zipcode" style="width:4em;"/>
									</div>
								</td>
							</tr>
							<tr>
								<td id="td3">
									주소
								</td>
								<td id="td4">
									<div class="d-flex align-items-center" style="height:100%;">
										<input type="text" name="address_main" value="${addressinfo.address_main}" id="mainAddress" style="width:100%;"/>
									</div>
								</td>
							</tr>
							<tr>
								<td id="td3">
									상세주소
								</td>
								<td id="td4">
									<div class="d-flex align-items-center" style="height:100%;">
										<input type="text" name="address_sub" value="${addressinfo.address_sub}" id="extraAddress" style="width:80%;"/>
									</div>
								</td>
							</tr>
							<tr>
								<td id="td3">
									배송메세지
								</td>
								<td id="td4">
									<select id="maselect" onchange="presetAddress()" style="width:200px;">
										<option value="mes1">문 앞에 두고가주세요.</option>
										<option value="mes2">경비실에 맡겨주세요.</option>
										<option value="mes3">배송 전 연락 바랍니다.</option>
										<option value="mes4">택배함에 넣어주세요.</option>
										<option value="self" selected>직접입력</option>
									</select>
									<div class="d-flex align-items-center" style="height:100%; margin:5px 0 0;">
										<input type="text" name="message" value="${addressinfo.message}" id="message" style="width:80%;"/>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		
		<div style="margin:20px 0;">
			<table class="table" style="text-align:center;">
				<tbody>
					<c:forEach items="${result}" var="dto">
						<tr>
							<td style="width:60%;">
								<div class="d-flex align-items-center" style="height:70px; text-align:left;">
									<div style="background-color:black; height:70px; width:70px;">
										<img src="images/product/${IMGlink}" width="100%" height="100%"/>
									</div>
									<div style="margin:0 20px 0;">
										<strong style="font-size:1.2em;">${dto.cart_name}</strong>
									</div>
								</div>
							</td>
							<td style="width:15%;">
								<div class="d-flex align-items-center" style="height:70px;">
									<div style="width:100%; text-align:right;">
										${dto.cart_ea}개
									</div>
								</div>
							</td>
							<td style="width:25%;">
								<div class="d-flex align-items-center" style="height:70px;">
									<div style="width:100%; text-align:right;">
										<span style="font-size:0.8em; color:red;" id="sale_${dto.p_code}">${dto.cart_sale}%</span>
										&nbsp;&nbsp;&nbsp;<span id="iprice_${dto.p_code}"></span>원
										<script>
											//상품 배열추가
											p_code.push("${dto.p_code}");
											order_price.push("${dto.cart_price}");
											order_stock.push("${dto.cart_ea}");
											//상품가격 콤마
											var price = ${dto.cart_price};
											total += price;
											price = addComma(String(price));
											$("#iprice_" + ${dto.p_code}).text(price);
											
											//가장 높은 배송비 선택
											var del = ${dto.cart_delivery};
											if(delivery < del)
												delivery = del;
											
											//세일 표기 여부
											var sale = ${dto.cart_sale};
											if(sale == 0)
												$("#sale_" + ${dto.p_code}).css("display", "none");
										</script>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div style="border:1px solid lightgray; padding:20px 20px 10px;">
			<div class="d-flex align-items-center">
				<span style="font-size:1.5em;">결제정보</span>
			</div>
			
			<div style="margin:10px 0;">
				<table class="table">
					<tbody>
						<tr>
							<td id="td1">
								총상품가격
							</td>
							<td id="td2">
								<span id="itemtotal"></span>원
							</td>
						</tr>
						<tr>
							<td id="td1">
								배송비
							</td>
							<td id="td2">
								<span id="deltotal"></span>원&nbsp;&nbsp;&nbsp;
								<span id="delevent" style="font-size:0.9em; color:red; display:none;">5만원 이상 구매 배송비 무료</span>
							</td>
						</tr>
						<tr>
							<td id="td1">
								총결제금액
							</td>
							<td style="font-size:1.2em; color:black;">
								<span id="fulltotal"></span>원
							</td>
						</tr>
						<tr>
							<td id="td1">
								결제수단
							</td>
							<td>
								<input type="radio" name="orderby" value="bankbook" checked>&nbsp;무통장입금<br/>
								<div id="orderby" style="margin:20px 0 0;">
									<span style="font-size:1.3em;">농협은행 123-4567-8912-34</span> 예금주 : 홍길동<br/>
									<span style="color:gray; font-size:0.8em">*정확한 입금을 위해 한번 더 확인해주세요.</span><br/><br/>
									입금자명&nbsp;<input type="text" id="bankname" placeholder="입금자명" style="width:6em;"/>&nbsp;&nbsp;
									<span style="color:red; font-size:0.8em">입금자명을 잘못 입력하면 결제에 문제가 생길 수도 있습니다.</span><br/><br/>
									<input type="checkbox" id="orderpass"/>&nbsp;<label for="orderpass" style="font-size:0.8em; color:gray;">구매조건 확인 및 결제대행 서비스 약관 동의</label>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div style="margin:20px auto 0; width:100px;">
			<button class="btn btn-danger" id="ordersubmit" style="width:120px; height:50px; font-size:1.2em;" disabled>결제하기</button>
		</div>	
	</div>
	
</div>

<!-- FOOTER -->
<%@ include file="footer.jsp" %>

</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	$("#orderpass").change(function(){
		if($("#orderpass").is(":checked")){
			$("#ordersubmit").attr("disabled", false);
		} else {
			$("#ordersubmit").attr("disabled", true);
		}
	});
	
	//결제하기
	$("#ordersubmit").click(function(){
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		
		var to = $("#to").val();
		var zipcode = $("#zipcode").val();
		var mainAddress = $("#mainAddress").val();
		var extraAddress = $("#extraAddress").val();
		var message = $("#message").val();
		var bankname = $("#bankname").val();
		var order_address = zipcode + " " + mainAddress + " " + extraAddress;
		if(to != "" && zipcode != "" && mainAddress != "" && extraAddress != "") {
			if($("#bankname").val() != "") {		
				if($("#addresschk").is(":checked")) {
					$.ajax({
						url: "saveAddress",
						type: "POST",
						data: $("#saveAddress").serialize(),
						beforeSend: function(xhr) {
							xhr.setRequestHeader(csrfHeader, csrfToken);
						},
						error: function() {
							alert("잘못된 배송지 입력입니다.");
						}
					});
				}
				
				$.ajax({
					url: "order_submit",
					dataType: "json",
					type: "POST",
					data: {
						"order_to" : to,
						"order_address" : order_address,
						"order_message" : message,
						"order_delivery" : delivery,
						"order_total" : total,
						"order_bankname" : bankname,
						"p_code" : p_code,
						"order_price" : order_price,
						"order_stock" : order_stock
					},
					beforeSend: function(xhr) {
						xhr.setRequestHeader(csrfHeader, csrfToken);
					},
					success: function(data) {
						window.location.replace("item_payment_complete");
					},
					error: function(jqXHR, textStatus, errorThrown) {
						alert("에러" + textStatus + " : " + errorThrown);
					}
				});
				
			} else {
				alert("입금자명을 입력해주세요.");
				$("#bankname").focus();
			}
		} else {
			alert("배송지를 입력해주세요.");
		}
	});
});

//금액 계산
function calculate() {
	console.log(p_code);
	console.log(order_price);
	console.log(order_stock);
	//5만원이상 배송비 무료
	if(total >= 50000) {
		delivery = 0;
		$("#delevent").css("display", "");
	}
	var full = total + delivery;
	var str1 = addComma(String(total));
	var str2 = addComma(String(delivery));
	var str3 = addComma(String(full));
	$("#itemtotal").text(str1);
	$("#deltotal").text(str2);
	$("#fulltotal").text(str3);
}

//배송 메세지
function presetAddress() {
	var result = $("#maselect option:selected").val();
	if(result == "mes1")
		$("#message").val("문 앞에 두고가주세요.");
	else if(result == "mes2")
		$("#message").val("경비실에 맡겨주세요.");
	else if(result == "mes3")
		$("#message").val("배송 전 연락 바랍니다.");
	else if(result == "mes4")
		$("#message").val("택배함에 넣어주세요.");
	else if(result == "self")
		$("#message").val("");
		$("#message").focus();
}

function addressAPI() {
	
    new daum.Postcode({
        oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }
            
            $("#saveAddress").prop("checked", false);
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("mainAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("extraAddress").focus();
        }
    }).open();
}
</script>

</html>