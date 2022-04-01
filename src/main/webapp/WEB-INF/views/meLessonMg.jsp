<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>meLessonMg</title>
<script src="res/js/resource.js"></script>


<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="res/css/meLessonMg.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

<!-- Swiper JS -->

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


	<script>
		
	</script>
</head>
<body onLoad="getCenterList('${meInfo[0].meCode}')">
	<div class="firstTop">
		<div class="logo" >
			<div class="zero">
				<br>
				<div class="one"></div>
			</div>
			<div class="hp">
				H E L P
				<div id="plan">Health Plan</div>
			</div>
		</div>
		
		<div id="topMenu">
		<input type = "hidden" value='${meInfo[0].meCode}' />
	
		<span>${meInfo[0].meName}님 안녕하세요.</span>
			<div class="menuContainer">
				<section class="menuContainer">
					<article class="topmenu">

						<input type="button" id="meLessonMg" value="수업관리"
							onClick="meLessonMg()" /> <input type="button" id="meConfig"
							value="환경설정" onClick="meConfig()"></input> <input type="button"
							id="logOut" value="로그아웃" onClick="logOut()"></input>
					</article>
				</section>
			</div>
		</div>
	</div>
	<br><br><br>

	<div id="middle">

		<section class="searchMenu">
			<article class="middle">
				<div class="form-wrap ui-check-date" data-term="5">
					<p>
						<span id=category> </span> <input type="date" id="da" /> <span>
							<input type="text" class="input2" name="searchbox"> <input
							type="button" class="mbtn" value="검색" onclick="getctLessonList()" />
						</span>
					</p>
				</div>
			</article>
		</section>
		
	</div>
	
	<div id="bottom" >
	<img src='res/images/health.svg'>
		</div>
		

<!-- 

		<section>
			<div class="swiper mySwiper container">
				<div class="swiper-wrapper content">
					<div id="bottom">
					
					<div class="swiper-slide card">
						<div class="card-content">
							<div class="image">
								<img src="res/images/lesson.jpg">
							</div>
							<div class="media-icons">
								<span>2022.03.01</span> <span>월 | 화 | 수</span>
							</div>

							<div class="name-profession">
								<span class="name">하체강화훈련</span> <span class="profession">이동명</span>
							</div>

							<div class="rating">
								<span>수강인원 : 1/5</span>
							</div>

							<div class="button">
								<button class="aboutMe">신청하기</button>
								<button class="aboutMe">취소하기</button>
							</div>
						</div>
					</div>
					<div class="swiper-slide card">
						<div class="card-content">
							<div class="image">
								<img src="res/images/lesson2.jpg">
							</div>
							<div class="media-icons">
								<span>2022.03.02</span> <span>화 | 수 | 금</span>
							</div>

							<div class="name-profession">
								<span class="name">근력운동</span> <span class="profession">김한울</span>
							</div>

							<div class="rating">
								<span>수강인원 : 3/6</span>
							</div>

							<div class="button">
								<button class="aboutMe">신청하기</button>
								<button class="aboutMe">취소하기</button>
							</div>
						</div>
					</div>
					<div class="swiper-slide card">
						<div class="card-content">
							<div class="image">
								<img src="res/images/lesson3.jpeg">
							</div>
							<div class="media-icons">
								<span>2022.03.02</span> <span>화 | 목 | 토</span>
							</div>

							<div class="name-profession">
								<span class="name">벤치프레스</span> <span class="profession">이하나</span>
							</div>

							<div class="rating">
								<span>수강인원 : 7/10</span>
							</div>

							<div class="button">
								<button class="aboutMe">신청하기</button>
								<button class="aboutMe">취소하기</button>
							</div>
						</div>
					</div>
					<div class="swiper-slide card">
						<div class="card-content">
							<div class="image">
								<img src="res/images/noimage.jpg">
							</div>
							<div class="media-icons">
								<span>수업날짜</span> <span>수업일</span>
							</div>

							<div class="name-profession">
								<span class="name">수업이름</span> <span class="profession">트레이너명</span>
							</div>

							<div class="rating">
								<span>수강인원 : 7/10</span>
							</div>

							<div class="button">
								<button class="aboutMe">신청하기</button>
								<button class="aboutMe">취소하기</button>
							</div>
						</div>
					</div>
					<div class="swiper-slide card">
						<div class="card-content">
							<div class="image">
								<img src="res/images/noimage.jpg">
							</div>
							<div class="media-icons">
								<span>수업날짜</span> <span>수업일</span>
							</div>

							<div class="name-profession">
								<span class="name">수업이름</span> <span class="profession">트레이너명</span>
							</div>

							<div class="rating">
								<span>수강인원 : 7/10</span>
							</div>

							<div class="button">
								<button class="aboutMe">신청하기</button>
								<button class="aboutMe">취소하기</button>
							</div>
						</div>
					</div>
					<div class="swiper-slide card">
						<div class="card-content">
							<div class="image">
								<img src="res/images/noimage.jpg">
							</div>
							<div class="media-icons">
								<span>수업날짜</span> <span>수업일</span>
							</div>

							<div class="name-profession">
								<span class="name">수업이름</span> <span class="profession">트레이너명</span>
							</div>

							<div class="rating">
								<span>수강인원 : 7/10</span>
							</div>

							<div class="button">
								<button class="aboutMe">신청하기</button>
								<button class="aboutMe">취소하기</button>
							</div>
						</div>
					</div>
					<div class="swiper-slide card">
						<div class="card-content">
							<div class="image">
								<img src="res/images/noimage.jpg">
							</div>
							<div class="media-icons">
								<span>수업날짜</span> <span>수업일</span>
							</div>

							<div class="name-profession">
								<span class="name">수업이름</span> <span class="profession">트레이너명</span>
							</div>

							<div class="rating">
								<span>수강인원 : 7/10</span>
							</div>

							<div class="button">
								<button class="aboutMe">신청하기</button>
								<button class="aboutMe">취소하기</button>
							</div>
						</div>
						
					</div>
				

				</div>
			</div>
		
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
</div>
		</section>
		 -->




</body>
</html>