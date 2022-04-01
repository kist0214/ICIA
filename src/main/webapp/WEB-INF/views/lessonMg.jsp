<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html></html>
<head>
<meta charset="UTF-8">
<!----======== CSS ======== -->
<link rel="stylesheet" href="res/css/lessonMg.css">
<!----===== Boxicons CSS ===== -->
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>


<style>
.container2 {
	display: none;
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
	display: none;
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
	display: none;
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
<script src="res/js/YLesson.js"> </script>
</head>
<body onLoad="lessonMg('${sfInfo.ctCode}')">
	<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image"> <!--<img src="logo.png" alt="">-->
				</span>

				<div class="text logo-text" onClick="goMePage('${sfInfo.ctCode}')">
					<span class="name">HELP</span> <span class="profession">Health
						Plan </span>
				</div>
			</div>

			<i class='bx bx-chevron-right toggle'></i>
		</header>

		<div class="menu-bar">
			<div class="menu">

				<ul class="menu-links">
					<li class="nav-link" onClick="goMePage('${sfInfo.ctCode}')"><a>
							<i class='bx bx-user icon'></i> <span class="text nav-text">회원관리</span>
					</a></li>

					<li class="nav-link" onClick="goSfPage('${sfInfo.ctCode}')"><a>
							<i class='bx bx-group icon' id="sfMg"></i> <span
							class="text nav-text">직원관리</span>
					</a></li>

					<li class="nav-link" onClick="goLessonPage('${sfInfo.ctCode}')"><a>
							<i class='bx bx-chalkboard icon' id="lessonMg"></i> <span
							class="text nav-text">수업관리</span>
					</a></li>

					<li class="nav-link" onClick="goGoodsPage('${sfInfo.ctCode}')"><a>
							<i class='bx bx-wrench icon' id="goodsMg"></i> <span
							class="text nav-text">장비관리</span>
					</a></li>

					<li class="nav-link" onClick="goPayPage('${sfInfo.ctCode}')"><a>
							<i class='bx bx-credit-card icon' id="payMg"></i> <span
							class="text nav-text">결제관리</span>
					</a></li>


				</ul>
			</div>

			<div class="bottom-content">
				<li class=""><a> <i class='bx bx-id-card icon'></i>
						<span class="text nav-text"></span><span class="text nav-text">
							<span>${sfInfo.sfName}</span> <span>(${sfInfo.sfRankName})</span>
					</span> <span class="text nav-text"></span>
				</a></li>

				<li class=""><a
					onClick="logOut('${sfInfo.ctCode}','${sfInfo.sfId}')"> <i
						class='bx bx-log-out icon'></i> <span class="text nav-text">로그아웃</span>
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
		<div class="text">수업관리</div>


		<div class="search">
			<div class="nav-search">

				<div data-term="5">
					<input type="month" name="bdaytime" />
				</div>
				<select id="searchSf">
					<option value="sfName">이름</option>
					<option value="lsName">수업명</option>
				</select> <span> <input class="lsSearchBtn" type="text"
					placeholder="검색"> <i
					onclick="searchLesson('${sfInfo.ctCode}')"
					class='bx bx-search icon'></i></span>

			</div>

		</div>
		<div class="etc">

			<div>
				<button onClick="getLsCaList(this)">
					<i class='bx bx-calendar-star icon'></i>
				</button>
				<button onClick="getMaxLesson('${sfInfo.ctCode}','${sfInfo.sfId}')">
					<i class='bx bx-calendar-plus icon'></i>
				</button>
				<button onClick="modLsModal('','${sfInfo.ctCode}')">
					<i class='bx bx-calendar-edit icon'></i>
				</button>
				<button onClick="delLs('${sfInfo.ctCode}')">
					<i class='bx bx-calendar-minus icon'></i>
				</button>
			</div>
		</div>

		<form name='dynamicFormData'>
			<div class="container2" id="container2">
				<div class="mdialog">
					<div class="mcontent">
						<br><br><div class="mheader">수업 가격 설정</div><br>
						<div>센터번호</div>
						<input class="input" type="text" name="ctCode"
							value="${sfInfo.ctCode}" /><br> <label for="lsCa"></label><br>
							<div>수업 유형</div>
						<select class="select" name="caCode2">
							<option value="L0">일반</option>
							<option value="L1">PT</option>
							<option value="L2">요가</option>
							<option value="L3">필라테스</option>
							<option value="L4">줌바댄스</option>
							<option value="L5">스피닝</option>
						</select><br> <br>
						<div>수량 | 개월</div>
						<input class="input" type="text" name="lpQty" placeholder="수량 | 개월을 입력하세요."/><br> <br>
						<div>가격</div>
						<input class="input" type="text" name="lpPrice"
							placeholder="가격을 입력하세요." /><br> <br> <input
							type="button" value="CREATE" onClick="insLsPay()" />
						<div class="mfooter">
							<input type="button" class="mbtn" value="닫기"
								onclick="closeModal2()" />
								
						</div>
					</div>
				</div>
			</div>
		</form>

		<form name='dynamicFormData'>
			<div class="container3" id="container3">
				<div class="mdialog">
					<div class="mcontent">
						<div class="mheader">
							<br>
							<h4 id=mheader class="mtitle">수업 추가</h4>
							<br>
						</div>
						<div>사원번호</div>
						<input class="input" type="text" name="sfCode" value="${sfInfo.sfId}"/><br>
						<div>트레이너명</div>
						<input class="input" type="text" name="sfName" value="${sfInfo.sfName}" /><br>
						<div>수업번호</div>
						<input class="input" type="text" name="lsCode"/><br>
						<div>수업 유형</div>
						<select class="select" name="caCode">
							<option value="L0">일반</option>
							<option value="L1">PT</option>
							<option value="L2">요가</option>
							<option value="L3">필라테스</option>
							<option value="L4">줌바댄스</option>
							<option value="L5">스피닝</option>
						</select><br>
						<div>수업명</div>
						<input class="input" type="text" name="lsName"
							placeholder="수업명을 입력하세요." /><br>
						<div>개강일</div>
						<div class="form-wrap ui-check-date" data-term="5">
							<input type="datetime-local" name="lsOpen" />
						</div>
						<div>수업 진행</div>
						<input type= "text" name="lsProgress" placeholder="00000000000000"/>
						<div>수강 인원</div>
						<input class="input" type="text" name="lsMeCount" placeholder="인원 수를 입력하세요." /><br> 
							
						<div class="mfooter">
							<input type="button" value="CREATE"
								onClick="insLesson('${sfInfo.ctCode}')" /> <input type="button"
								class="mbtn" value="닫기" onclick="closeModal3()" />
						</div>
					</div>
				</div>
			</div>
		</form>
<div class="mModal" id="gModal">
		<div class="memberLog">
			<div class="mContent">
				<div class="mheader">
					<h4 class="mtitle" id="mdtitle"></h4>
				</div>
				<div class="mbody" id="mdbody"></div>
				<div class="mbody" id="mbody">
					<input type="button" class="mbtn" onclick="YcloseModal()" value="닫기" />
				</div>
			</div>
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