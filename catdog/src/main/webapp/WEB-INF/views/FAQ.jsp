<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!--RWD first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>FAQ</title>

<!-- 외부 Source 적용 -->
<link href="style/main.css" rel="stylesheet" type="text/css">
<link href="style/fixzone.css" rel="stylesheet" type="text/css">
<link href="style/home_header.css" rel="stylesheet" type="text/css">
<link href="style/home_footer.css" rel="stylesheet" type="text/css">

</head>
<body>

<!-- 우측 배너 -->
<%@ include file="fixzone.jsp" %>

<div id="wrap">
	<!-- HEADER -->
	<%@ include file="header.jsp"%>
<br>
<div id="FAQ" style="width:80%; margin:20px auto 0;">
	<h3>자주 묻는 질문을 한자리에</h3><br><hr/><br><br>
		<div class="faq">
			<div class="faqHeader">
				<!--button type="button" class="showAll">답변 여닫기</button-->
			</div>
			<ul class="faqBody">
				<li class="article" id="a1">
					<p class="q" style="font-size:20px">
						<a href="#a1">[교환/반품] 교환 및 반품시 상품을 어디로 보내면 되나요?</a>
					</p>
					<p class="a" style="font-size:0.9em">※ Cats & Dogs 교환 및 반품 주소 : 수원시 권선구 탑동로57번길 20-1, 201호 (탑동 752-3)<br>
								 ※ 상품 교환 및 반품이 가능한 경우 : 상품 수령 후 배송된 날로부터 7일 이내에만 가능합니다.<br>
								 ※ 교환 및 반품이 불가하다고 미리 고지한 상품은 제외하며, 상품을 사용하지 않고 손상이 없는 상태의 새 상품만 가능합니다.<br>
								 ※ 교환 및 반품시 택배비: 상품의 불량, 파손, 오배송일 경우를 제외한 고객 단순변심 또는 취향문제로 인한 경우에는 택배비 고객 부담.<br>
								 ※ 더 궁금하신 사항이 있으면 1116-1110으로 문의해주시기바랍니다. 감사합니다.</p>
				</li>
				<hr/><br>
				<li class="article" id="a2">
					<p class="q" style="font-size:20px">
						<a href="#a2">[교환/반품] 교환 및 반품 비용은 얼마가 드나요?</a>
					</p>
					<p class="a" style="font-size:0.9em">※ Cats & Dogs의 과실이 아닌 고객 변심, 주문 오류, 취향의 문제등 으로 인한 교환이나 반품을 요청하실 경우에는 택배비가 부과됩니다.<br>
								　	1116-1110으로 연락주시면 이용하는 롯데택배를 이용하여 교환/반품 처리해드립니다.<br>
								 ※ 접수 후 2~3일 내에 롯데택배 기사가 방문하여 교환/반품건 택배를 회수합니다.<br>
								 ※ 고객 변심이나 주문 오류로 인한 반품 시, 주문 금액에서 택배비 3,000원을 차감하여 환불이 진행됩니다.<br>
								 　 또는 고객센터와 통화 후 편한 택배사를 이용하여 택배비 3,000원을 계좌로 보내주시고 해당 상품을 아래 주소로 보내주시면 됩니다.<br>
								 ※ 상품 일부 반품시(편도택배비) : 3,000원/교환시(왕복택배비) : 6,000원<br>
								 ※ 교환 및 반품 주소 : 수원시 권선구 탑동로57번길 20-1, 201호 (탑동 752-3)<br>
								 ※ 교환 및 반품 시 더 궁금한 사항이 있으시면 1116-1110으로 문의해주시기 바랍니다. 감사합니다</p>
				</li>
				<hr/><br>
				<li class="article" id="a3">
					<p class="q" style="font-size:20px">
						<a href="#a3">[회원정보] 회원 가입은 어떻게 하나요?</a>
					</p>
					<p class="a" style="font-size:0.9em">※ 회원가입은 무료이며 홈페이지 우측의 "회원가입" 버튼을 클릭하여 약관 동의를 하신 후 
					     		   정해진 양식에 따라 고객님의 인적사항을 입력하신 후 회원가입을 하시면 됩니다.<br>
					     		  　회원가입 시 문제가 있거나 궁금하신 사항이 있으면 고객센터 1116-1110으로 문의해주세요.<br><p>     		   
				</li>
				<hr/><br>
				<li class="article" id="a4">
					<p class="q" style="font-size:20px">
						<a href="#a4">[취소/환불] 신용카드로 결제하였는데 환불은 어떻게 받나요?</a>
					</p>
					<p class="a" style="font-size:0.9em">※ 신용카드 결제 시 주문취소는 바로 해드리지만 환불요청은 해당카드사에 합니다.<br>
								 ※ 카드 결제 취소(환불)는 카드사 상황에 따라 다르며 다소 시일이 걸릴 수 있습니다.<br>
								 　(약 일주일 후에 확인 가능합니다.)<br>
								 ※ 신용카드 결제 취소 후 환불에 문제가 있으면 고객센터 1116-1110으로 문의해주시기 바랍니다.<br>
								 　 감사합니다.<p>     		   
				</li>
				<hr/><br>
				<li class="article" id="a5">
					<p class="q" style="font-size:20px">
						<a href="#a5">[기타] Cats & Dogs 오프라인 매장은 어디에있나요?</a>
					</p>
					<p class="a" style="font-size:0.9em">※ Cats & Dogs 오프라인 매장은 전국 곳곳에 체인점이 있습니다.<br>
								 ※ 오프라인 매장은 월~일까지 연중무휴 오전 10시 부터 오후 9시까지 운영합니다.<br>
								 ※ 오프라인에서도 상품 구매가능 하시며 상품에 관해 궁금하신 사항이 있으면 미리 연락 후 방문해 주시면 편리합니다.<br>
								 ※ 매장은 쇼핑몰 제일 아래 회사소개에 주소를 지도에 검색해주세요 ^^<br><br>
								 　오프라인 매장 또는 가맹점에 관해 더 궁금하신 사항이 있으면 1116-1110으로 문의해주시기 바랍니다.<p>
				</li>
				<hr/><br>
				<li class="article" id="a6">
					<p class="q" style="font-size:20px">
						<a href="#a6">[배송] 주문한 제품은 언제 받아볼 수 있나요?</a>
					</p>
					<p class="a" style="font-size:0.9em">※ 통상적으로 영업일 기준 2-4일 내 배송되나, 제품 재고 현황 및 택배사 사정에 따라 달라질 수 있습니다.<br>
								 　 자세한 내용은 1:1 문의 게시판이나 고객센터(1116-1110)로 문의 부탁드립니다<p>     		   
				</li>
				<br><br><br>
			</ul>
		</div>
	</div>

		<script>
			jQuery(function($) {
				//Frequently Asked Question
				var article = $('.faq>.faqBody>.article');
				article.addClass('hide');
				article.find('.a').hide();
				article.eq(0).removeClass('hide');
				article.eq(0).find('.a').show();
				$('.faq>.faqBody>.article>.q>a').click(function() {
					var myArticle = $(this).parents('.article:first');
					if (myArticle.hasClass('hide')) {
						article.addClass('hide').removeClass('show');
						article.find('.a').slideUp(250);
						myArticle.removeClass('hide').addClass('show');
						myArticle.find('.a').slideDown(250);
					} else {
						myArticle.removeClass('show').addClass('hide');
						myArticle.find('.a').slideUp(250);
					}
					return false;
				});
				$('.faq>.faqHeader>.showAll').click(function() {
					var hidden = $('.faq>.faqBody>.article.hide').length;
					if (hidden > 0) {
						article.removeClass('hide').addClass('show');
						article.find('.a').slideDown(250);
					} else {
						article.removeClass('show').addClass('hide');
						article.find('.a').slideUp(250);
					}
				});
			});
		</script>
	</div>

	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>

</body>

</html>