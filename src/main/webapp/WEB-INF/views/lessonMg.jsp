<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!----======== CSS ======== -->
<link rel="stylesheet" href="res/css/lessonMg.css">
<!----===== Boxicons CSS ===== -->
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
	

<style>
.container2 {
	display : none;
	background-color: gray;
	background: rgba(0, 0, 0, 0.4);
	position: absolute;
	width: 100%;
	min-height: 100%;
	left: 0;
	top: 0;
	text-align: center;
	font-size: 17pt;
	font-weight: 700;
}
.container3 {
	display : none;
	background-color: gray;
	background: rgba(0, 0, 0, 0.4);
	position: absolute;
	width: 100%;
	min-height: 100%;
	left: 0;
	top: 0;
	text-align: center;
	font-size: 17pt;
	font-weight: 700;
}
.container4 {
	display : none;
	background-color: gray;
	background: rgba(0, 0, 0, 0.4);
	position: absolute;
	width: 100%;
	min-height: 100%;
	left: 0;
	top: 0;
	text-align: center;
	font-size: 17pt;
	font-weight: 700;
}
.mdialog {
	border: 2px solid white;
	border-radius: 25px;
	background-color: #ffffff;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 70%;
	height: 750px;
	transform: translate(-50%, -50%);
	font-size: 17pt;
	font-weight: 700;
}
</style>

<title>LessonManament</title>
<script src="res/js/resource.js"> </script>
<script src="res/js/bon.js"> </script>
<script src="res/js/Dong.js"> </script>

</head>
<body onLoad ="lessonMg('${sfInfo.ctCode}')">
	<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image"> <!--<img src="logo.png" alt="">-->
				</span>

				<div class="text logo-text">
					<span class="name" onClick="meMg()">HELP</span> <span class="profession"  onClick="goMePage('${sfInfo.ctCode}')">Health
						Plan </span>
				</div>
			</div>

			<i class='bx bx-chevron-right toggle'></i>
		</header>
		
		<div class="explainLs">
			Lesson<br> LessonManagement 
			<span onClick="getLsCaList(this)">수업가격설정</span>
			<form name='dynamicFormData'>
		<div class="container2" id="container2">
			<div class="mdialog">
				<div class="mcontent">
					<div class="mheader">
						<h4 id=mheader class="mtitle">수업가격 설정</h4>
					</div>
					<label for="lsCa"></label> 
				<select>
					<option value="수업유형" selected>수업유형</option>
					<option value="일반">일반</option>
					<option value="PT">PT</option>
					<option value="요가">요가</option>
					<option value="필라테스">필라테스</option>
					<option value="줌바댄스">줌바댄스</option>
					<option value="스피닝">스피닝</option>
				</select></br></br>
					<div>수량 | 개월</div>
					<input class="input" type="text"  name = "lsMonth"/></br></br>
					<div>가격</div>
					<input class="input" type="text" name = "lpPrice" placeholder="가격을 입력하세요."/></br></br>
					<input type="button" value="CREATE" onClick="insLsPay('${lsList}')"/>
					<div class="mfooter">
						<input type="button" class="mbtn" value="닫기" onclick="closeModal2()" />						
					</div>
				</div>
			</div>
		</div>
		
	</form>
	
			<span onClick="getMaxLesson(this)">수업추가</span> 
				<form name='dynamicFormData'>
		<div class="container3" id="container3">
			<div class="mdialog">
				<div class="mcontent">
					<div class="mheader">
						<h4 id=mheader class="mtitle">수업 추가</h4>
					</div>
					<div>수업명</div>
					<input class="input" type="text"  name = "lsName" placeholder="수업명을 입력하세요."/></br></br>
					<div>개강일</div>
					<script>
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
						_year[i]
								.addEventListener('change', selectSetDay, false);
					}
					// 월 선택 시, 일 설정 함수 실행
					for (var i = 0; i < _wrap.length; i++) {
						_month[i].addEventListener('change', selectSetDay,
								false);
					}
					// 일 설정 함수
					function selectSetDay() {
						// 평년 각 달의 일수 배열
						// 선택한 select 그룹의 년월일 option value
						var arrDay = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31,
								30, 31 ], lastDay, wrap = this.parentNode, yearVal = wrap
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
						lastDay = (monthVal != defaultVal) ? arrDay[monthVal - 1]
								: 31;
						// 일 option 재설정
						selectedDay.options.length = 0; // option 목록 초기화
						selectedDay.options[0] = new Option(defaultTxt,
								defaultVal);
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
					<div class="form-wrap ui-check-date" data-term="5">
				<select id="birthday-y-ko" title="연도 선택" data-default-option="연도 선택"
					data-unit="y">연도</select> 
				<select id="birthday-m-ko" title="달 선택" data-default-option="달 선택"
					data-unit="m"></select> <select id="birthday-d-ko" title="일 선택"
					data-default-option="일 선택" data-unit="d"></select><label for="trainerName"></label></br></br>
					</div>
					<div>수업시간</div>
					<input type="time"/></br></br>
					<div>트레이너명</div>
					<input class="input" type="text" name="sfName" placeholder="트레이너명을 입력하세요."/></br></br> 
					<div>수업 날짜</div>
					<label><input type="checkbox" name="date" value="월"> 월</label>
					<label><input type="checkbox" name="date" value="화"> 화</label>
					<label><input type="checkbox" name="date" value="수"> 수</label>
					<label><input type="checkbox" name="date" value="목"> 목</label>
					<label><input type="checkbox" name="date" value="금"> 금</label>
					<label><input type="checkbox" name="date" value="토"> 토</label>
					<label><input type="checkbox" name="date" value="일"> 일</label></br></br>
					<div>수강 인원</div>
					<input class="input" type="text" placeholder="인원 수를 입력하세요."/></br></br>
					<div class="mfooter">
					<input type="button" value="CREATE" onClick="insLesson'${lsList}')"/>
						<input type="button" class="mbtn" value="닫기" onclick="closeModal3()" />						
					</div>
				</div>
			</div>
		</div>
	</form>
			<span onClick="modLessonModal(this)">수업수정</span>
			<form name='dynamicFormData'>
		<div class="container4" id="container4">
			<div class="mdialog">
				<div class="mcontent">
					<div class="mheader">
						<h4 id=mheader class="mtitle">수업 수정</h4>
					</div>
					<div>수업명</div>
					<input class="input" type="text"  name = "lsName" placeholder="수업명을 입력하세요." readOnly="readOnly"/></br></br>
					<div>개강일</div>
					<script>
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
						_year[i]
								.addEventListener('change', selectSetDay, false);
					}
					// 월 선택 시, 일 설정 함수 실행
					for (var i = 0; i < _wrap.length; i++) {
						_month[i].addEventListener('change', selectSetDay,
								false);
					}
					// 일 설정 함수
					function selectSetDay() {
						// 평년 각 달의 일수 배열
						// 선택한 select 그룹의 년월일 option value
						var arrDay = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31,
								30, 31 ], lastDay, wrap = this.parentNode, yearVal = wrap
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
						lastDay = (monthVal != defaultVal) ? arrDay[monthVal - 1]
								: 31;
						// 일 option 재설정
						selectedDay.options.length = 0; // option 목록 초기화
						selectedDay.options[0] = new Option(defaultTxt,
								defaultVal);
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
					<div class="form-wrap ui-check-date" data-term="5">
				<select id="birthday-y-ko" title="연도 선택" data-default-option="연도 선택"
					data-unit="y">연도</select> 
				<select id="birthday-m-ko" title="달 선택" data-default-option="달 선택"
					data-unit="m"></select> <select id="birthday-d-ko" title="일 선택"
					data-default-option="일 선택" data-unit="d"></select><label for="trainerName"></label></br></br>
					</div>
					<div>수업시간</div>
					<input type="time"/></br></br>
					<div>트레이너명</div>
					<input class="input" type="text" name="sfName" placeholder="트레이너명을 입력하세요."/></br></br> 
					<div>수업 날짜</div>
					<label><input type="checkbox" name="date" value="월"> 월</label>
					<label><input type="checkbox" name="date" value="화"> 화</label>
					<label><input type="checkbox" name="date" value="수"> 수</label>
					<label><input type="checkbox" name="date" value="목"> 목</label>
					<label><input type="checkbox" name="date" value="금"> 금</label>
					<label><input type="checkbox" name="date" value="토"> 토</label>
					<label><input type="checkbox" name="date" value="일"> 일</label></br></br>
					<div>수강 인원</div>
					<input class="input" type="text" placeholder="인원 수를 입력하세요."/></br></br>
					<div class="mfooter">
					<input type="button" value="MODIFY" onClick="modLesson'${lsList}')"/>
						<input type="button" class="mbtn" value="닫기" onclick="closeModal4()" />						
					</div>
				</div>
			</div>
		</div>
	</form>
			<span onClick="delLesson()">수업삭제</span>
		</div>
		<div class="infoLs">
	<script>	
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
						_year[i]
								.addEventListener('change', selectSetDay, false);
					}
					// 월 선택 시, 일 설정 함수 실행
					for (var i = 0; i < _wrap.length; i++) {
						_month[i].addEventListener('change', selectSetDay,
								false);
					}
					// 일 설정 함수
					function selectSetDay() {
						// 평년 각 달의 일수 배열
						// 선택한 select 그룹의 년월일 option value
						var arrDay = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31,
								30, 31 ], lastDay, wrap = this.parentNode, yearVal = wrap
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
						lastDay = (monthVal != defaultVal) ? arrDay[monthVal - 1]
								: 31;
						// 일 option 재설정
						selectedDay.options.length = 0; // option 목록 초기화
						selectedDay.options[0] = new Option(defaultTxt,
								defaultVal);
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
			<div class="form-wrap ui-check-date" data-term="5">
				<select id="birthday-y-ko" title="연도 선택" data-default-option="연도 선택"
					data-unit="y">연도
				</select> 
				<select id="birthday-m-ko" title="달 선택" data-default-option="달 선택"
					data-unit="m"></select> <select id="birthday-d-ko" title="일 선택"
					data-default-option="일 선택" data-unit="d"></select> <input
					type="time" /> <label for="trainerName"></label> 
					<select id="lsSearch">
					<option value="트레이너별" selected>트레이너별</option>
					<option value="이동명">이동명</option>
					<option value="이유미">이유미</option>
					<option value="이유미">김한울</option>
				</select> <label for="lsName"></label> 
				<select id="lsSearch1">
					<option value="수업유형" selected>수업유형</option>
					<option value="일반">일반</option>
					<option value="PT">PT</option>
					<option value="요가">요가</option>
					<option value="필라테스">필라테스</option>
					<option value="줌바댄스">줌바댄스</option>
					<option value="스피닝">스피닝</option>
				</select>
					 <span>search</span> 
					 <input type="text" class="searchLs" /> 
					 <input type="button" class="lsSearchBtn" value="검색" 
					 onClick="searchLesson('${sfInfo.ctCode}')"/>
			</div>
		
		<div class="menu-bar">
			<div class="menu">

			<ul class="menu-links">
					<li class="nav-link"onClick="goMePage('${sfInfo.ctCode}')"><a>
					<i class='bx bx-user icon'></i> 
					<span class="text nav-text">회원관리</span>
					</a></li>

					<li class="nav-link" onClick="goSfPage('${sfInfo.ctCode}')"><a>
					<i class='bx bx-group icon'id="sfMg" ></i> 
					<span class="text nav-text">직원관리</span>
					</a></li>

					<li class="nav-link" onClick="goLessonPage('${sfInfo.ctCode}')"><a> 
					<i class='bx bx-chalkboard icon' id="lessonMg"></i>
					<span class="text nav-text">수업관리</span>
					</a></li>

					<li class="nav-link" onClick="goGoodsPage('${sfInfo.ctCode}')"><a>
					<i class='bx bx-wrench icon' id="goodsMg" ></i>
					<span class="text nav-text">장비관리</span>
					</a></li>

					<li class="nav-link" onClick="goPayPage('${sfInfo.ctCode}')"><a> 
					<i class='bx bx-credit-card icon' id="payMg"></i> 
					<span class="text nav-text">결제관리</span>
					</a></li>


				</ul>
			</div>

			<div class="bottom-content">
				<li class=""><a href="#"> <i class='bx bx-id-card icon'></i>
						<span class="text nav-text"></span><span class="text nav-text">	<span>${sfInfo.sfName}</span>
						<span>(${sfInfo.sfRankName})</span></span> <span class="text nav-text"></span>
				</a></li>

				<li class=""><a href="#"> <i class='bx bx-log-out icon' onClick="logOut('${sfInfo.ctCode}','${sfInfo.sfId}')"></i>
						<span class="text nav-text" onClick="logOut('${sfInfo.ctCode}','${sfInfo.sfId}')">로그아웃</span>
				</a></li>

				<li class="mode">
					<div class="sun-moon">
						<i class='bx bx-moon icon moon'></i> <i class='bx bx-sun icon sun'></i>
					</div> <span class="mode-text text">다크모드</span>

					<div class="toggle-switch">
						<span class="switch"></span>
					</div>
				</li>

			</div>
		</div>

	</nav>

	<section class="home">
		<div class="text">LessonManament</div>
		
		
		<div class="search">
			<div class="nav-search">
			
				<form name='dynamicFormData'>
		<div class="container2" id="container2">
			<div class="mdialog">
				<div class="mcontent">
					<div class="mheader">
					
					</div>
					<label for="lsCa"></label> 
				<select class="select">
					<option value="수업유형" selected>수업유형</option>
					<option value="일반">일반</option>
					<option value="PT">PT</option>
					<option value="요가">요가</option>
					<option value="필라테스">필라테스</option>
					<option value="줌바댄스">줌바댄스</option>
					<option value="스피닝">스피닝</option>
				</select></br></br>
					<div>수량 | 개월</div>
					<input class="input" type="text"  name = "lsMonth"/></br></br>
					<div>가격</div>
					<input class="input" type="text" name = "lpPrice" placeholder="가격을 입력하세요."/></br></br>
					<input type="button" value="CREATE" onClick="insLsPay('${sfInfo.ctCode}')"/>
					<div class="mfooter">
						<input type="button" class="mbtn" value="닫기" onclick="closeModal2()" />						
					</div>
				</div>
			</div>
		</div>
	</form>
			</div>

		</div>
		<div class="etc">
	
			<div>
			<button  onClick="getLsCaList(this)">
					<i class='bx bx-calendar-star icon'></i>
				</button>
				<button>
					<i class='bx bx-calendar-plus icon'></i>
				</button>
				<button>
					<i class='bx bx-calendar-edit icon'></i>
				</button>
				<button>
					<i class='bx bx-calendar-minus icon'></i>
				</button>
			</div>
		</div>
 <table id="list"></table>

	</section>

	<script>
	 const body = document.querySelector('body'),
     sidebar = body.querySelector('nav'),
     toggle = body.querySelector(".toggle"),
     //searchBtn = body.querySelector(".search-box"),
     modeSwitch = body.querySelector(".toggle-switch"),
     modeText = body.querySelector(".mode-text");
	toggle.addEventListener("click" , () =>{
   sidebar.classList.toggle("close");
	})
	modeSwitch.addEventListener("click" , () =>{
   body.classList.toggle("dark");
   
   if(body.classList.contains("dark")){
       modeText.innerText = "라이트모드";
   }else{
       modeText.innerText = "다크모드";
       
   }
	});
	</script>

</body>