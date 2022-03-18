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
<script src="res/js/resource.js"  src="res/js/YGoods.js" src="res/js/YPay.js"  src="res/js/bon.js" src="res/js/Dong.js"> </script>

</head>
<body onLoad ="lessonMg('ajax/LessonMg', '${lsList}')">
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

		<div class="menu-bar">
			<div class="menu">

				<ul class="menu-links">
					<li class="nav-link"><a>
							<i class='bx bx-user icon' onClick="goMePage('${sfInfo.ctCode}')"></i> <span class="text nav-text">회원관리</span>
					</a></li>

					<li class="nav-link"><a>
							<i class='bx bx-group icon'  id="sfMg" onClick= "goSfPage('${sfInfo.ctCode}')"></i> <span class="text nav-text">직원관리</span>
					</a></li>

					<li class="nav-link"><a
						> <i
							class='bx bx-chalkboard icon'  id="lessonMg" onClick="goLessonPage('${sfInfo.ctCode}')"></i> <span class="text nav-text">수업관리</span>
					</a></li>

					<li class="nav-link"><a
					> <i
							class='bx bx-wrench icon' id="goodsMg" onClick="goGoodsPage('${sfInfo.ctCode}')"></i><span class="text nav-text">장비관리</span>
					</a></li>

					<li class="nav-link"><a>
							<i class='bx bx-credit-card icon' id="payMg" onClick="goPayPage('${sfInfo.ctCode}')"></i> <span
							class="text nav-text">결제관리</span>
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
					<input type="button" value="CREATE" onClick="insLsPay('${lsList}')"/>
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
			<button>
					<i class='bx bx-calendar-star icon' onClick="getLsCaList(this)"></i>
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
 <table id="ajax"></table>

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