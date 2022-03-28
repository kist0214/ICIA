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

<style>
</style>
</head>
<body onLoad="infoLine()">
	<div class="firstTop">
		<div class="logo">
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

	<div id="middle">
		<div class="search">
			<section class="search-content">
				<div class="form-wrap ui-check-date" data-term="5">
					<input type="datetime-local" />
				</div>
				<select name="search">
					<option value="none">강사명</option>
					<option value="trainer">이동명</option>
					<option value="trainer">김한울</option>
				</select> <select name="search">
					<option value="none">수업명</option>
					<option value="lesson">스피닝</option>
					<option value="lesson">요가</option>
				</select> <span><input class="input" type="text" name="searchbox"
					placeholder="검색" /><i class='bx bx-search icon'
					onClick="searchLsMg(Lesson)"></i></span>
			</section>
		</div>
	</div>
	<div id="bottom">
		<section>
			<div class="swiper mySwiper container">
				<div class="swiper-wrapper content">

					<div class="swiper-slide card">
						<div class="card-content">
							<div class="image">
								<img src="res/images/lesson.jpg">
							</div>
							<div class="media-icons">
								<span>2022.03.01</span>
								<span>월 | 화 | 수</span>
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
								<span>2022.03.02</span>
								<span>화 | 수 | 금</span>
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
								<span>2022.03.02</span>
								<span>화 | 목 | 토</span>
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
								<span>수업날짜</span>
								<span>수업일</span>
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
								<span>수업날짜</span>
								<span>수업일</span>
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
								<span>수업날짜</span>
								<span>수업일</span>
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
								<span>수업날짜</span>
								<span>수업일</span>
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
								<span>수업날짜</span>
								<span>수업일</span>
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

		</section>
	</div>



	<script>
		//(start) 년월일 selectbox 윤달 처리
		function selectDateCheck() {
			// 현재 년월일 지정, 년월일 select 지정
			var nowDate = new Date(), nowYear = nowDate.getFullYear(), nowMonth = nowDate
					.getMonth() + 1, nowDay = nowDate.getDay(), _wrap = document
					.querySelectorAll('.ui-check-date'), _select = document
					.querySelectorAll('.ui-check-date select'), _year = document
					.querySelectorAll('.ui-check-date select[data-unit=y]'), _month = document
					.querySelectorAll('.ui-check-date select[data-unit=m]'), _day = document
					.querySelectorAll('.ui-check-date select[data-unit=d]'), yearTerm = 5; // default 년도 기간 설정
			// 초기 년도 설정
			// (1) data-tearm : 년도 기간 설정
			// (2) data-point : 년도 시점 설정
			for (var i = 0; i < _wrap.length; i++) {
				var startYear, endYear, setTerm = _wrap[i]
						.getAttribute('data-term') * 1, setPoint = _wrap[i]
						.getAttribute('data-point'), num = 0;

				_year[i].options[0] = new Option(_year[i]
						.getAttribute('data-default-option'), 'default'); // 'default' || ''

				// data-term 속성값이 있을 경우 기간 적용
				if (setTerm != null && setTerm != '') {
					yearTerm = setTerm;
				}

				// 년도 option 설정
				if (setPoint == 'up') {
					// 미래~현재
					startYear = nowYear + yearTerm;
					endYear = nowYear;
				} else if (setPoint == 'down' || setPoint == ''
						|| setPoint == null) {
					// 현재~과거
					startYear = nowYear;
					endYear = nowYear - yearTerm;
				} else {
					// up, down, null 이외의 값 지정
				}

				for (var j = startYear; j >= endYear; j--) {
					num++;
					_year[i].options[num] = new Option(j, j);
				}
			}

			// 초기 월 설정
			for (var i = 0; i < _wrap.length; i++) {
				_month[i].options[0] = new Option(_month[i]
						.getAttribute('data-default-option'), 'default');
				for (var j = 1; j <= 12; j++) {
					_month[i].options[j] = new Option(j, j);
				}
			}

			// 초기 일 절정
			for (var i = 0; i < _wrap.length; i++) {
				_day[i].options[0] = new Option(_day[i]
						.getAttribute('data-default-option'), 'default');
				for (var j = 1; j <= 31; j++) {
					_day[i].options[j] = new Option(j, j);
				}
			}

			// 년 선택 시, 일 설정 함수 실행
			for (var i = 0; i < _wrap.length; i++) {
				_year[i].addEventListener('change', selectSetDay, false);
			}

			// 월 선택 시, 일 설정 함수 실행
			for (var i = 0; i < _wrap.length; i++) {
				_month[i].addEventListener('change', selectSetDay, false);
			}

			// 일 설정 함수
			function selectSetDay() {
				// 평년 각 달의 일수 배열
				// 선택한 select 그룹의 년월일 option value
				var arrDay = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ], lastDay, wrap = this.parentNode, yearVal = wrap
						.querySelector('select[data-unit=y]').value, monthVal = wrap
						.querySelector('select[data-unit=m]').value, selectedDay = wrap
						.querySelector('select[data-unit=d]'), dayVal = selectedDay.value, defaultTxt = selectedDay
						.getAttribute('data-default-option'), defaultVal = 'default'; // 'default' || ''

				// 윤달체크 (true : 2월 마지막날 29일)
				if (yearVal % 4 == 0 && yearVal % 100 != 0
						|| yearVal % 400 == 0) {
					arrDay[1] = 29;
				}
				// 선택한 달의 일수 설정
				lastDay = (monthVal != defaultVal) ? arrDay[monthVal - 1] : 31;

				// 일 option 재설정
				selectedDay.options.length = 0; // option 목록 초기화
				selectedDay.options[0] = new Option(defaultTxt, defaultVal);
				for (var i = 1; i <= lastDay; i++) {
					selectedDay.options[i] = new Option(i, i);
				}

				// 선택한 날과 그 달의 마지막 날 비교
				// 선택한 날이 default가 아니고 마지막 날 보다 크면 : 마지막 날짜로 선택 일 변경
				// 아니면 : 선택한 날 그대로 가져감
				selectedDay.value = (dayVal != defaultVal && dayVal > lastDay) ? lastDay
						: dayVal;
			}
		}
		window.onload = function() {
			selectDateCheck();
		}
	</script>

	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 3,
			spaceBetween : 100,
			slidesPerGroup : 3,
			loop : true,
			loopFillGroupWithBlank : true,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	</script>

</body>
</html>