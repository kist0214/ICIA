<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!----======== CSS ======== -->
<link rel="stylesheet" href="res/css/sfMg.css">
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

.container {
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

.container1 {
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
<title>StaffManament</title>
<script src="res/js/bon.js"></script>
<script src="res/js/Dong.js"></script>
<script src="res/js/resource.js"></script>



</head>
<body onLoad="sfMg('${sfInfo.ctCode}')">
	<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image"> <!--<img src="logo.png" alt="">-->
				</span>

				<div class="text logo-text">
					<span class="name">HELP</span> <span class="profession"
						onClick="goMePage('${sfInfo.ctCode}')">Health Plan </span>
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
				<li class=""><a href="#"> <i class='bx bx-id-card icon'></i>


						<span class="text nav-text"> <span>${sfInfo.sfName}</span>
							<span>(${sfInfo.sfRankName})</span></span>
				</a></li>

				<li class=""><a href="#"> <i class='bx bx-log-out icon'
						onClick="logOut('${sfInfo.ctCode}','${sfInfo.sfId}')"></i> <span
						class="text nav-text"
						onClick="logOut('${sfInfo.ctCode}','${sfInfo.sfId}')">로그아웃</span>
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
		<div class="text">StaffManagement</div>
		<div class="search">
			<div class="nav-search">
				<select class="select" id="searchMenu">
					<option disabled selected>직원검색</option>
					<option value="sfName">이름</option>
					<option value="caName">직급</option>
				</select> <span> <input class="searchSf" type="text" placeholder="검색">
					<i class='bx bx-search icon'
					onClick="searchSfMg('${sfInfo.ctCode}')"></i>
				</span>
			</div>

		</div>
		<div class="etc">
			<div id="explainSf">
				<button>
					<i class='bx bx-user-plus icon' onClick="getMaxSf()"></i>
				</button>

				<button>
					<div id="explainSf1">
						<i class='bx bx-edit-alt icon' onClick="modSfModal()"></i>
					</div>
				</button>
				<button>
					<i class='bx bx-edit-alt icon' onClick="openModalIn()"></i>
				</button>
			</div>
		</div>

		<table id="ajax"></table>



		<!-- 아래는  모달 부분 -->
		<form name='dynamicFormData1'>
			<div class="container1" id="container1">
				<div class="mdialog">
					<div class="mcontent">
						<div class="mheader">
							<h4 id=mheader class="mtitle">직원 수정</h4>
						</div>
						<div>센터번호</div>
						<input class="input" type="text" name="ctCode"
							readOnly="readOnly" /><br> <br>
						<div>사원번호</div>
						<input class="input" type="text" name="sfId" readOnly="readOnly" /><br>
						<br>
						<div>성명</div>
						<input class="input" type="text" name="sfName"
							placeholder="이름을 입력하세요." /><br> <br>
						<div>연락처</div>
						<input class="input" type="text" name="sfNumber"
							pattern="(010)\d{3,4}\d{4}" title="형식 01000000000"><br>
						<br>
						<div>비밀번호</div>
						<input class="input" type="password" name="sfPw" maxlength='15' /><br>
						<br>
						<div>이메일</div>
						<input class="input" type="email" name="sfEmail"
							placeholder="Email 입력" /><br> <br>
						<div>직위</div>
						<select name="sfRank">
							<option value="직급" selected>직급</option>
							<option value="M1">M1</option>
							<option value="M2">M2</option>
							<option value="M3">M3</option>
						</select><br> <input type="button" value="MODIFY"
							onClick="modSf('${sfList}')" />
						<div class="mfooter">
							<input type="button" class="mbtn" value="닫기"
								onclick="closeModal1()" />
						</div>
					</div>
				</div>
			</div>
		</form>

		<form name='dynamicFormData'>
			<div class="container" id="container">
				<div class="mdialog">
					<div class="mcontent">
						<div class="mheader">
							<h4 id=mheader class="mtitle">직원 추가</h4>
						</div>
						<br>
						<div>센터번호</div>
						<input class="input" type="text" name="ctCode" /><br>
						<div>사원번호</div>
						<input class="input" type="text" name="sfId" placeholder="Max" /><br>
						<div>성명</div>
						<input class="input" type="text" name="sfName"
							placeholder="이름을 입력하세요." /><br>
						<div>연락처</div>
						<input class="input" type="text" name="sfNumber"
							pattern="(010)\d{3,4}\d{4}" title="형식 01000000000"><br>
						<div>비밀번호</div>
						<input class="input" type="password" name="sfPw" maxlength='15' /><br>
						<div>이메일</div>
						<input class="input" type="email" name="sfEmail"
							placeholder="Email 입력" /><br>
						<div>직위</div>
						<select name="sfRank">
							<option value="직급" selected>직급</option>
							<option value="M1">M1</option>
							<option value="M2">M2</option>
							<option value="M3">M3</option>
						</select><br> <input type="button" value="CREATE"
							onClick="insSf('${sfInfo.ctCode}')" />
						<div class="mfooter">
							<input type="button" class="mbtn" value="닫기"
								onclick="closeModal()" />
						</div>
					</div>
				</div>
			</div>
		</form>

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
							<input type="button" class="mbtn" value="닫기"/>
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