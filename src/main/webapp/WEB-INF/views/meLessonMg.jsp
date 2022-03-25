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

<body onLoad="getCenterList('${meInfo[0].meCode}')">
	<div id="topMenu">
		<div class="menuContainer">
			<section class="menuContainer">
				<article class="topmenu">
					<span class="topMenu" id="meConfig" onClick="meConfig()">환경설정</span>
					<span class="topMenu" id="getLessonMg" onClick="meLessonMg()">레슨</span>
					<span class="topMenu" id="logOut" onClick="logOut()">로그아웃</span>
				</article>
			</section>
		</div>
	</div>



	<div id="middle">
		<div>${meInfo[0].meName}님환영</div>
		<section class="searchMenu">
			<article class="middle">
				<div class="form-wrap ui-check-date" data-term="5">
					<input type="date" id="da" />
					<p>
					<span id=category> </span>
					
					<span><input type="text" class="input" >
					<input type="button" class="mbtn"  value="검색"
								onclick="getctLessonList()" />
								</span>
					
				
					
			</article>
		</section>
	</div>



	<div id="bottom"></div>



</body>
</html>