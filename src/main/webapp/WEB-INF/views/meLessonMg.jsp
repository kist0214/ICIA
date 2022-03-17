<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="res/js/resource.js"></script>
<style>
</style>
</head>




<body onLoad = "infoLine()">
<div id = "topMenu">
	<div class = "menuContainer">
	<section class = "menuContainer">
	<article class="topmenu">
	<span class="topMenu" id="meConfig" onClick="meConfig()">환경설정</span>
	<span class="topMenu" id="getLessonMg" onClick="meLessonMg()">레슨</span>
	<span class="topMenu" id="logOut" onClick="logOut()">로그아웃</span>
	</article>
	</section>
	</div>
</div>



<div id= "middle">
	<section class="searchMenu">
	<article class="middle">
				<div class="form-wrap ui-check-date" data-term="5">
						<select id="birthday-y-ko" title="연도 선택" data-default-option="연도 선택" data-unit="y">연도</select>
						<select id="birthday-m-ko" title="달 선택" data-default-option="달 선택" data-unit="m"></select>
						<select id="birthday-d-ko" title="일 선택" data-default-option="일 선택" data-unit="d"></select>
						<input type="datetime-local"/>
						<input type="time" />
				</div>
	
	<p>
		<select name="search">
			<option value="none">-강사명-</option>
			<option value="trainer">이동명</option>
			<option value="trainer">김한울</option>
		</select>
		<select name="search">
			<option value="none">-수업명-</option>
			<option value="lesson">스피닝</option>
			<option value="lesson">요가</option>
		</select>
		<input class = "input" type="text" name="searchbox" placeholder="Search" />
		<input class = "search" type = "button" value = "찾기" onClick = "searchLsMg(Lesson)" />
	</p>
	
	</article>
	</section>
</div>



<div id= "bottom">

</div>


<script>
 //(start) 년월일 selectbox 윤달 처리
function selectDateCheck(){
	// 현재 년월일 지정, 년월일 select 지정
	var nowDate = new Date(),
		nowYear = nowDate.getFullYear(),
		nowMonth = nowDate.getMonth() + 1,
		nowDay = nowDate.getDay(),
		_wrap = document.querySelectorAll('.ui-check-date'),
		_select = document.querySelectorAll('.ui-check-date select'),
		_year = document.querySelectorAll('.ui-check-date select[data-unit=y]'),
		_month = document.querySelectorAll('.ui-check-date select[data-unit=m]'),
		_day = document.querySelectorAll('.ui-check-date select[data-unit=d]'),
		yearTerm = 5;	// default 년도 기간 설정
	// 초기 년도 설정
	// (1) data-tearm : 년도 기간 설정
	// (2) data-point : 년도 시점 설정
	for(var i=0; i < _wrap.length; i++){
		var startYear,
			endYear,
			setTerm = _wrap[i].getAttribute('data-term') *1,
			setPoint = _wrap[i].getAttribute('data-point'),
			num = 0;
			
		_year[i].options[0] = new Option(_year[i].getAttribute('data-default-option'), 'default');	// 'default' || ''
		
		// data-term 속성값이 있을 경우 기간 적용
		if(setTerm != null && setTerm != ''){ yearTerm = setTerm; }
		
		// 년도 option 설정
		if(setPoint =='up'){
			// 미래~현재
			startYear = nowYear + yearTerm;
			endYear = nowYear;
		}else if(setPoint =='down' || setPoint =='' || setPoint == null) {
			// 현재~과거
			startYear = nowYear;
			endYear = nowYear - yearTerm;
		}else{
			// up, down, null 이외의 값 지정
		}
		
		for(var j=startYear; j>=endYear; j--){
			num++;
			_year[i].options[num] = new Option(j, j);
		}
	}
		
	// 초기 월 설정
	for(var i=0; i<_wrap.length; i++){
		_month[i].options[0] = new Option(_month[i].getAttribute('data-default-option'), 'default');
		for(var j=1; j<=12; j++){
			_month[i].options[j] = new Option(j, j);
		}
	}
	
	// 초기 일 절정
	for(var i=0; i<_wrap.length; i++){
		_day[i].options[0] = new Option(_day[i].getAttribute('data-default-option'), 'default');
		for(var j=1; j<=31; j++){
			_day[i].options[j] = new Option(j, j);
		}
	}
	
	// 년 선택 시, 일 설정 함수 실행
	for(var i=0; i<_wrap.length; i++){
		_year[i].addEventListener('change', selectSetDay, false);
	}
	
	// 월 선택 시, 일 설정 함수 실행
	for(var i=0; i<_wrap.length; i++){
		_month[i].addEventListener('change', selectSetDay, false);
	}
	
	// 일 설정 함수
	function selectSetDay(){
		// 평년 각 달의 일수 배열
		// 선택한 select 그룹의 년월일 option value
		var arrDay=[31,28,31,30,31,30,31,31,30,31,30,31],
			lastDay,
			wrap = this.parentNode,
			yearVal = wrap.querySelector('select[data-unit=y]').value,
			monthVal = wrap.querySelector('select[data-unit=m]').value,
			selectedDay = wrap.querySelector('select[data-unit=d]'),
			dayVal = selectedDay.value,
			defaultTxt = selectedDay.getAttribute('data-default-option'),
			defaultVal = 'default';	// 'default' || ''
			
		// 윤달체크 (true : 2월 마지막날 29일)
		if(yearVal%4 == 0 && yearVal%100 !=0 || yearVal%400 == 0){ arrDay[1]=29; }
		// 선택한 달의 일수 설정
		lastDay = (monthVal != defaultVal) ? arrDay[monthVal-1] : 31;
		
		// 일 option 재설정
		selectedDay.options.length = 0;	// option 목록 초기화
		selectedDay.options[0] = new Option(defaultTxt, defaultVal);
		for(var i=1; i<=lastDay; i++){
			selectedDay.options[i] = new Option(i, i);
		}
		
		// 선택한 날과 그 달의 마지막 날 비교
		// 선택한 날이 default가 아니고 마지막 날 보다 크면 : 마지막 날짜로 선택 일 변경
		// 아니면 : 선택한 날 그대로 가져감
		selectedDay.value = (dayVal != defaultVal && dayVal > lastDay) ? lastDay : dayVal;
	}
}
window.onload=function(){
	selectDateCheck();
}
</script>

</body>
</html>