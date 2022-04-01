<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!----======== CSS ======== -->
<link rel="stylesheet" href="res/css/meMg.css">
<!----===== Boxicons CSS ===== -->
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<style>
.containerIn {
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
<title>MemberManagement</title>
<script src="res/js/resource.js"></script> 
<script src="res/js/Dong.js"></script> 
<script src="res/js/bon.js"></script> 
<script src="res/js/YMember.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</head>
<body  onload="getMeMg('${ctCode}','${sfInfo.sfRank}','${sfInfo.sfId}')"  >
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
				<li class=""><a> <i class='bx bx-id-card icon'></i> <span
						class="text nav-text"></span> <span class="text nav-text">
							<span>${sfInfo.sfName}</span> <span>(${sfInfo.sfRankName})</span>
					</span>
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
		<div class="text">회원관리</div>
		<div class="search">
			<div class="nav-search">
				<select class="select" id='select' onchange="searchMeCharTwo('${ctCode}','${sfInfo.sfRank}','${sfInfo.sfId}')">
					<option selected value="1">회원유형</option>
					<option value='meName'>이름</option>
					<option value='meNumber'>연락처</option>
					<option value='L0'>일반</option>
					<option value='M2'>만료</option>
					<option value='L1'>PT</option>
					<option value='L2'>요가</option>
					<option value='L3'>필라테스</option>
					<option value='L4'>줌바댄스</option>
					<option value='L5'>스피닝</option>
					
				</select>
				<span>
				 <input type="text" id='searchText'placeholder="검색">
				 <i onclick="searchMe('${ctCode}')" class='bx bx-search icon'></i>
				</span>
			</div>
		</div>
		<div class="etc">
			<div>
				<button onClick="getCaList('${ctCode}')">
					<i class='bx bx-user-plus icon'></i><span></span>
				</button>
				<button onClick="openModalIn()">
					<i class='bx bx-edit-alt icon'></i>
				</button>
			</div>
		</div>
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
	</div>
<table id="ajax"></table>

	
	<form name="containerIn" action="insInbody" method="post"
			enctype="multipart/form-data">
			<div class="containerIn" id="containerIn">
				<div class="mdialog">
					<div class="mcontent">
						<div class="mheader">


							<span class="title"></span><br> <br> <br> <br>
							<br> <br> <span>회원인바디 엑셀파일 업로드</span><br> <br>
							<br>
						</div>
					</div>
					<div class="line">
						<input type="file" name="file" multiple />
					</div>
					<div>
						<br> <input type="button" id="btn" value="인바디 파일 전송"
							onClick="UploadinbodyFile()" /><br><br>
							<input type="button" class="mbtn" value="닫기" onClick="closeModalIn()"/>
					</div>
					<br> <br>
					<div id=msg></div>
					
				</div>

			</div>
		</form>
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
</html>
