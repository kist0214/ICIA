<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>meMg Page</title>
<script src="res/js/bon.js"></script>
<link rel="stylesheet" href="res/css/meMg.css">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
</head>


<body  onLoad = "meMg('${meInfo[0].ctCode}','${meInfo[0].meCode}')">
	<div id="meMg">
		<div id="homeBtn">
			<input type="button" value="HELP" onClick="meMg()"/>
		</div>
		<div id="logOut">
			<input type="button" value="로그아웃" onClick="logOut()" />
		</div>
		<div id="explainMe">
		Member<br> MemberManagement
		</div>
		<div id="infoMe">
			<label for="searchMember">회원검색</label>
				<select>
					<option value="이름">이름</option>
					<option value="연락처" selected>연락처</option>
				</select>
			<label for="CaMember">회원유형</label>
				<select>
					<option value="회원유형" selected>회원유형</option>
					<option value="일반">일반</option>
					<option value="PT">PT</option>
					<option value="요가">요가</option>
					<option value="필라테스">필라테스</option>
					<option value="줌바댄스">줌바댄스</option>
					<option value="스피닝">스피닝</option>
				</select>
			<span>search</span>
				<input type="text" class="searchMe" />
				<input type="button" class="meSearchBtn" value="검색" onClick="searchMeMg()"/>
				<input type="button" class="addMember" value="등록" onClick="getCaList(this)"/>
		</div>
			<div class="category">
				<p class="menuTitle" id="meMg" onClick="goMePage()">회원관리</p>
			</div>
			<div class="category">
				<p class="menuTitle" id="sfMg" onClick="goSfPage()">직원관리</p>
			</div>
			<div class="category">
				<p class="menuTitle" id="lessonMg" onClick="goLessonPage()">수업관리</p>
			</div>
			<div class="category">
				<p class="menuTitle" id="goodsMg" onClick="goGoodsPage()">장비관리</p>
			</div>
			<div class="category">
				<p class="menuTitle" id="payMg" onClick="goPayPage()">결제관리</p>
			</div>
	</div>
	
	
	
	<!--<title>Dashboard Sidebar Menu</title>-->



<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image"> <!--<img src="logo.png" alt="">-->
				</span>

				<div class="text logo-text">
					<span class="name">HELP</span> <span class="profession">Health
						Plan </span>
				</div>
			</div>

			<i class='bx bx-chevron-right toggle'></i>
		</header>

		<div class="menu-bar">
			<div class="menu">

				<!--<li class="search-box">
                    <i class='bx bx-search icon'></i>
                    <input type="text" placeholder="Search...">
                </li>
                -->

				<ul class="menu-links">
					<li class="nav-link"><a href="goods.jsp"> <i
							class='bx bx-home-alt icon'></i> <span class="text nav-text" onClick="goMePage('${ctCode }')">회원관리</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-bar-chart-alt-2 icon'></i> <span
							class="text nav-text" onClick="goSfPage('${ctCode }')">직원관리</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-bell icon'></i> <span class="text nav-text" onClick="goLessonPage('${ctCode }')">수업관리</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-pie-chart-alt icon'></i> <span class="text nav-text" onClick="goGoodsPage('${ctCode }')">장비관리</span>
					</a></li>

					<li class="nav-link"><a href="#"> <i
							class='bx bx-heart icon'></i> <span class="text nav-text" onClick="goPayPage('${ctCode }')">결제관리</span>
					</a></li>


				</ul>
			</div>

			<div class="bottom-content">
				<li class=""><a href="#"> <i class='bx bx-log-out icon'></i>
						<span class="text nav-text">이동명</span> <span class="text nav-text">트레이너</span>
				</a></li>

				<li class=""><a href="#"> <i class='bx bx-log-out icon'></i>
						<span class="text nav-text">Logout</span>
				</a></li>

				<li class="mode">
					<div class="sun-moon">
						<i class='bx bx-moon icon moon'></i> <i class='bx bx-sun icon sun'></i>
					</div> <span class="mode-text text">Dark mode</span>

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
			<span>회원목록</span>
			<div class="nav-search">
				<select>
					<option disabled selected>회원검색</option>
					<option>이름</option>
					<option>연락처</option>
				</select> <select>
					<option disabled selected>회원유형</option>
					<option>일반</option>
					<option>PT</option>
					<option>만료</option>
				</select> <span> <input type="text" placeholder="검색"> <i
					class='bx bx-search icon'></i>
				</span>

			</div>
			<div>
				<button class="InsMember">회원추가</button>
			</div>
		</div>


<table id="ajax"></table>
		<table>
			<thead>
				<tr>
					<td>이름</td>
					<td>성별</td>
					<td>연령</td>
					<td>핸드폰</td>
					<td>유형</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>김한영</td>
					<td>남</td>
					<td>22</td>
					<td>01099241234</td>
					<td>PT</td>
				</tr>
				<tr>
					<td>조본</td>
					<td>남</td>
					<td>29</td>
					<td>01014574123</td>
					<td>만료</td>
				</tr>
				<tr>
					<td>최용희</td>
					<td>여</td>
					<td>28</td>
					<td>01048798545</td>
					<td>PT</td>
				</tr>
				<tr>
					<td>김한일</td>
					<td>남</td>
					<td>19</td>
					<td>01017242234</td>
					<td>일반</td>
				</tr>
				<tr>
					<td>김유일</td>
					<td>여</td>
					<td>52</td>
					<td>01049241324</td>
					<td>PT</td>
				</tr>
			</tbody>
		</table>


	</section>
	
	

	<section class="home">
		<div class="text">gdfdfdMemberManagement</div>
	</section>
<!-- 여기까지가 한영이가 한 코드  -->
	<script>
	 const body = document.querySelector('body'),
     sidebar = body.querySelector('nav'),
     toggle = body.querySelector(".toggle"),
     searchBtn = body.querySelector(".search-box"),
     modeSwitch = body.querySelector(".toggle-switch"),
     modeText = body.querySelector(".mode-text");
	toggle.addEventListener("click" , () =>{
   sidebar.classList.toggle("close");
	})
	modeSwitch.addEventListener("click" , () =>{
   body.classList.toggle("dark");
   
   if(body.classList.contains("dark")){
       modeText.innerText = "Light mode";
   }else{
       modeText.innerText = "Dark mode";
       
   }
	});
	</script>
</body>
</html>