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

<link href="<c:url value='/resources/style/main.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_header.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_footer.css'/>" rel='stylesheet' type='text/css'>

<sec:csrfMetaTags/>

<style>
#td1 {
	width:30%;
	height:50px;
	background-color:#F3F3F3;
	text-align:right;
	padding:0 10px 0 0;
}
#td2 {
	padding:0 0 0 10px;
}
#td3 {
	width:20%;
	height:50px;
	background-color:#F3F3F3;
	text-align:right;
	padding:0 10px 0 0;
}
</style>

</head>
<body>

<div style="margin:40px auto 20px; width:900px;">
	<p style="text-align:center; font-size:1.5em;">회원관리</p>
	<hr style="margin:10px 0 20px;"/>
	<div class="d-flex">
		<div style="width:50%; padding:20px; border-right:1px solid lightgray;">
			<div style="text-align:center; margin:0 0 10px;">
				<span style="color:gray; font-size:1.1em;">회원정보 수정</span>
			</div>
			<form id="form_update">
				<table style="width:100%;">
					<tbody>
						<tr>
							<td id="td1">
								새 이메일
							</td>
							<td id="td2">
								<div class="d-flex align-items-center" style="height:100%;">
									<input type="email" id="email" style="width:210px;"/>&nbsp;
									<button id="mail_check" class="btn btn-secondary">인증</button>
								</div>
								<div style="font-size:0.8em; color:gray;">현재이메일 ${userinfo.user_email}</div>
							</td>
						</tr>
						<tr id="emailcode" style="display:none;">
							<td id="td1">
							</td>
							<td id="td2">
								<div class="d-flex align-items-center" style="height:100%;">
									<input type="text" id="email_verify" placeholder="인증번호" style="width:5em;"/>&nbsp;
									<button class="btn btn-danger" id="mail_verify_check" style="height:30px; font-size:0.7em;">확인</button>
								</div>
							</td>
						</tr>
						<tr>
							<td id="td1">
								이름
							</td>
							<td id="td2">
								<div class="d-flex align-items-center" style="height:100%;">
									<input type="text" name="user_name" value="${userinfo.user_name}" style="width:100px;"/>
								</div>
							</td>
						</tr>
						<tr>
							<td id="td1">
								생일
							</td>
							<td id="td2">
								<div class="d-flex align-items-center" style="height:100%;">
									<select style="width:4em;" name="year" id="year">
							      		<option value="0000" selected>선택</option>
							        	<option value="1990">1990</option>
							        	<option value="1991">1991</option>
							        	<option value="1992">1992</option>
							       		<option value="1993">1993</option>
							       		<option value="1994">1994</option>
							        	<option value="1995">1995</option>
							        	<option value="1996">1996</option>
							        	<option value="1997">1997</option>
							        	<option value="1998">1998</option>
							        	<option value="1999">1999</option>
							        	<option value="2000">2000</option>
							     	 </select>년&nbsp;
							      
									<select style="width:4em;" name="month" id="month">
										<option value="00" selected>선택</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>월&nbsp;
							      
							      <select style="width:4em;" name="day" id="day">
										<option value="00" selected>선택</option>
							       	 	<option value="01">1</option>
							        	<option value="02">2</option>
							        	<option value="03">3</option>
							        	<option value="04">4</option>
							        	<option value="05">5</option>
							        	<option value="06">6</option>
							        	<option value="07">7</option>
							       		<option value="08">8</option>
							        	<option value="09">9</option>
							        	<option value="10">10</option>
							        	<option value="11">11</option>
							        	<option value="12">12</option>
							        	<option value="13">13</option>
							        	<option value="14">14</option>
							        	<option value="15">15</option>
							        	<option value="16">16</option>
							        	<option value="17">17</option>
							        	<option value="18">18</option>
							        	<option value="19">19</option>
							        	<option value="20">20</option>
							        	<option value="21">21</option>
							        	<option value="22">22</option>
							        	<option value="23">23</option>
							        	<option value="24">24</option>
							        	<option value="25">25</option>
							       		<option value="26">26</option>
							        	<option value="27">27</option>
							        	<option value="28">28</option>
							        	<option value="29">29</option>
							        	<option value="30">30</option>
							        	<option value="31">31</option>
							      </select>일
								</div>
							</td>
						</tr>
						<tr>
							<td id="td1">
								성별
							</td>
							<td id="td2">
								<div class="d-flex align-items-center" style="height:100%; padding:6px 0 0;">
									<label for="man">남자</label>&nbsp;
								    <input type="radio" name="user_sex" value="m" id="man">&nbsp;&nbsp;
								    <label for="woman">여자</label>&nbsp;
								    <input type="radio" name="user_sex" value="w" id="woman">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			<div class="d-flex justify-content-center" style="margin:10px 0 0;">
				<button type="submit" class="btn btn-info" style="width:80px;">수정</button>
			</div>
			</form>
		</div>
		<div style="width:50%; padding:20px;">
			<div style="text-align:center; margin:0 0 10px;">
				<span style="color:gray; font-size:1.1em;">비밀번호 수정</span>
			</div>
			<form id="form_pw_change" onsubmit="return false">
				<table style="width:100%;">
					<tbody>
						<tr>
							<td id="td1" style="width:40%;">
								새 비밀번호
							</td>
							<td id="td2">
								<div class="d-flex align-items-center" style="height:100%;">
									<input type="password" name="user_pw" id="pw" style="width:100%;"/>
								</div>
							</td>
						</tr>
						<tr>
							<td id="td1" style="width:40%;">
								새 비밀번호 확인
							</td>
							<td id="td2">
								<div class="d-flex align-items-center" style="height:100%;">
									<input type="password" id="pw_verity" style="width:100%;"/>
								</div>
								<div id="verity" style="width:100%; font-size:0.8em; margin:0 0 10px;"></div>
							</td>
						</tr>
					</tbody>
				</table>
			<div class="d-flex justify-content-center" style="margin:10px 0 0;">
				<button type="submit" class="btn btn-danger" style="width:80px;">수정</button>
			</div>
			</form>
		</div>
	</div>
	<div style="margin:40px 0 120px;">
		<p style="text-align:center; font-size:1.5em;">배송지수정</p>
		<hr style="margin:10px 0 20px;"/>
		<div style="border:1px solid lightgray; padding:20px 20px 10px;">
			<div class="d-flex align-items-center">
				<span style="font-size:1.5em;">받는사람정보</span>&nbsp;&nbsp;<button class="btn btn-secondary" onclick="addressAPI()">배송지 찾기</button>
			</div>
			
			<div style="margin:10px 0;">
				<form id="saveAddress">
					<table style="width:100%;">
						<tbody>
							<tr>
								<td id="td3">
									받는이
								</td>
								<td id="td2">
									<div class="d-flex align-items-center" style="height:100%;">
										<input type="text" id="to" name="address_to" value="${addressinfo.address_to}" style="width:100px;"/>
									</div>
								</td>
							</tr>
							<tr>
								<td id="td3">
									우편번호
								</td>
								<td id="td2">
									<div class="d-flex align-items-center" style="height:100%;">
										<input type="text" name="zip_code" value="${addressinfo.zip_code}" id="zipcode" style="width:4em;"/>
									</div>
								</td>
							</tr>
							<tr>
								<td id="td3">
									주소
								</td>
								<td id="td2">
									<div class="d-flex align-items-center" style="height:100%;">
										<input type="text" name="address_main" value="${addressinfo.address_main}" id="mainAddress" style="width:100%;"/>
									</div>
								</td>
							</tr>
							<tr>
								<td id="td3">
									상세주소
								</td>
								<td id="td2">
									<div class="d-flex align-items-center" style="height:100%;">
										<input type="text" name="address_sub" value="${addressinfo.address_sub}" id="extraAddress" style="width:80%;"/>
									</div>
								</td>
							</tr>
							<tr>
								<td id="td3">
									배송메세지
								</td>
								<td id="td2">
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
		<div class="d-flex justify-content-center" style="margin:10px 0 0;">
			<button class="btn btn-info" onclick="saveAddress()" style="width:80px;">저장</button>
		</div>
	</div>
</div>

</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var code;
var email;
var pwPass;

$(document).ready(function(){
	var year = "${year}";
	var month = "${month}";
	var day = "${day}";
	var user_sex = "${userinfo.user_sex}";
	
	$("#year").val(year).prop("selected", true);
	$("#month").val(month).prop("selected", true);
	$("#day").val(day).prop("selected", true);
	
	if(user_sex == "m")
		$("#man").prop("checked", true);
	else if(user_sex == "w")
		$("#woman").prop("checked", true);
	
	//메일 인증 스크립트
	$("#mail_check").click(function(e){
		e.preventDefault();
		email = $("#email").val();
		
		$.ajax({
			url: "mailverifyCheck?email=" + email,
			type: "GET",
			success:function(data){
				if(data == 1) {
					alert("이미 사용중인 메일입니다.");
				} else {
					alert("인증 메일이 발송되었습니다.\n (서버 상황에 따라 지연될 수도 있습니다.)");
					$("#emailcode").css("display", "");
					$.ajax({
						url: "mailCheck?email=" + email,
						type: "GET",
						success:function(data){
							$("#mail_check").attr("disabled", true);
							code = data;
						}
					});
				}
			}
		});
	});
	
	$("#mail_verify_check").click(function(e){
		e.preventDefault();
		var ENum = $("#email_verify").val();
		if(code == ENum) {
			$.ajax({
				url: "update_email?email=" + email,
				type: "GET",
				success: function(data) {
					alert("이메일을 성공적으로 변경하였습니다.");
					window.location.reload();
				},
				error: function(request,status,error) {
					alert("error");
				}
			});
		} else {
			alert("인증번호가 일치하지 않습니다.");
		}
	});
	
	//비밀번호 감지 스크립트
	$("#pw_verity").keyup(function(){
		var p1 = document.getElementById('pw').value;
		var p2 = document.getElementById('pw_verity').value;
		if(p1 != p2) {
			$("#verity").text("비밀번호가 일치 하지 않습니다.");
			$("#verity").css("color", "red");
			pwPass = 0;
		} else {
			$("#verity").text("비밀번호가 일치 합니다.");
			$("#verity").css("color", "green");
			pwPass = 1;
		}
		if(p1 == "") {
			$("#verity").text("");
			pwPass = 0;
		}
	});
	
	$("#pw").keyup(function(){
		var p1 = document.getElementById('pw').value;
		var p2 = document.getElementById('pw_verity').value;
		if(p2 != "") {
			if(p1 != p2) {
				$("#verity").text("비밀번호가 일치 하지 않습니다.");
				$("#verity").css("color", "red");
				pwPass = 0;
			} else {
				$("#verity").text("비밀번호가 일치 합니다.");
				$("#verity").css("color", "green");
				pwPass = 1;
			}
		} else {
			$("#verity").text("");
		}
	});
		
	//비밀번호 변경
	$("#form_pw_change").submit(function(e){
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		e.preventDefault();
		if(pwPass == 1) {
			$.ajax({
				url: "pw_chg_submit",
				type: "POST",
				data: $("#form_pw_change").serialize(),
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken);
				},
				success: function(data){
					console.log("result : " + data);
					alert("비밀번호 변경이 완료되었습니다.");
					window.location.reload();
				},
				error: function(data){
					alert("error");
				}
			});
		} else {
			alert("비밀번호가 일치하지 않습니다.");
		}
	});
	
	////회원정보 수정
	$("#form_update").submit(function(e){
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		e.preventDefault();
		$.ajax({
			url: "user_update", //signup_submit
			type: "POST",
			data: $("#form_update").serialize(),
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success: function(data){
				console.log("result : " + data);
				alert("회원정보수정이 완료되었습니다.");
				window.location.reload();
			},
			error: function(data){
				alert("error");
			}
		});
	});
	
});

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

//배송지 저장
function saveAddress() {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	$.ajax({
		url: "saveAddress",
		type: "POST",
		data: $("#saveAddress").serialize(),
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		success: function(data) {
			alert("배송지 저장 완료했습니다.");
			window.location.reload();
		},
		error: function(request,status,error) {
			alert("잘못된 입력이거나 공백이 존재합니다.");
		}
	});
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