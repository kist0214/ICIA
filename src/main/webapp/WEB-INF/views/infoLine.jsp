<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H E L P</title>
<script src="res/js/resource.js"></script>
<script src="res/js/YInfoLine.js"></script>
<!----===== Boxicons CSS ===== -->
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="res/css/infoLine.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body onLoad="getCenterListInbody('${meInfo[0].meCode}')">

	<div class="firstTop">
		<div class="logo" onClick = "goHome()">
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
			<input type = "hidden" id = "caCode" value ='${meInfo[0].caCode}' />
		<span>${meInfo[0].meName}님 안녕하세요.</span>
		<span id="center"></span>
		
			<section>
				<article class="topmenu">
				
					<input type="button" id="meLessonMg" value="수업관리" onClick="meLessonMg()" />
					<input type="button" id="meConfig" value="환경설정" onClick="meConfig()"></input>
					<input type="button" id="logOut" value="로그아웃" onClick="logOut()"></input>
	
				</article>
			</section>
		</div>
	</div>



	<div class="circle"></div>
	<div class="circle2"></div>
	<!--<div class="circle3"></div> -->
	<div class="circle4"></div>
	<div class="middleDesign">
		<div class="middleDgn">
			시작은 언제나 오늘이다
			<div class="middleDgn-small">- Mary Wollstonecraft -</div>
		</div>
	</div>
	<div class="middleImg">
		<img src="res/images/trainer.svg" class="image" alt="" />
	</div>
	<div id="middleMenu">
		<section>
			<article class="member">
				<p>
					<input type="button" value="프로필" onClick="meDtInf('${meInfo[0].meCode}')">
				</p>
				<p>
					<input type="button" value="인바디" onClick="meInbodyMg('${meInfo[0].meCode}')">
				</p>
				<p>
					<input type="button" value="운동추천" onClick="psInBodyMg()">
				</p>
				<p>
					<input type="button" value="음식추천" onClick="meFoodMg()">
				</p>
			</article>
		</section>
	</div>
	<div id="bottom" style="text-align: center;">
		<div id="list" >${list }</div>
	</div>

	<div class="low">
		<div class="low-text">
			<div class="low-logo">Help : Health Plan</div>
			<div class="low-middle">
				<span>법인명 : ICIA 주식회사 |</span> <span>사업자 등록 번호 : 142-61-65784
					|</span> <span>만든 이 : SomeBody |</span> <span>통신판매업신고 :
					2019-서울강남-02231호</span>
			</div>
			<div class="low-copyright">&copy; 2022 Somebody All rights
				reserved.</div>
		</div>
	</div>

	

	

</body>
</html>