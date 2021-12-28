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
<!--RWD first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="style/main.css" rel="stylesheet" type="text/css">
<title>remove</title>

<link href="<c:url value='/resources/style/fixzone.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_header.css'/>" rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/style/home_footer.css'/>" rel='stylesheet' type='text/css'>

</head>

<style>
ul, li{list-style:none; margin:0; padding:0}
.text_ul_wrap{margin:0 auto; width:800px; margin-top: 100px; position: relative; border:1px solid #000; text-align: left;}
.text_ul_wrap a{color:#000; line-height: 34px; display: block; padding: 0 20px 0 10px; text-decoration:none}
.select_icon{display: block; content: ''; clear: both; position:absolute; right:10px; top:12px; width: 0; height:0; border-left:6px solid transparent; border-right:6px solid transparent; border-top:12px solid #000; border-bottom:none;}
.select_icon.active{border-bottom:12px solid #000; border-top:none;   }
.ul_select_style{position: absolute; width: 800px; left: -1px; display: none; background-color:white;}
.ul_select_style.active{display: block}
.ul_select_style li{line-height: 34px; border: 1px solid #000; text-align: left; padding-left: 10px; cursor: pointer;}
.ul_select_style li + li{border-top:none;}
.ul_select_style li:hover{background: rgba(0,0,0,0.2)}

.background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.3);

        /* 숨기기 */
        z-index: -1;
        opacity: 0;
}
#show {
	border:1px solid #7676A7;
	position: absolute;left:50%; transform:translateX(-50%);
	background-color:#7676A7;
	color:white;
	width:150px;
	height:50px;
	font-size:20px;
	border-radius:30px; 
	margin-top:30px;
}
#close {
	border: none; 
	background: none; 
	background-color:#F9F9F9;
	border:2px solid #535378;
	color:#535378;
	opacity:70%;
	width:150px;
	height:50px;
	font-size:20px;
	border-radius:0px 30px 30px 0px; 
	margin-top:30px;
}
#close:hover {
	background-color:#EAEAEA;
}
#close2 {
	border:1px solid #7676A7;
	background-color:#7676A7;
	color:white;
	width:150px;
	height:50px;
	font-size:20px;
	border-radius:30px 0px 0px 30px; 
	margin-top:30px;
}
#close2:hover {
	background-color:#34344C;
}
    .show { opacity: 1; z-index: 1000; transition: all 0.5s; }
	
    .window { position: relative; width: 100%; height: 100%; }

    .popup {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #ffffff;
      width:580px;
      height:350px;
      /* 초기에 약간 아래에 배치 */
      transform: translate(-50%, -40%);
}
	.show .popup { transform: translate(-50%, -50%); transition: all 0.5s; }
}


body {margin: 10px;}
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
}

.checks {position: relative;}

.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0
}
.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
  content: ' ';
  display: inline-block;
  width: 18px;  /* 체크박스의 너비를 지정 */
  height: 18px;  /* 체크박스의 높이를 지정 */
  line-height: 18px; /* 세로정렬을 위해 높이값과 일치 */
  text-align: center; 
  vertical-align: middle;
  border: 1px solid #535378;
}
.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ 
  content: '\2714';  /* 체크표시 유니코드 사용 */
  border-color: #535378;
}
.checks.etrans input[type="checkbox"] + label {
  padding-left:20px;
}
.checks.etrans input[type="checkbox"] + label:before {
  position: absolute;
  left: 0;
  top: 0;
  margin-top: 0;
  opacity: .6;
  box-shadow: none;
  border-color: #535378;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}
.checks.etrans {
	margin-top:-5px;
	padding:0px;
}
.checks.etrans input[type="checkbox"]:checked + label:before {
  position: absolute;
  content: "";
  width: 10px;
  top: -5px;
  left: 5px;
  border-color:transparent #535378 #535378 transparent;
  -ms-transform:rotate(45deg);
  -webkit-transform:rotate(45deg);
  transform:rotate(45deg);
}
</style>
    
<body>

<!-- 우측 배너 -->
<%@ include file="../fixzone.jsp" %>

<div id="wrap" style="margin-bottom:200px;">
    <!-- HEADER -->
    <%@ include file="../header.jsp" %>

		<div style="height:100px;">
			<p id="remove0" style=" position: absolute;left: 50%;transform: translateX(-50%); font-size:40px; color:#535378; margin-top:30px;">회원탈퇴</p>
		</div>

		<div class="text_ul_wrap" style="margin-bottom:50px; margin-top:30px;">
			
  			<a>탈퇴하시는 이유를 선택하여 주세요</a>
			<ul class="ul_select_style">
    		<li>이용에 불편함이 있음</li>
    		<li>사용빈도가 낮음</li>
    		<li>상품 품질에 불만</li>
  			</ul>
		</div>

		<div style="margin-left:220px; margin-top:20px;">
			
			<div>
				<p>회원 탈퇴 시 이미 결제된 주문은 취소/환불 되지 않으며, 탈퇴 후 관련 정보가 파기되므로, 신중한 탈퇴를 부탁드립니다.<br/>
					관련하여 문의 사항이 있으시다면 상담을 요청해주세요.</p>
			</div>
			
			<strong style="margin:0px; padding:0px;">회원 탈퇴 안내</strong><br/>	
			<textarea disabled readonly style="width:900px; height:160px; resize: none; background-color:white;">
	[회원탈퇴 약관]

	회원탈퇴 신청 전 안내 사항을 확인 해 주세요.
	회원탈퇴를 신청하시면 현재 로그인 된 아이디는 사용하실 수 없습니다.
	회원탈퇴를 하더라도, 서비스 약관 및 개인정보 취급방침 동의하에 따라 일정 기간동안 회원 개인정보를 보관합니다.

	- 주문 정보
	- 상품 구입 및 대금 결제에 관한 기록
	- 상품 배송에 관한 기록
	- 소비자 불만 또는 처리 과정에 관한 기록
	- 게시판 작성 및 사용후기에 관한 기록

	※ 상세한 내용은 사이트 내 개인정보 취급방침을 참고 해 주세요.
			</textarea>
			<div class="checks etrans">
				 <input type="checkbox" id="ex_chk1" name="pointCheck"> 
  				<label style="cursor:pointer; user-select: none; font-size:15px;"  for="ex_chk1">회원 탈퇴 안내에 동의합니다.</label> 
			</div>
			
			<strong style="margin:0px; padding:0px;">개인정보처리방침</strong><br/>
			<textarea disabled style="width:900px; height:160px; resize: none; background-color:white;">
	주식회사 캣츠앤독스(이하 “회사”)는 「개인정보보호법」 등 관련법령에 따라 정보주체의 개인정보 및 권익을 보호하고, 
	개인정보와 관련한 정보주체의 고충을 원활하게 처리할 수 있도록 다음과 같은 개인정보 처리방침을 두고 있습니다.

	제 1 조 개인정보 처리 항목

 	회사는 서비스를 위한 목적에 필요한 범위에서 최소한의 개인정보를 다음과 같이 처리합니다.
 			
	서비스 회원가입 및 관리
			
	필수항목 : 이름, 생년월일, 아이디, 비밀번호, 성별, 이메일
 	선택항목 : 주소, 연락처, 프로필사진, 체형정보, 취향정보


 	민원사무 처리

 	이름, 아이디, 주소, 연락처 등 상담을 위해 필요한 회원의 등록정보


 	재화 또는 서비스 제공

 	이름, 아이디, 이메일, 주소, 연락처 등 서비스 수령을 위한 정보


 	마케팅 및 광고에의 활용

 	이름, 연락처, 생년월일, 서비스 이용정보, 회원이 사이트 내에 게시·등록한 콘텐츠 등


 	서비스 개발 및 개선

 	성별, 나이, 지역, 체형정보, 취향정보, 이용후기(글, 사진, 영상 등 콘텐츠 포함), 구매 이력 등
 	회사는 위 개인정보 처리와 관련하여 특정 개인을 알아볼 수 없도록 비식별화 조치를 취한 후 조치가 완료된 정보를 이용 및 제3자
 	에게 제공합니다.


 	서비스 이용 과정에서 IP주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.

	제 2 조 개인정보 수집·이용 및 목적

	회사는 서비스를 위한 목적에 필요한 범위에서 최소한의 개인정보를 수집 및 이용합니다. 수집한 개인정보는 다음의 목적 외 용도
	로는 이용되지 않으며, 이용 목적이 변경될 경우 회원의 사전 동의를 구합니다.
	
 	서비스 회원가입 및 관리

 	서비스 가입의사 확인, 회원자격 유지·관리, 서비스 부정이용 방지, 고충처리, 분쟁 조정을 위한 기록 보존 등


 	민원사무 처리

 	민원인의 신원 확인, 민원사항 확인, 처리결과 통보 등


 	재화 또는 서비스 제공

 	서비스 제공, 콘텐츠 제공, 본인인증, 맞춤 서비스 제공 등


 	마케팅 및 광고에의 활용

 	이벤트 및 광고성 정보 제공 및 참여기회 제공, 마케팅 및 광고 콘텐츠제작 및 게재 등


 	서비스 개발 및 개선

 	신규 서비스 및 제품 개발, 맞춤 서비스 제공, 서비스의 유효성 확인, 접속 빈도파악, 회원의 서비스 이용에 대한 통계 분석 등



	제 3 조 개인정보의 제공 및 위탁

 	회사는 회원의 동의, 법률의 특별한 규정 등 「개인정보보호법」제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 
 	제공합니다. 회사는 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.




	수탁업체
	위탁업무 내용


  


	(주)코드엠
	신용카드 결제 처리 및 구매안전서비스


	(주)카카오페이
	카카오 페이를 이용한 구매 및 요금 결제


	(주)네이버
	네이버 페이를 이용한 구매 및 요금 결제


	(주)코드엠
	카카오 알림톡 발송


	(주)다우기술
	SMS/MMS 등 문자메시지 발송 대행


	MailChimp®
	이메일 대량 전송 서비스


	Amazon Web Services Inc.
	이메일 전송, 데이터 보관


	OneSignal Inc.
	앱 푸시 알림




 	

 	개인정보는 회원 탈퇴시 혹은 위탁 계약 종료시까지 보유 및 이용합니다.
 	국외 위탁 내용

 	Lucky Orange

 	제공받는 자 : Lucky Orange LLC
 	제공받는 자의 개인정보 이용 목적 : 서비스 이용 통계 분석
 	제공하는 개인정보 항목 : 지역, 접속 이력, 콘텐츠 이용 내역 등
 	제공받는 자의 보유·이용 기간 : 30일


 	Metorik

 	제공받는 자 : UJU Pty. Ltd.
 	제공받는 자의 개인정보 이용 목적 : 서비스 구매 통계 분석
 	제공하는 개인정보 항목 : 로그인 기록 등 접속 이력, 구매 내역 등
 	제공받는 자의 보유·이용 기간 : 30일


 	Google Analytics

 	제공받는 자 : Google LLC
 	제공받는 자의 개인정보 이용 목적 : 사이트 방문자 통계 분석
 	제공하는 개인정보 항목 : 지역, 접속 이력, 콘텐츠 이용 내역 등
 	제공받는 자의 보유·이용 기간 : 26개월






 	회사는 원활한 서비스 제공을 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다. 회사는 위탁계약 시 「개인정보보호
 	법」제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적·관리적 보호조치 및 책임부담 등이 명확히 규정된 문서에 따
 	라 처리하고 있습니다.
	
 	수탁자 : 주식회사 이벗, ㈜교원크리에이티브
 	위탁업무 내용 : 서비스 물품 및 경품 배송 등의 물류 업무
 	개인정보 항목 : 이름, 주소, 연락처 등 배송을 위한 구매 정보
 	개인정보 보유·이용 기간 : 회원탈퇴 또는 위탁계약 종료 시까지


 	회사는 본 조의 개인정보의 제3자 제공 및 위탁업무의 내용이 변경될 경우에는 지체 없이 개인정보처리방침을 통해 고지하겠습니
 	다.

	제 4 조 개인정보의 보유 및 파기

 	회사는 원칙적으로 회원의 개인정보를 회원 탈퇴 시까지 보유하며, 회원 탈퇴 시 지체없이 파기합니다.
 	단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 
 	해당 기간 동안 개인정보를 안전하게 보관합니다.

 	부정이용기록

 	부정이용기록은 수집 시점으로부터 6개월 간 보관하고 파기합니다.


	「전자상거래 등에서 소비자 보호에 관한 법률」

 	표시·광고에 관한 기록 : 6개월
 	계약 또는 청약철회 등에 관한 기록 : 5년 보관
 	대금결제 및 재화 등의 공급에 관한 기록 : 5년 보관
 	소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 보관


 	「전자금융거래법」

 	전자금융에 관한 기록 : 5년 보관


 	「통신비밀보호법」

 	로그인 기록 등 방문 기록 : 3개월




 	회원탈퇴, 서비스 종료, 이용자에게 동의 받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보
 	는 재생이 불가능한 방법으로 파기합니다. 법령에서 보존의무를 부과한 정보는 해당 법령에서 정한 기간이 경과한 후 지체없이 재
 	생이 불가능한 방법으로 파기합니다.
 	회사는 ‘개인정보 유효기간제’에 따라 1년 간 로그인하지 않거나 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리하여 보
 	관 및 관리합니다.

	제 5 조 정보주체 및 법정대리인의 권리와 행사 방법

 	회원은 회사에 대해 언제든지 서면, 전자우편 등의 방법으로 개인정보 열람·정정·삭제·처리정리 요구 등의 권리를 행사할 수 있습
 	니다.
 	제1항에 따른 권리 행사는 회원의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.
 	회원의 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지 않습니다.
 	또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록
 	하겠습니다.
 	개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제37조제2항 및 관련 법령에 의하여 회원의 권리가 제한될 수 있습니다.

	제 6 조 개인정보의 안정성 확보조치

 	회사는 개인정보를 안전하게 관리하기 위하여 최선을 다하며 다음과 같은 조치를 취하고 있습니다.

 	관리적 조치 : 내부관리계획 수립·시행
 	물리적 조치 : 개인정보시스템의 물리적 보관 장소에 대한 비인가자 출입 통제
 	기술적 조치 : 개인정보에 대한 접근 제한, 중요정보에 대한 암호화, 보안프로그램 설치 등



	제 7 조 개인정보 처리책임자

	회사는 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 처리책임자를 지정하고 있습
	니다.
  


	개인정보 보호책임자
	개인정보 보호담당자


	- 이름 : 홍길동

	- 소속 : Developer Guild

	- 직위 : CTO

	- 연락처 : hellozepp45@gmail.com
	- 이름 : 엄복동

	- 소속 : Designer Guild

	- 직위 : Lead Product Designer

	- 연락처 : hellozepp45@gmail.com



	제 8 조 개인정보처리방침 적용범위

 	본 개인정보처리방침은 회사의 인더웨어 쇼핑몰(inthewear.com) 및 관련 제반 서비스에 적용됩니다.
 	회사가 제공하는 부가적 서비스 중 별도의 회원가입이 필요한 서비스 및 회사의 사이트에 링크되어 있는 제휴 사이트 이용자의 개
 	인정보를 수집하는 행위에 대해서는 본 개인정보 처리방침이 적용되지 않습니다.

	제 9 조 개정 전 고지의무

	본 개인정보처리방침의 내용 추가, 삭제 및 수정이 있을 경우 최소 7일 전에 ‘공지사항’을 통해 사전 공지하겠습니다. 다만, 수집하
	는 개인정보의 항목, 이용목적의 변경 등과 같이 이용자 권리의 중대한 변경이 발생할 때에는 최소 30일 전에 공지하며, 필요 시 이
	용자 동의를 다시 받을 수도 있습니다.
	- 공고일자 : 2021년 3월 22일
	- 시행일자 : 2021년 3월 22일
	- 시행일자(2021년 3월 22일 이전 가입 회원) : 2021년 4월 22일

	이전 개인정보처리방침 보기
			</textarea>
			<div class="checks etrans">
				 <input type="checkbox" id="ex_chk2" name="pointCheck"> 
  				<label style="cursor:pointer; user-select: none; font-size:15px;" for="ex_chk2">개인정보처리방침에 동의합니다.</label> 
			</div>
			
			
			<strong style="margin:0px; padding:0px;">쇼핑몰 이용약관</strong><br/>
			<textarea disabled style="width:900px; height:160px; resize: none; background-color:white;">
		제 1 조 (목적)

		본 약관은 애완용품 쇼핑몰(이하 ‘사이트’이라 한다)을 운영하는 회사 ㈜캣츠앤독스(이하 ‘회사’라 한다)에서 제공하는 인
		터넷 관련 서비스(이하 ‘서비스’라 하며, 접속 가능한 유,무선 단말기의 종류와 상관없이 이용 가능한 사이트가 제공하는 모든 서비스를 의미합니다.)를 이용함에 있어 회원의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.

		제 2 조 (정의)

		‘사이트’ 란 ‘회사’가 상품을 회원에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 ‘상품 등’을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 사이버몰을 운영하는 사업자의 의미로도 사용합니다. 현재 ‘회사’가 운영하는 ‘사이트’는 inthewear.com 이며, 더불어 서비스 하는 안드로이드, iOS 환경의 서비스를 포함한 모바일웹과 앱을 포함 합니다.
		‘회원’이라 함은 ‘사이트’에 개인정보를 제공하여 회원등록을 한 자로서, ‘사이트’에 정해진 회원 가입 방침에 따라 ‘사이트’의 정보를 지속적으로 제공받으며, ‘사이트’가 제공하는 ‘서비스’를 계속적으로 이용할 수 있는 자를 말합니다.
		‘비밀번호’라 함은 회원의 동일성 확인과 회원의 권익 및 비밀보호를 위하여 회원 스스로가 설정하여 ‘사이트’에 등록한 영문과 숫자의 조합을 말합니다.
		본 약관에서 정의되지 않은 용어는 관계법령이 정하는 바에 따르며, 그 외에는 일반적인 상관례에 의합니다.

		제 3 조 (약관의 명시와 설명 및 개정)

		 ‘회사’는 이 약관의 내용과 상호 및 대표자 이름, 소재지 주소, 전화번호, 전자우편주소, 사업자등록번호 등을 회원이 쉽게 알 수 있도록 ‘사이트’의 초기 ‘서비스’ 화면에 게시합니다. 다만, 약관의 구체적 내용은 회원이 연결화면을 통하여 볼 수 있습니다.
		 ‘회사’는 『전자상거래 등에서의 소비자보호에 관한 법률』, 『약관의 규제 등에 관한 법률』, 『전자거래 기본법』, 『전자 서명법』, 『정보통신망 이용촉진 등에 관한 법률』, 『소비자기본법』 등 관계법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
		 ‘회사’가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 ‘사이트’의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
		 ‘회사’가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 회원이 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 ‘회사’에 송신하여 ‘회사’의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
		제3항에 따라 공지된 적용일자 이후에 회원이 ‘회사’의 ‘서비스’를 계속 이용하는 경우에는 개정된 약관에 동의하는 것으로 봅니다. 개정된 약관에 동의하지 아니하는 회원은 언제든지 자유롭게 ‘서비스’ 이용계약을 해지할 수 있습니다.

			제 4 조 (약관 외 준칙)
		
			이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 『전자상거래 등에서의 소비자 보호에 관한 법률』 등 관련법령의 규정과 일반 상관례에 따릅니다.
		
			제 5 조 (이용계약의 성립)
		
		 	이용계약은 회원이 되고자 하는 자(이하 ‘가입신청자’)가 약관의 내용에 동의를 하고, ‘회사’가 정한 가입양식에 따라 회원정보(전자우편주소, 비밀번호, or 소셜네트워크를 통한 회원가입 정보 등)를 기입하여 회원가입신청을 하고 ‘회사’가 이러한 신청에 대하여 승인함으로써 체결됩니다.
		 	‘회사’는 다음 각 호에 해당하는 신청에 대하여는 승인을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
		
		 	‘가입신청자’가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만, 회원자격 상실 후 3개월이 경과한 자로서 ‘회사’의 회원 재가입 승낙을 얻은 경우에는 예외로 함
		 	등록내용에 허위의 정보를 기재하거나, 기재누락, 오기가 있는 경우
		 	회원가입일 현재 만 14세 미만인 경우
		 	이미 가입된 회원과 이름 및 전자우편주소가 동일한 경우
		 	부정한 용도 또는 영리를 추구할 목적으로 본 ‘서비스’를 이용하고자 하는 경우
		 	회원의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
		 	기타 이 약관에 위배되거나 위법 또는 부당한 이용신청임이 확인된 경우 및 ‘회사’가 합리적인 판단에 의하여 필요하다고 인정하는 경우
		
		
		 	‘회사’는 ‘서비스’ 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
		 	제2항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, 이 경우 ‘회사’는 원칙적으로 이를 ‘가입신청자’에게 알리도록 합니다.
		 	이용계약의 성립시기는 ‘회사’가 가입완료를 신청절차상에서 표시한 시점으로 합니다.
		 	‘회사’는 회원에 대해 ‘회사’정책에 따라 등급별로 구분하여 이용시간, 이용횟수, ‘서비스’ 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
		 	‘회사’는 회원에 대하여 『영화 및 비디오물의 진흥에 관한 법률』 및 『청소년 보호법』 등에 따른 등급 및 연령준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.
		
			제 6 조 (개인정보의 변경)
		
		 	회원은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.
		 	회원은 수정된 개인정보에 대하여 복구를 요청할 수 있습니다. 이를 위하여 ‘회사'는 회원의 개인정보 수정 기록을 최대 3년간 보관할 수 있습니다.
		
			제 7 조 (개인정보의 보호)
		
		 	‘회사’는 회원의 개인정보를 보호하기 위하여 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 등 관계법령에서 정하는 바를 준수합니다.
		 	‘회사’는 회원의 개인정보를 보호하기 위하여 개인정보취급방침을 제정, ‘서비스’ 초기화면에 게시합니다. 다만, 개인정보취급방침의 구체적 내용은 연결화면을 통하여 볼 수 있습니다.
		 	‘회사’는 개인정보취급방침에 따라 회원의 개인정보를 최대한 보호하기 위하여 노력합니다.
		 	‘회사’의 공식 ‘사이트’ 이외의 링크된 사이트에서는 ‘회사’의 개인정보취급방침이 적용되지 않습니다. 링크된 사이트 및 ‘상품 등’을 제공하는 제3자의 개인정보 취급과 관련하여는 해당 ‘사이트’ 및 제3자의 개인정보취급방침을 확인할 책임이 회원에게 있으며, ‘회사’는 이에 대하여 책임을 부담하지 않습니다.
		 	‘회사’는 다음과 같은 경우에 법이 허용하는 범위 내에서 회원의 개인정보를 제3자에게 제공할 수 있습니다.
		
		 	수사기관이나 기타 정부기관으로부터 정보제공을 요청 받은 경우
		 	회원의 법령 또는 약관의 위반을 포함하여 부정행위확인 등의 정보보호업무를 위해 필요한 경우
		 	기타 법률에 의해 요구되는 경우
		 	판매자 또는 배송업체 등에게 거래 및 배송 등에 필요한 최소한의 회원의 정보(성명, 주소, 전화번호)를 제공하는 경우
		 	구매가 성사된 때에 그 이행을 위하여 필요한 경우와 구매가 종료된 이후에도 반품, 교환, 환불, 취소 등을 위하여 필요한 경우
		
		
		 	타인의 개인정보를 도용하여 회원 가입 또는 구매가 확인되었을 경우에는 이용계약이 일방적으로 해지될 수 있으며, 주민등록법에 의해 3년 이하의 징역 또는 1천만 원 이하의 벌금이 부과될 수 있습니다. 또한 본인의 부주의로 ID, 비밀번호 등 개인정보의 유출, 타인의 사용으로 인하여 발생된 문제에 대해서 회사는 일체의 책임을 지지 않습니다.
		
			제 8 조 (이용계약의 종료)
		
		 	회원의 해지
		
		 	회원은 언제든지 ‘회사’에게 해지의사를 통지함으로써 이용계약을 해지할 수 있습니다.
		 	이용계약은 회원의 해지의사가 ‘회사’에 도달한 때에 종료됩니다.
		 	본 항에 따라 해지를 한 회원은 이 약관이 정하는 회원가입절차와 관련조항에 따라 회원으로 다시 가입할 수 있습니다.
		
		
		 	회사의 해지
		
		 	‘회사’는 다음과 같은 사유가 있는 경우, 이용계약을 해지할 수 있습니다. 이 경우 ‘회사’는 회원에게 전자우편주소, 전화 등 기타의 방법을 통하여 해지사유를 밝혀 해지의사를 통지합니다. 다만 ‘회사’는 해당 회원에게 사전에 해지사유에 대한 의견진술의 기회를 부여할 수 있습니다.
		
		 	제5조 제2항에서 정하고 있는 이용계약의 승낙거부사유가 있음이 확인된 경우
		 	회원이 ‘회사’나 다른 회원 기타 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하는 행위를 한 경우
		 	기타 회원이 이 약관에 위배되는 행위를 하거나 이 약관에서 정한 해지사유가 발생한 경우
		
		
		 	이용계약은 ‘회사’가 해지의사를 회원에게 통지함으로써 종료됩니다. 이 경우 ‘회사’는 해지의사를 회원이 등록한 전자우편주소로 발송하거나 ‘회사’의 게시판에 게시함으로써 통지에 갈음합니다.
		 	이용계약이 종료되는 경우 회원의 적립금 및 쿠폰은 소멸되며, 환불 등의 처리에 관하여는 ‘회사’의 환불규정에 의합니다.
		 	이용계약의 종료와 관련하여 발생한 손해는 이용계약이 종료된 해당 회원이 책임을 부담하고 ‘회사’는 일체의 책임을 지지 않습니다.
		
		
		
			제 9 조 (회원탈퇴 및 자격 상실)
		
		 	회원은 ‘회사’에 언제든지 탈퇴를 요청할 수 있으며 ‘회사’는 회원탈퇴에 관한 규정에 따라 이를 처리합니다.
		 	회원이 다음 각 호의 사유에 해당하는 경우, ‘회사’는 회원자격을 제한 및 정지시킬 수 있습니다.
		
		 	다른 사람의 ‘사이트’ 이용을 방해하거나 그 정보를 도용하는 등 전자상거래질서를 위협하는 경우
		 	‘사이트’를 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
		 	기타 다음과 같은 행위 등으로 ‘사이트’의 건전한 운영을 해하거나 ‘사이트’의 업무를 방해하는 경우
		
		 	‘사이트’의 운영과 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하여 ‘회사’의 명예를 실추시키거나 ‘사이트’의 신뢰성을 해하는 경우
		 	‘사이트’의 이용과정에서 직원에게 폭언, 협박 또는 음란한 언행 등으로 ‘사이트’의 운영을 방해하는 경우
		 	‘사이트’를 통해 ‘상품 등’을 구매한 후 정당한 이유 없이 상습 또는 반복적으로 취소∙반품하여 ‘회사’의 업무를 방해하는 경우
		 	‘사이트’를 통해 구입한 ‘상품 등’에 특별한 하자가 없는데도 불구하고 일부 사용 후 상습적인 취소∙전부 또는 일부 반품 등으로 ‘회사’의 업무를 방해하는 경우
		
		
		
		
		 	‘회사’가 회원자격을 제한∙정지시킨 후 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 ‘회사’는 회원자격을 상실시킬 수 있습니다.
		 	재판매의 목적으로 ‘사이트’에서 ‘상품 등’을 중복 구매하는 등 ‘사이트’의 거래질서를 방해하는 경우 ‘회사’는 당해 회원의 회원자격을 상실시킬 수 있습니다.
		 	‘회사’가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 제8조 제2항 (나)목에 따라 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.
		
			제 10 조 (회원의 ID 및 비밀번호에 대한 의무)
		
		 	ID(전자우편번호 및 소셜네트워크 연동으로 인한 ID)와 비밀번호에 관한 관리책임은 회원에게 있으며, 이를 소홀히 하여 발생한 모든 민∙형사상의 책임은 회원 자신에게 있습니다.
		 	회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
		 	회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 ‘회사’에 통보하고 ‘회사’의 조치가 있는 경우에는 그에 따라야 합니다.
		 	회원이 제3항에 따른 통지를 하지 않거나 ‘회사’의 조치에 응하지 아니하여 발생하는 모든 불이익에 대한 책임은 회원에게 있습니다.
		
			제 11 조 (회원의 의무)
		
		 	회원은 관계법령, 이 약관의 규정, 이용안내 등 ‘회사’가 통지하는 사항을 준수하여야 하며, 기타 ‘회사’ 업무에 방해되는 행위를 하여서는 안됩니다.
		 	회원은 ‘서비스’ 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.
		
		 	‘서비스’ 신청 또는 변경 시 허위내용의 등록
		 	타인의 정보도용
		 	‘사이트’에 게시된 정보의 허가 받지 않은 변경
		 	‘회사’가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
		 	‘회사’ 및 기타 제3자의 저작권 등 지적재산권에 대한 침해
		 	‘회사’ 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
		 	외설 또는 폭력적인 메시지∙화상∙음성 기타 공서양속에 반하는 정보를 ‘회사’에 공개 또는 게시하는 행위
		 	‘회사’의 동의 없이 영리를 목적으로 ‘서비스’를 사용하는 행위
		 	기타 관계법령이나 ‘회사’에서 정한 규정에 위배되는 행위
		
		
		
			제 12 조 (회원의 게시물)
		
		 	회원이 작성한 게시물에 대한 모든 권리 및 책임은 이를 게시한 회원에게 있으며, ‘회사’는 회원이 게시하거나 등록하는 ‘서비스’의 내용물이 다음 각 항에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있고, 이에 대하여 ‘회사’는 어떠한 책임도 지지 않습니다.
		
		 	다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
		 	공서양속에 위반되는 내용일 경우
		 	범죄적 행위에 결부된다고 인정되는 경우
		 	‘회사’의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
		 	회원이 ‘사이트’와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우
		 	‘회사’로부터 사전 승인 받지 아니한 상업광고, 판촉내용을 게시하는 경우
		 	해당 상품과 관련 없는 내용인 경우
		 	정당한 사유 없이 당사의 영업을 방해하는 내용을 기재하는 경우
		 	기타 관계법령에 위반된다고 판단되는 경우
		
		
		 	‘회사'는 회원이 작성한 게시물에 대한 소유권을 주장하지 않지만 회원은 '회사'에 회원의 게시물을 이용할 라이선스를 부여합니다.
		
		 	회원이 지적 재산권(사진 또는 동영상 등)이 적용되는 게시물 또는 ‘회사'의 '서비스'와 관련된 게시물을 공유, 게시 또는 업로드할 때 회원은 게시물을 전 세계적으로 호스팅, 사용, 배포, 수정, 실행, 복사, 공개적으로 수행 또는 표시, 번역 및 파생 저작물을 생성할 수 있는 비독점적이고 양도 가능하며 2차 허가권을 가질 수 있고 사용료가 없는 허가권을 '회사'에 부여합니다
		
		
		
			제 13 조 (회원에 대한 통지)
		
		 	‘회사’가 회원에 대한 통지를 하는 경우, 회원이 가입신청 시 ‘회사’에 제출한 전자우편주소나 SMS, PUSH 등으로 할 수 있습니다.
		 	‘회사’는 불특정다수 회원에 대한 통지의 경우, 1주일 이상 ‘사이트’에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래에 관하여 중대한 영향을 미치는 사항에 대하여는 개별 통지합니다.
		
			제 14 조 (‘회사’의 의무)
		
		 	‘회사’는 관계법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 ‘상품 등’을 제공하는데 최선을 다하여야 합니다.
		 	‘회사’는 회원이 안전하게 ‘서비스’를 이용할 수 있도록 회원의 개인정보(신용정보 포함)보호를 위한 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.
		 	‘회사’는 회원으로부터 제기되는 의견이나 불만이 정당하고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 통보하여야 합니다.
		
			제 15 조 (개별 서비스에 대한 약관 및 이용조건)
		
			‘회사’는 제공하는 ‘서비스’내의 개별 서비스에 대한 별도의 약관 및 이용조건을 둘 수 있으며 개별 서비스에서 별도로 적용되는 약관에 대한 동의는 회원이 개별 서비스를 최초로 이용할 경우 별도의 동의절차를 거치게 됩니다. 이 경우 개별 서비스에 대한 이용약관 등이 본 약관에 우선합니다.
		
			제 16 조 (‘서비스’ 이용시간)
		
			‘서비스’의 이용은 ‘회사’의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만 정기점검 등의 필요로 ‘회사’가 정한 날이나 시간은 제외됩니다. 정기점검시간은 ‘서비스’제공화면에 공지한 바에 따릅니다.
		
			제 17 조 (‘서비스’ 이용책임)
		
			회원은 ‘회사’가 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 ‘서비스’를 이용하여 상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈벌이 광고, 음란사이트 등을 통한 상업행위, 상용S/W 불법배포 등을 할 수 없습니다. 이를 어겨 발생한 영업활동의 결과 및 손실, 관계기관에 의한 법적 조치 등에 관해서는 ‘회사’가 책임을 지지 않습니다.
		
			제 18 조 (‘서비스’ 제공의 중지)
		
		 	‘회사’는 다음 각 호에 해당하는 경우 ‘서비스’ 제공을 중지할 수 있습니다.
		
		 	컴퓨터 등 정보통신설비의 보수점검∙교체 및 고장, 통신의 두절 등의 사유가 발생한 경우
		 	『전기통신사업법』에 규정된 기간통신사업자가 전기통신 ‘서비스’를 중지했을 경우
		 	기타 불가항력적 사유가 있는 경우
		
		
		 	‘회사’는 국가비상사태, 정전, ‘서비스’ 설비의 장애 또는 ‘서비스’ 이용의 폭주 등으로 정상적인 ‘서비스’ 이용에 지장이 있는 때에는 ‘서비스’의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
		 	‘회사’가 ‘서비스’ 제공을 일시적으로 중단할 경우 서비스 일시 중단사실과 그 사유를 ‘사이트’ 초기화면에 통지합니다.
		
			제 19 조 (정보의 제공 및 광고의 게재)
		
		 	‘회사’는 회원이 ‘서비스’ 이용 중 필요하다고 인정되는 다양한 정보를 공지사항 또는 전자우편이나, SMS, 전화 등의 방법으로 회원에게 제공할 수 있습니다. 다만, 회원은 관련법에 따른 거래관련정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편 등에 대해서 수신 거절을 할 수 있습니다.
		 	‘회사’는 ‘서비스’의 운영과 관련하여 ‘서비스’ 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편 등을 수신한 회원은 수신거절을 ‘회사’에게 할 수 있습니다.
		
			제 20 조 (구매신청)
		
		 	회원은 본 약관 및 ‘회사’가 정한 규정에 따라 아래 또는 이와 유사한 방법에 의하여 구매를 신청하여야 합니다.
		
		 	‘상품 등’의 선택
		 	구매자 성명, 주소, 전화번호, 전자우편주소, 수취인의 성명, 배송지 정보, 전화번호 입력
		 	결제 시 유의사항에 대한 확인
		 	이 약관에 동의한다는 표시(예, 마우스 클릭)
		
		
		 	‘회사’는 회원의 구매신청이 있는 경우 회원에게 수신확인통지를 합니다.
		 	전 항의 수신확인통지를 받은 회원은 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다. 다만, 이미 대금을 지불한 경우에는 제24조 청약철회 등에 관한 규정에 따릅니다.
		
			제 21 조 (대금지급방법)
		
		 	‘회사’에서 구매한 상품 또는 쿠폰에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다.
		
		 	신용카드 결제
		 	실시간 계좌이체
		 	에스크로 결제
		 	무통장입금
		 	기타 ‘회사’가 추가 지정하는 결제 수단(할인쿠폰, 스마트폰 앱 등)
		
		
		 	회원이 구매대금의 결제와 관련하여 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 회원이 부담합니다.
		
			제 22 조 (‘상품 등’의 공급)
		
		 	‘회사’는 회원의 ‘상품 등’의 공급에 관하여 별도의 약정이 없는 이상 회원이 ‘상품 등’을 구매한 날부터 빠른 시일 이내에 ‘상품 등’을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다.
		 	‘회사’는 회원이 ‘상품 등’의 공급절차 및 진행사항, ‘상품 등’에 대한 구매 결제내역을 확인할 수 있도록 적절한 조치를 하여야 하며, ‘상품 등’의 취소방법 및 절차를 안내하여야 합니다.
		 	‘회사’는 회원이 구매한 ‘상품 등’에 대해 배송수단, 수단별 배송비용, 배송비용 부담자, 수단별 배송기간 등을 명시합니다.
		 	‘회사’와 고객간에 상품의 인도시기 및 쿠폰의 제공시기에 관하여 별도의 약정이 있는 경우에는 본 약관에 우선합니다.
		
			제 23 조 (환급)
		
			‘회사’는 회원이 구매 신청한 ‘상품 등’이 품절 등의 사유로 인도 또는 제공할 수 없을 때에는 지체 없이 그 사유를 회원에게 통지하여야 하고, 사전에 ‘상품 등’의 대금을 받은 경우에는 대금을 받은 날로부터 7영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
		
			제 24 조 (청약철회 등)
		
		 	‘회사’의 ‘상품 등’의 구매취소 및 환불 규정은 『전자상거래 등에서의 소비자보호에 관한 법률』 등 관련 법령을 준수합니다.
		 	‘회사’와 ‘상품 등’의 구매에 관한 계약을 체결한 회원은 수신확인의 통지를 받은 날(전자우편 또는 SMS 문자통지 등을 받은 날) 또는 ‘상품 등’의 공급을 받은 날로부터 7일 이내에는 청약을 철회할 수 있습니다.
		 	회원은 ‘상품 등’을 배송 받은 경우 아래 각 호에 해당하는 경우에는 교환 및 반품, 환불을 할 수 없습니다.
		
		 	회원에게 책임 있는 사유로 ‘상품 등’이 멸실 또는 훼손된 경우(다만, ‘상품 등’의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다.)
		 	회원의 사용 또는 일부 소비에 의하여 ‘상품 등’의 가치가 현저히 감소한 경우
		 	시간의 경과에 의하여 재판매가 곤란할 정도로 ‘상품 등’의 가치가 현저히 감소한 경우
		 	같은 성능을 지닌 ‘상품 등’으로 복제가 가능한 경우 그 원본인 ‘상품 등’의 포장을 훼손한 경우
		 	회사가 특정 쿠폰 또는 상품 등에 대하여 청약철회 제한에 관해 사전에 고지한 경우
		
		
		 	회원은 제3항 및 제4항의 규정에 불구하고 ‘상품 등’의 내용이 표시∙광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 당해 ‘상품 등’을 공급받은 날부터 3일 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 10일 이내에 청약철회 등을 할 수 있습니다.
		
			제 25 조 (청약철회 등의 효과)
		
		 	회원이 구매한 ‘상품 등’을 취소 또는 환불하는 경우 ‘회사’는 그 처리 결과에 대해 제13조(회원에 대한 통지)에 정한 방법으로 통지합니다.
		 	‘회사’는 회원으로부터 쿠폰취소 요청 또는 상품 등을 반환 받은 경우 7영업일 이내에 이미 지급받은 대금을 환급합니다. 이 경우 ‘회사’가 회원에게 재화 등의 환급을 지연할 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
		 	청약철회 등의 경우 공급받은 ‘상품 등’의 반환에 필요한 비용은 회원이 부담합니다. 다만, ‘상품 등’의 내용이 표시∙광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 ‘상품 등’에 필요한 비용은 ‘회사’가 부담합니다.
		 	회원의 단순변심에 의한 취소일 경우 환불처리에 발생하는 수수료와 기타 제반 비용은 회원이 부담합니다.
		 	기타 본 약관 및 ‘사이트’의 이용안내에 규정되지 않은 취소 및 환불에 대한 사항에 대해서는 소비자 피해보상규정에서 정한 바에 따릅니다.
			
			제 26 조 (‘상품 등’의 취소 및 환불의 특칙)
		
			상품의 반품에 따른 환불은 반품하는 상품이 판매자에게 도착되고, 반품 사유 및 반품 배송비 부담자가 확인된 이후에 이루어집니다.
		
			제 27 조 (게시물의 관리)
		
		 	회원의 게시물이 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 및 『저작권』등 관계법령에 위반되는 내용을 포함하는 경우, 권리자는 관계법령이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, ‘회사’는 관계법령에 따라 조치를 취하여야 합니다.
		 	‘회사’는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 ‘회사’ 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 ‘게시물’에 대해 임시조치 등을 취할 수 있습니다.
		 	본 조에 따른 세부절차는 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 및 『저작권법』이 규정한 범위 내에서 ‘회사’가 정한 ‘게시중단요청서비스’에 따릅니다.
		
			제 28 조 (면책조항)
		
		 	‘회사’는 천재지변 또는 이에 준하는 불가항력으로 인하여 ‘서비스’를 제공할 수 없는 경우에는 ‘서비스’ 제공에 관한 책임이 면제됩니다.
		 	‘회사’는 회원의 귀책사유로 인한 ‘서비스’ 이용의 장애에 대하여 책임을 지지 않습니다.
		 	‘회사’는 회원이 ‘서비스’를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며, 그 밖의 ‘서비스’를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.
		 	‘회사’는 회원이 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관해서는 책임을 지지 않습니다.
		 	회원이 발송한 메일 내용에 대한 법적인 책임은 사용자에게 있습니다.
		 	‘회사’는 회원간 또는 회원과 제3자 상호간에 ‘서비스’를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
		 	‘회사’는 무료로 제공되는 ‘서비스’ 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
		
			제 29 조 (분쟁해결)
		
		 	‘회사’는 회원이 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위해서 피해보상처리 기구를 설치, 운영합니다.
		 	‘회사’는 회원으로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만 신속한 처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 즉시 통보합니다.
		
			제 30 조 (준거법 및 관할법원)
		
		 	이 약관의 해석 및 ‘회사’와 회원간의 분쟁에 대하여는 대한민국의 법을 적용합니다.
		 	‘서비스’ 이용 중 발생한 회원과 ‘회사’간의 소송은 민사소송법에 의한 관할법원에 제소합니다.
		
			제 31 조 (정기구매 서비스)
		
			정기구매 서비스는 ‘사이트’의 이용자의 편의를 위하여 상품을 정기적으로 결제하고, 배송하는 서비스입니다.
			
			제 32 조 (정기구매 서비스 이용 자격)
		
			정기구매 서비스는 ‘사이트’ 회원이면 누구나 정기구매 서비스를 신청함으로써 이용이 가능합니다.
		
			제 33 조 (정기구매 서비스 상품의 결제 등)
		
		 	‘사이트’는 정기구매 서비스 상품에 대하여 할인 혜택을 제공할 수 있으며, 할인율 및 거래조건 등은 상품 별로 다를 수 있고 변경될 수 있습니다. 할인율 및 거래조건 등이 “이용자”에게 불리하게 변경되는 경우 ‘사이트’는 2주 이상의 상당한 기간 동안 위 변경에 대하여 공지하고, 고객은 위 변경에 동의하지 않으면 위 기간 동안 본 서비스를 종료시킬 수 있으며, 위 기간 동안 서비스를 종료시키지 않으면 위 변경에 고객이 동의한 것으로 봅니다.
		 	정기구매 서비스의 특성 상 상품의 가격은 계속적으로 변경될 수 있으며, 고객에게 고지된 시점의 상품 가격을 기준으로 결제가 이루어집니다. 가격 결정의 기준 시점은 변경될 수 있습니다.
		 	정기구매 서비스 상품의 추가 또는 변경 시 결제되는 총 상품의 금액은 변경됩니다.
		 	카드 한도 초과 등으로 상품의 결제가 이루어 지지 않을 경우, 해당 회차의 정기구매 주문은 이루어지지 않을 수 있으며, 위와 같은 상황이 2회 이상 지속되는 경우 ‘사이트’는 정기구매 서비스를 중지할 수 있습니다.
		
			제 34 조 (정기구매 서비스 상품의 판매 종료 등)
		
			정기구매 대상 상품을 더 이상 판매할 수 없거나 해당 상품을 정기구매 서비스로 제공할 수 없는 사유가 있는 경우, ‘사이트’는 해당 상품의 정기구매 서비스를 중지하거나 해당 회차의 상품을 공급하지 않을 수 있습니다.
		
			제 35 조 (정기구매 서비스의 종료)
		
			고객은 ‘회사’에게 통지하거나, ‘사이트’의 마이페이지에서 해제 신청함으로써 정기구매 서비스를 종료시킬 수 있습니다.
		
			제 36 조 (정기구매 서비스 이용의 제한)
		
		 	고객의 통지 또는 과실에 의해서 정기구매 서비스가 중지되는 경우(일부 상품에 대하여 정기구매 서비스가 중지되는 경우를 포함합니다.) 해당 상품의 정기구매 서비스 신청이 2개월의 범위 내에서 제한될 수 있습니다.
		 	‘사이트’는 특정상품에 대하여 구매 수량을 제한할 수 있습니다.
		 	‘사이트’는 상품의 재판매 가능성이 있는 경우, 또는 불법적이거나 부당한 행위와 관련된 경우 정기구매 서비스 제공을 제한할 수 있습니다.
		 	서비스 이용의 제한에 대한 구체적인 기준은 내부 운영정책에 따라 적용 됩니다.
		 	‘회사’는 자체적인 시스템을 통한 모니터링과 각종 기관에서 접수된 민원 내용, 수사기관의 정보 등을 통해 정황을 확인한 후, 정기구매 서비스 제한 사유 행위를 한 것으로 추정되는 경우 정기구매 서비스 이용을 제한 할 수 있습니다.
		
			제 37 조 (기타)
		
		 	고객이 본 약관에 동의함으로써 약관의 효력이 발생하고(현재 계속 중인 정기구매 서비스에도 적용됩니다.), 정기구매 서비스가 계속되는 동안 본 약관의 효력은 유지됩니다. 고객이 정기구매 서비스 이용을 시작하고 정기구매 상품을 추가, 변경하는 경우에도 본 약관이 계속 적용됩니다.
		 	정기구매 서비스의 개인정보보호정책은 ‘사이트’의 개인정보취급방침을 준용합니다.
		 	본 약관에서 정하지 아니한 내용은 ‘회사’의 정책에 따릅니다.
		 	‘사이트’가 약관을 변경하는 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 7일 전부터 적용일 이후 상당한 기간 동안 공지만을 하고, 개정내용이 고객에게 불리한 경우에는 그 적용일자 30일 전부터 적용일 이후 상당한 기간 동안 이를 고객의 이메일 주소로 약관 개정 사실을 발송하여 고지합니다.
		 	“사이트”가 전항에 따라 고객에게 통지하면서 공지 또는 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 이를 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 불구하고 거부의 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 고객이 개정약관에 동의하지 않을 경우 고객은 제18조에 따라 정기구매 서비스를 종료시킬 수 있습니다.
		
			부칙
		
		 	이 약관은 2021년 3월 22일부터 시행합니다.
		 	이 개정약관은 시행일 이전에 체결된 계약에 대해서는 2021년 4월 22일부터 적용됩니다.
		
			이전 이용약관 보기
		
			제9조에 의한 회원탈퇴 요청
			</textarea>
			<div class="checks etrans">
				 <input type="checkbox" id="ex_chk3" name="pointCheck"> 
  				<label style="cursor:pointer; user-select: none; font-size:15px;" for="ex_chk3">쇼핑몰 이용약관에 동의합니다.</label> 
			</div>
		
	 <button id="show" class="btn btn-danger" disabled>탈퇴하기</button>
    <div class="background">
      <div class="window">
      	<!-- 팝업창 -->
        <div class="popup">
        	
        	<div>
        		<p style="font-size:35px; color:#55557B; margin-left:230px; margin-top:20px;">탈퇴안내</p>
        	</div>
        	
        	<div class="checks etrans" style="margin-top:30px; width:500px; margin-bottom:20px; margin-left:50px;">
				<input type="checkbox" id="ex_chk4" name="pointCheck"> 
  				<label style="cursor:pointer; user-select: none; font-size:17px;" for="ex_chk4">
  				위 회원탈퇴 안내를 모두 확인하였으며 탈퇴 시 아이디의 재사용 및 데이터 복구가 
  				불가능함에 동의합니다.
  				</label> 
			</div>
			
			<div style="position: absolute;left:50%; transform:translateX(-50%);">
				<p style="font-size:25px;">탈퇴하시겠습니까?</p>
			</div>
			
			<div style="margin-left:135px; margin-top:70px; width:100%;">
				<button id="close2" disabled class="btn btn-danger" style="margin-top:-7px;">탈퇴하기</button>
				<button id="close">탈퇴취소</button>
			</div>
			
			</div>
			
			
        </div>
      </div>
    </div>

		<div style="display:none;">
			<form id="logoutForm" action="logout" method="POST">
				<sec:csrfInput/>
			</form>
		</div>
	
</div>	
<!-- FOOTER -->
<%@ include file="../footer.jsp" %>

</body>

<script>
var x;
var y;
var z;
$(document).ready(function(){
	
	//약관 버튼활성화 코드
	$("#ex_chk1").click(function(){
		if(this.checked) {
			x = 1;
		} else {
			x = 0;
		}
		
		if(x == 1 && y == 1 && z == 1) {
			$("#show").prop("disabled", false);
		} else {
			$("#show").prop("disabled", true);
		}
	});
	$("#ex_chk2").click(function(){
		if(this.checked) {
			y = 1;
		} else {
			y = 0;
		}
		
		if(x == 1 && y == 1 && z == 1) {
			$("#show").prop("disabled", false);
		} else {
			$("#show").prop("disabled", true);
		}
	});
	$("#ex_chk3").click(function(){
		if(this.checked) {
			z = 1;
		} else {
			z = 0;
		}
		
		if(x == 1 && y == 1 && z == 1) {
			$("#show").prop("disabled", false);
		} else {
			$("#show").prop("disabled", true);
		}
	});
});
</script>

<script>
var u;
$(document).ready(function(){
	
	//약관 최종동의 버튼
	$("#ex_chk4").click(function(){
		if(this.checked) {
			u = 1;
		} else {
			u = 0;
		}
		
		if(u == 1) {
			$("#close2").prop("disabled", false);
		} else {
			$("#close2").prop("disabled", true);
		}
	});
});
</script>

<script>
if (!$("input:checked[Name='pointCheck']").is(":checked")){ 
	alert("에러문구를 표시"); 
	$("#pointCheck").focus(); 
	return; 
	}

</script>

<!-- 팝업창 -->
 <script>
$(document).ready(function(){
	
	function close() {
        document.querySelector(".background").className = "background";
      }
      function show() {
        document.querySelector(".background").className = "background show";
      }

      document.querySelector("#show").addEventListener("click", show);
      document.querySelector("#close").addEventListener("click", close);
});
    </script>

<script>
var _select_title = $(".text_ul_wrap > a");
$('<div class="select_icon"></div>').insertAfter(_select_title);

_select_title.click(function () {
  $(".ul_select_style").toggleClass("active");
  $(".select_icon").toggleClass("active");
});

$(".ul_select_style > li").on('click', function () {
  var _li_value = $(this).text();
  _select_title.text(_li_value);
  $(".ul_select_style").removeClass("active");
  $(".select_icon").toggleClass("active");
});
$("body").click(function (e) {
  if($(".ul_select_style").hasClass("active")){
    if(!$(".text_ul_wrap").has(e.target).length){
      $(".ul_select_style").removeClass("active");
      $(".select_icon").removeClass("active");
    };
  }
})
</script>

<script>
$(document).ready(function(){
	
	$("#close2").click(function(e){
		e.preventDefault();
		$.ajax({
			url : "remove2",
			success : function(data) {
				console.log(data);
				alert("회원탈퇴 완료");
				$("#logoutForm").submit();
			},
			error : function(data) {
				console.log(data);
				alert("오류");
				location.href = "home";
			}
		});
	});
	
});
</script>
</html>