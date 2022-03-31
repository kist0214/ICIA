<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>meConfig</title>
<script src="res/js/resource.js"></script>
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="res/css/meConfig.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>


<body  onLoad="getCenterListInbody('${meInfo[0].meCode}')">
	<div class="firstTop">
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
		<div id="topMenu">
		<span>${meInfo[0].meName}님 안녕하세요.</span>
		<span id="center"></span>
			<section>
				<article class="topmenu">
					<input type="button" id="meLessonMg" value="수업관리"
						onClick="meLessonMg()" /> <input type="button" id="meConfig"
						value="환경설정" onClick="meConfig()"></input> <input type="button"
						id="logOut" value="로그아웃" onClick="logOut()"></input>
				</article>
			</section>

		</div>
	</div>
	<div></div>


	<div class="middleText">나의 프로필</div>

	<div class="middleImg">
		<img src="res/images/male.svg" class="image" />
	</div>

	<div class="middle">
		<div id="profile" class="profile">
			<form id="profile2">
				<span>이름 : </span>
				<span id="meName" class="profile">${meName }</span><br>
				<span>성별 : </span>
				<span id="meGender" class="profile">
					${meGender }</span><br> <span>나이 : </span><span id="meBirth"
					class="profile">${meBirth }</span><br> <span>연락처 : </span><span
					id="meNumber" class="profile">${meNumber }</span><br> <span>이메일
					: </span><span id="meEmail" class="profile"> ${meEmail }</span><br>


			</form>
		</div>
	</div>
	<!-- 
	<form name="fire">
		<button id="bottom" class="modal" type="button" onClick="openModal()">회원
			탈퇴</button>
		
		<div class="container" id="container">
			<div class="mdialog">
				<div class="mcontent">
				
					<div class="mheader" id="mheader" name="fire">
						<h4 class="mtitle">회원탈퇴</h4>
					</div>
					
					<div class="mbody" id="mbody" value="body"></div>
					
					<div class="mfooter">
						<input type="password" id="mePw" placeHolder="password" /><br>
						<span>**주의**<br>탈퇴 시 개인정보가 파기됩니다.<br>정말 탈퇴하시겠습니까?
						</span> <input id="okay" type="button" class="mbtn" name="fire"
							value="확인"
							onClick="checkMePw('${meInfo[0].ctCode}','${meInfo[0].meCode}')" />
						<button type="button" class="mbtn"  value="취소"
							onclick="closeModal()">취소</button>

					</div>
				</div>
			</div>
		</div>
		
	</form>


	<form name="mod">
		
		
		<div class="container" id="container1">
			<div class="mdialog">
				<div class="mcontent">
					
					<div class="mheader" id="mheader">
						<h4 class="mtitle">비밀번호 확인</h4>
					</div>
					
					<div class="mbody" id="mbody" value="body"></div>
		
					<div class="mfooter">
						<input type="password" class="modMe" id="mePw1"
							placeHolder="password" /><br>
							 <span>비밀번호를 입력해주세요.</span> <input
							id="okay" type="button" class="mbtn" name="CheckMePw1" value="확인"
							onClick="checkMePw2('${meInfo[0].ctCode}','${meInfo[0].meCode}')" />
						<input type="button" class="mbtn" value="취소"
							onclick="closeModal1()"/>

					</div>
				</div>
			</div>
		</div>
	</form>
	 -->


	<form>
		<div class="mod">

			<button id="bottom" class="modal" type="button" value="수정"
				onClick="openModal1()">수정하기</button>
		</div>

		<!-- 모달 제어-->
		<div class="container" id="container1">
			<div class="mdialog">
				<div class="mcontent">
					<!-- 모달헤더 -->
					<div class="mheader">
						<h5 class="mtitle">개인정보 수정하기</h5>
					</div>
					<!-- 모달 바디 -->
					<div class="mbody" id="mbody" value="body"></div>
					<!-- 모달 푸터 -->
					<div class="mfooter">
						<span>개인정보를 수정하려면 비밀번호를 입력해주세요.</span> <input type="password"
							class="modMe" id="mePw1" placeholder="비밀번호" /><br> <input
							type="button" class="mbtn" value="확인"
							onClick="checkMePw2('${meInfo[0].ctCode}','${meInfo[0].meCode}')" />
						<input type="button" class="mbtn" value="취소"
							onclick="closeModal1()" />
					</div>

				</div>
			</div>
		</div>
		
	</form>

	<form>
		<div class="fire">
			<button id="bottom" class="modal" type="button" onClick="openModal()">탈퇴하기</button>
		</div>
		<!-- 모달 제어-->
		<div class="container" id="container">
			<div class="mdialog">
				<div class="mcontent">
					<!-- 모달헤더 -->
					<div class="mheader" id="mheader" name="fire">
						<h4 class="mtitle">회원탈퇴하기</h4>
					</div>
					<!-- 모달 바디 -->
					<div class="mbody" id="mbody" value="body"></div>
					<!-- 모달 푸터 -->
					<div class="mfooter">
						<span>** 주의 **<br>탈퇴 시 개인정보가 파기됩니다. 정말 탈퇴하시겠습니까?
						</span> <input type="password" class="fireMe" placeHolder="비밀번호" /><br>
						<input type="button" class="mbtn" name="fire" value="확인"
							onClick="checkMePw()" /> <input type="button" class="mbtn"
							value="취소" onclick="closeModal()" />
					</div>
				</div>
			</div>
		</div>
	</form>


</body>
</html>