<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<link rel="stylesheet" type="text/css" href="res/css/home.css" />

<script src="res/js/bon.js"></script>

<style>
.container {
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
   z-index:100;
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
   z-index:101;
}
body	{font-family: 'Black Han Sans', sans-serif;}
table {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 52%;
}

td {
	text-align: center;
}

input {
	width: 98%;
	height: 40px;
	text-align: center;
	font-size: 15pt;
	color: #0BC904;
	font-family: 'Black Han Sans', sans-serif;
}

#state {
	text-align: left;
	padding-left: 20px;
}

#ips {
	text-align: right;
	padding-right: 20px;
}

#btn {
	background-color: #0BC904;
	color: #FFFFFF;
	width: 99%;
	height: 60px;
	border: 1px solid #0BC904;
	cursor: pointer;
}

.title {
	height: 80px;
	font-size: 20pt;
	background-color: #0BC904;
	color: #FFFFFF;
}

.line {
	height: 60px;
}
</style>
</head>
<body onLoad= "closeModalb()">
	<div class=circle></div>
	<div class=circle2></div>
	<div class=circle3></div>
	<div class=circle4></div>
	<div class=crcle5></div>
	<div class=circle6></div>

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

	<div class="underLine"></div>
	<div class="text">
		Do your<br>best work
	</div>

	<div class="somebody">Made by :: SOMEBODY</div>
	<div class="logIn">
		<input class="log" type="button" value="Log In" onClick = "meLogInModal()" />
	</div>
	
	
	<!-- 모달 제어-->
	<form name = "dynamicFormdata" action = "meLogin" method = "post">
	<div class="container" id="container">
		<div class="mdialog">
			<div class="mcontent">
				<!-- 모달헤더 -->
				<div class="hp" id = "mheader">
						H E L P
			<div id="plan" class="mtitle">Health Plan</div>
		</div>
				<!-- 모달 바디 -->
				<div class="mbody" id="mbody">
				<div >ID</div>
				<input type='text' class='id' name = 'meCode' placeholder='아이디를 입력하세요'/>
				<div>Password</div>	
				<input type='password' class='pw' name = 'mePw' />
				<input class="login" type="button" value="로그인" onClick = "meLogIn()" />
				<input class="login" type="button" value="직원로그인으로 가기" onClick = "ctLogInModal()" />
				</div>
				<!-- 모달 푸터 <div id = "list">${list} </div> -->
				<div class="mfooter">
					<button type="button" class="mbtn" value = "비밀번호수정" onclick="modPw()">비밀번호 수정</button>
					<button type="button" class="mbtn" value = "센터가입" onclick="joinForm()">가입</button>
					
				</div>
				
			</div>
		</div>
	</div>
	</form>
	
	
		<form name = "dynamicFormdata2" action = "ctLogin" method = "post">
	<div class="containerSF" id="containerSF">
		<div class="mdialog">
			<div class="mcontent">
				<!-- 모달헤더 -->
				<div class="hp" id = "mheader">
						H E L P
			<div id="plan" class="mtitle">Health Plan</div>
		</div>
				<!-- 모달 바디 -->
				<div class="mbody" id="mbody">
				<div >Center Business number</div>
				<input type='text' class='id' name = 'sfCtCode' placeholder='사업자번호를 입력하세요'/>
				<div >Staff code</div>
				<input type='text' class='id' name = 'sfId' placeholder='코드를 입력하세요'/>
				<div>Password</div>	
				<input type='password' class='pw' name = 'sfPw' />
				<input class="login" type="button" value="직원로그인" onClick = "ctLogIn()" />
				</div>
				<!-- 모달 푸터 <div id = "list">${list} </div> -->
				<div class="mfooter">
					<button type="button" class="mbtn" value = "비밀번호변경" onclick="modPw()">비밀번호 변경</button>
					<button type="button" class="mbtn" value = "회원가입" onclick="goMeJoinPage()">회원가입</button>
					<button type="button" class="mbtn" value = "센터가입" onclick="ctJoinForm()">센터가입</button>
					${sfInfo} 
				</div>
				
			</div>
		</div>
	</div>
	</form>
</body>
</html>