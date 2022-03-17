<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="res/js/resource.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
span {
	margin: 5px;
	color: #000000;
}
#top {
	text-align: right;
	background-color: #BDBDBD;
}
#btn {
	color: #ffffff;
	height: 30px;
	border: 1px solid #000000;
	font-weight: 800;
	background-color: #000000;
	cursor: pointer;
}
#sideMenu {
	background-color: #BDBDBD;
	position: absolute;
	height: 95%;
	width: 18%;
	float: left;
}
#middle {
	color: #000000;
	position: absolute;
	top: 5%;
	left: 20%;
	font-weight: 800;
	font-size: 15pt;
}
h2 {
	font-size: 15pt;
	margin: 20px 0 20px 20px;
}
.menuContainer {
	width: 90%;
	margin: 0 auto;
}
.managements {
	margin-bottom: 13pt;
	background: #fff;
}
.menuTitle {
	padding: 5px;
	color: #fff;
	background: #333;
	cursor: pointer;
	text-align: center;
}
.items {
	padding: 0 20px 3px 20px;
	font-size: 10pt;
	text-align: center;
	}
.container {
   background-color: gray;
   background: rgba(0, 0, 0, 0.4);
   position: absolute;
   width: 100%;
   min-height: 100%;
   left: 0;
   top: 0;
   text-align:center;
   display : none;
}
.mdialog {border :2px solid white;
   border-radius: 25px;
   background-color: #ffffff;
   position: absolute;
   top: 50%;
   left: 50%;
   width: 60%;
   height: 450px;
   transform: translate(-50%,-50%);
}
</style>
</head>

<body onLoad = "meProfile()">
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
<div>
<div id = "profile" class = "profile">
<form id= "profile2">
	<span id = "meEmail" class = "profile">${meEmail }</span><br>
	<span id = "meGender" class = "profile">${meGender }</span><br>
	<span id = "meBirth" class = "profile">${meBirth }</span><br>
	<span id = "meName" class = "profile">${meName }</span><br>
	<span id = "meNumber" class = "profile">${meNumber }</span><br>
</form>
</div>
</div>
<form name = "fire">
	<button id="bottom" class = "modal" type = "button" onClick = "openModal()" >회원 탈퇴</button>
	<!-- 모달 제어-->
	<div class="container" id="container">
		<div class="mdialog">
			<div class="mcontent">
				<!-- 모달헤더 -->
				<div class="mheader" id = "mheader" name="fire">
					<h4 class="mtitle">회원탈퇴</h4>
				</div>
				<!-- 모달 바디 -->
				<div class="mbody" id="mbody" value="body"></div>
				<!-- 모달 푸터 -->
				<div class="mfooter">
					<input type="password" id="mePw" placeHolder ="password"/><br>
					<span>**주의**<br>탈퇴 시 개인정보가 파기됩니다.<br>정말 탈퇴하시겠습니까?</span>
					<input id = "okay" type="button" class="mbtn" name = "fire" value = "확인" onClick="checkMePw()"/>
					<button type="button" class="mbtn" value = "취소" onclick="closeModal()">취소</button>
					
				</div>
			</div>
		</div>
	</div>
	</form>
	<form name = "mod">
	<button id="bottom" class = "modal" type = "button" value = "수정" onClick = "openModal1()" >수정</button>
	<!-- 모달 제어-->
	<div class="container" id="container1">
		<div class="mdialog">
			<div class="mcontent">
				<!-- 모달헤더 -->
				<div class="mheader" id = "mheader">
					<h4 class="mtitle">비밀번호 확인</h4>
				</div>
				<!-- 모달 바디 -->
				<div class="mbody" id="mbody" value="body"></div>
				<!-- 모달 푸터 -->
				<div class="mfooter">
					<input type="password" class="modMe" id="mePw1" placeHolder ="password"/><br>
					<span>비밀번호를 입력해주세요.</span>
					<input id = "okay" type="button" class="mbtn" name = "CheckMePw1" value = "확인" onClick="checkMePw2()"/>
					<button type="button" class="mbtn" value = "취소" onclick="closeModal1()">취소</button>
					
				</div>
			</div>
		</div>
	</div>
	</form>
<script>
</script>


</body>
</html>