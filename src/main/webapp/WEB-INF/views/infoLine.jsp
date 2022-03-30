<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H E L P</title>
<script src="res/js/resource.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body onLoad = "infoLine()">

<div id = "topMenu">
	<div class = "menuContainer">
	<section class = "menuContainer">
	<article class="topmenu">
	<input type="button" id="meConfig" value = "환경설정" onClick="meConfig()"></input>
	<input type="button" id="meLessonMg" value = "레슨" onClick="meLessonMg()"/>
	<input type = "button" id="logOut" value ="로그아웃"onClick="logOut()"></input>
	</article>
	</section>
	</div>
</div>
<div id = "middleMenu">
	<div class = "menuContainer">
		<section class = "menuContainer">
			<article class = "member">
			<p>
			<span class="menuTitle" id="meDtInfo" onClick="meDtInf()">프로필</span>
			</p>
			<p>
			<span class="menuTitle" id="meInbodyMg" onClick="meInbodyMg()">인바디</span>
			</p>
			<p>
			<span class="menuTitle" id="psInBodyMg" onClick="psInBodyMg()">운동추천</span>
			</p>
			<p>
			<span class="menuTitle" id="meFoodMg" onClick="meFoodMg()">음식추천</span>
			</p>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</article>
</section>
</div>
</div>
	<div id="bottom">
		<div id="list">${list }</div>
	</div>
<script>
</script>
</body>
</html>