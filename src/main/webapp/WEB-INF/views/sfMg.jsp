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
<script src="https://kit.fontawesome.com/64d58efce2.js"
	crossorigin="anonymous"></script>
<script src="res/js/Dong.js"></script>
<script src="res/js/resource.js"></script>
<title>StaffManament</title>

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
				<li class=""><a> <i class='bx bx-id-card icon'></i>
						<span class="text nav-text"> <span>${sfInfo.sfName}</span>
							<span>(${sfInfo.sfRankName})</span></span>
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
		<div class="text">직원관리</div>
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
				<button onClick="getMaxSf('${sfInfo.ctCode}')">
					<i class='bx bx-user-plus icon'></i>
				</button>

				<button onClick="modSfModal()">
					<div id="explainSf1">
						<i class='bx bx-edit-alt icon'></i>
					</div>
				</button>
			</div>
		</div>
		<table id="ajax"></table>



		<!-- 아래는  모달 부분 -->
		<form name='dynamicFormData1'>
			<div class="container1" id="container1">
				<div class="mdialog">
					<input type="button" class="mbtn" value="X" onclick="closeModal1()" />
					<div class="mcontent">
						<div class="mheader">
							<h4 id=mheader class="mtitle">직원 수정</h4>
						</div>
						<div class="input">
							<i class='bx bx-store-alt'></i> <input type="text" name="ctCode"
								value="${sfInfo.ctCode}" readOnly />
						</div>
						<div class="input">
							<i class="bx bx-user"></i> <input type="text" name="sfId"
								readOnly />
						</div>
						<div class="input">
							<i class="bx bx-user"></i> <input type="text" name="sfName"
								placeholder="이름을 입력하세요." />
						</div>
						<div class="input">
							<i class='bx bx-envelope'></i> <input type="email" name="sfEmail"
								placeholder="Email 입력" />
						</div>
						<div class="input">
							<i class='bx bx-phone'></i> <input type="text" name="sfNumber"
								pattern="(010)\d{3,4}\d{4}" title="형식 01000000000">
						</div>
						<div class="input">
							<i class='bx bx-lock-alt'></i> <input type="password" name="sfPw"
								placeholder="비밀번호를 입력하세요." maxlength='15' />
						</div>
						<select name="sfRank">
							<option value="직급" selected disabled>직급</option>
							<option value="M1">관리자</option>
							<option value="M2">트레이너</option>
							<option value="M3">안내원</option>
						</select>
						<div>
							<input type="button" class="btn" value="MODIFY" onClick="modSf()" />
						</div>
					</div>
				</div>
			</div>
		</form>

		<form name='dynamicFormData'>
			<div class="container" id="container">
				<div class="mdialog">
					<input type="button" class="mbtn" value="X" onclick="closeModal()" />
					<div class="mcontent">
						<div class="mheader">
							<h4 id=mheader class="mtitle">직원 추가</h4>
						</div>

						<div>
							<div class="input">
								<i class='bx bx-store-alt'></i> <input type="text" name="ctCode"
									value="${sfInfo.ctCode}" />
							</div>
							<div class="input">
								<i class="bx bx-user"></i> <input type="text" name="sfId"
									value="${sfInfo.sfId}" />
							</div>
							<div class="input">
								<i class="bx bx-user"></i> <input type="text" name="sfName"
									placeholder="이름을 입력하세요." />
							</div>
							<div class="input">
								<i class='bx bx-envelope'></i> <input type="email"
									name="sfEmail" placeholder="Email 입력" />
							</div>
							<div class="input">
								<i class='bx bx-phone'></i> <input type="text" name="sfNumber"
									pattern="(010)\d{3,4}\d{4}" title="형식 01000000000"
									placeholder="연락처를 입력하세요.">
							</div>
							<div class="input">
								<i class='bx bx-lock-alt'></i> <input type="password"
									name="sfPw" maxlength='15' placeholder="비밀번호를 입력하세요." />
							</div>
							<select name="sfRank">
								<option value="직급" selected disabled>직급</option>
								<option value="M1">관리자</option>
								<option value="M2">트레이너</option>
								<option value="M3">안내원</option>
							</select>
							<div>
								<input type="button" class="btn" value="CREATE"
									onClick="insSf('${sfInfo.ctCode}')" />
							</div>
						</div>
					</div>
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