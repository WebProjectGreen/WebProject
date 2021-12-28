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
<title>Header</title>
</head>
<body>
	<div id="header">
		<div id="header_top">
			<ul class="nav justify-content-end">
				<li class="nav-item">
					<sec:authorize access="isAnonymous()">
					<a href="login_view">로그인</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<form id="logoutForm" action="logout" method="POST">
							<sec:csrfInput/>
							<button id="header_logout" type="submit">로그아웃</button>
						</form>
					</sec:authorize>
				</li>
				<li class="nav-item">
					<sec:authorize access="isAnonymous()">
					<a href="signup">회원가입</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
					<a href="mypage">마이페이지</a>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="adminpage">관리페이지</a>
					</sec:authorize>
					
				</li>
				<li class="nav-item">
					<a href="#">문의하기</a>
				</li>
				<li class="nav-item">
					<a href="roadmap">오시는길</a>
				</li>
				<li class="nav-item">
					<a href="FAQ">고객센터</a>
				</li>
				<li class="nav-item">
					<a href="#">이벤트</a>
				</li>
				<li class="nav-item">
					<a href="folio">Portfolio</a>
				</li>
			</ul>
		</div>
		<div id="header_mid">
			<div id="header_mid_logo">
				<a href="home">
					<img src="images/logo.svg" width="14%"/>
				</a>
			</div>
			<div id="header_mid_sub">
				<div id="header_mid_social">
					<ul class="nav">
						<li class="nav-item">
							<a href="https://www.facebook.com/">
								<img src="images/facebook_icon.svg" width="28px"/>
							</a>
						</li>
						<li class="nav-item">
							<a href="https://www.instagram.com/">
								<img src="images/instargram_icon.svg" width="28px"/>
							</a>
						</li>
					</ul>
				</div>
				<div id="header_mid_search">
					<form action="item_search" method="GET">
						<div id="header_mid_search_input" style="border-radius:30px 0px 0px 30px / 30px 0px 0px 30px; height:30px; border:2px solid black;"> 
							<input type="text" placeholder="검색" name="value" style="width:12em; height:20px;"/>
						</div>
						
						<div style="border-radius:0px 30px 30px 0px / 0px 30px 30px 0px; border:2px solid black; width:40px; float:right; background-color:black; height:30px;">
							<button id="header_mid_search_button" type="submit">
								<img src="images/search_icon.svg" width="100%" style="margin-bottom:3px;"/>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<hr style="margin-bottom:5px;"/>
		<div id="header_bottom" style="font-size:18px;">
			<ul class="nav">
				<li class="nav-item">
					<a href="item?category=fashion&sort=P_CODE">의류/하네스</a>
				</li>
				<li class="nav-item">
					<a href="item?category=cat&sort=P_CODE">고양이</a>
				</li>
				<li class="nav-item">
					<a href="item?category=walk&sort=P_CODE">이동/산책</a>
				</li>
				<li class="nav-item">
					<a href="item?category=food&sort=P_CODE">사료/간식</a>
				</li>
				<li class="nav-item">
					<a href="item?category=dog&sort=P_CODE">강아지</a>
				</li>
			</ul>
		</div>
		
		<div>
			<div style="float:left;">
				<hr style="margin-top:5px; margin-bottom:15px; width:600px;"/>
			</div>

			<div style="float:right;"> 
			
				<div style="float:left; margin-right:55px; margin-top:-17px; font-size:30px; padding:0px; opacity:40%;">
					<a>&#183;</a>
				</div>
				
				<div style="float:right;">
					<hr style="margin-top:5px; margin-bottom:15px; width:600px;"/>
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>