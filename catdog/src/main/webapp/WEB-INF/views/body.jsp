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
<title>BODY</title>
</head>
<body>

<!-- BODY -->
<div id="body">
	<div id="body_carousel" class="carousel slide" data-ride="carousel" align="center">

		<ul class="carousel-indicators">
			<li data-target="#body_carousel" data-slide-to="0" class="active"></li>
			<li data-target="#body_carousel" data-slide-to="1"></li>
			<li data-target="#body_carousel" data-slide-to="2"></li>
			<li data-target="#body_carousel" data-slide-to="3"></li>
		</ul>
	
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/carousel/carousel01.png" alt="슬라이드배너1">
			</div>
			<div class="carousel-item">
				<img src="images/carousel/carousel02.png" alt="슬라이드배너2">
			</div>
			<div class="carousel-item">
				<img src="images/carousel/carousel03.png" alt="슬라이드배너3">
			</div>
			<div class="carousel-item">
				<img src="images/carousel/carousel04.png" alt="슬라이드배너3">
			</div>
		</div>
		
		<a class="carousel-control-prev" href="#body_carousel" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a>
		<a class="carousel-control-next" href="#body_carousel" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	
	<div id="body_promotion" class="d-flex mb-3">
		<div style="overflow:hidden;">
			<a href="#">
				<img src="images/promotion/banner01.png" width="100%" alt="프로모션1"/>
			</a>
		</div>
		<div style="overflow:hidden;">
			<a href="#">
				<img src="images/promotion/banner02.png" width="100%" alt="프로모션2"/>
			</a>
		</div>
	</div>
	<div id="body_category" class="d-flex">
		<div>
			<a href="item?category=fashion&sort=P_CODE">
				<img src="images/category/category01.png" alt="카테고리1"/>
			</a>
		</div>
		<div>
			<a href="item?category=walk&sort=P_CODE">
				<img src="images/category/category02.png" alt="카테고리2"/>
			</a>
		</div>
		<div>
			<a href="item?category=food&sort=P_CODE">
				<img src="images/category/category03.png" alt="카테고리3"/>
			</a>
		</div>
		<div>
			<a href="FAQ">
				<img src="images/category/category04.png" alt="카테고리4"/>
			</a>
		</div>
	</div>
	
	<p>인기상품</p>
	<span>HOT ITEM</span>
	<div id="item_hot">
		<div class="d-flex mb-3">
			<div>
				<div id="item_box">
					<a href="#">
						<div id="item_box_text">
							제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승<br/><br/>
							<strong>280,000원</strong>
						</div>
						<img src="images/items/hot/img1.PNG" alt="인기상품1"/>
					</a>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<div id="item_box_text">
							제라미펫 르네 강아지 고양이 이동가방 숄더백<br/><br/>
							<strong>39,000원</strong>
						</div>
						<img src="images/items/hot/img2.PNG" alt="인기상품2"/>
					</a>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<div id="item_box_text">
							제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승<br/><br/>
							<strong>280,000원</strong>
						</div>
						<img src="images/items/hot/img3.PNG" alt="인기상품3"/>
					</a>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<div id="item_box_text">
							제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승<br/><br/>
							<strong>280,000원</strong>
						</div>
						<img src="images/items/hot/img32.PNG" alt="인기상품4"/>
					</a>
				</div>
			</div>
		</div>
		<div class="d-flex">
			<div>
				<div id="item_box">
					<a href="#">
						<div id="item_box_text">
							제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승<br/><br/>
							<strong>280,000원</strong>
						</div>
						<img src="images/items/hot/img34.PNG" alt="인기상품5"/>
					</a>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<div id="item_box_text">
							제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승<br/><br/>
							<strong>280,000원</strong>
						</div>
						<img src="images/items/hot/img38.PNG" alt="인기상품6"/>
					</a>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<div id="item_box_text">
							제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승<br/><br/>
							<strong>280,000원</strong>
						</div>
						<img src="images/items/hot/img4.PNG" alt="인기상품7"/>
					</a>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<div id="item_box_text">
							제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승<br/><br/>
							<strong>280,000원</strong>
						</div>
						<img src="images/items/hot/img5.PNG" alt="인기상품8"/>
					</a>
				</div>
			</div>
		</div>
		<button id="button_more" class="btn btn-outline-secondary">더보기</button>
	</div>
	
	<p>신상품</p>
	<span>NEW ITEM</span>
	<div id="item_new">
		<div class="d-flex mb-4">
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/new/img0.PNG" alt="신상품1"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/new/img00.PNG" alt="신상품2"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/new/img31.PNG" alt="신상품3"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승
					<hr/>
					<span>280,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/new/img33.PNG" alt="신상품4"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
		</div>
		<div class="d-flex">
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/new/img35.PNG" alt="신상품5"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/new/img36.PNG" alt="신상품6"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/new/img37.PNG" alt="신상품7"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/new/img6.PNG" alt="신상품8"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
		</div>
		<button id="button_more" class="btn btn-outline-secondary">더보기</button>
	</div>
	
	<p>의류/하네스</p>
	<span>FASHION</span>
	<div id="item_new">
		<div class="d-flex mb-4">
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/fashion/img15.PNG" alt="의류1"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/fashion/img16.PNG" alt="의류2"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/fashion/img17.PNG" alt="의류3"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승
					<hr/>
					<span>280,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/fashion/img18.PNG" alt="의류4"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
		</div>
		<div class="d-flex">
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/fashion/img19.PNG" alt="의류5"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/fashion/img20.PNG" alt="의류6"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/fashion/img21.PNG" alt="의류7"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/fashion/img22.PNG" alt="의류8"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
		</div>
		<button id="button_more" class="btn btn-outline-secondary">더보기</button>
	</div>
	
	<p>이동/산책</p>
	<span>WALK</span>
	<div id="item_new">
		<div class="d-flex mb-4">
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/walk/img10.PNG" alt="이동1"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/walk/img11.PNG" alt="이동2"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/walk/img12.PNG" alt="이동3"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승
					<hr/>
					<span>280,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/walk/img13.PNG" alt="이동4"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
		</div>
		<div class="d-flex">
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/walk/img14.PNG" alt="이동5"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/walk/img7.PNG" alt="이동6"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/walk/img8.PNG" alt="이동7"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/walk/img9.PNG" alt="이동8"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
		</div>
		<button id="button_more" class="btn btn-outline-secondary">더보기</button>
	</div>
	
	<p>사료/간식</p>
	<span>FOOD</span>
	<div id="item_new">
		<div class="d-flex mb-4">
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/food/img23.PNG" alt="사료1"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/food/img24.PNG" alt="사료2"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/food/img25.PNG" alt="사료3"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 이비야야 대형견유모차 젠틀펫왜건 아미그린 25kg 탑승
					<hr/>
					<span>280,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/food/img26.PNG" alt="사료4"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
		</div>
		<div class="d-flex">
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/food/img27.PNG" alt="사료5"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/food/img28.PNG" alt="사료6"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/food/img29.PNG" alt="사료7"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
			<div>
				<div id="item_box">
					<a href="#">
						<img src="images/items/food/img30.PNG" alt="사료8"/>
					</a>
				</div>
				<div id="item_text">
					제라미펫 르네 강아지 고양이 이동가방 숄더백
					<hr/>
					<span>39,000원</span>
				</div>
			</div>
		</div>
		<button id="button_more" class="btn btn-outline-secondary">더보기</button>
	</div>
</div>

</body>
</html>