<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sfMg Page</title>

<script src="res/js/Dong.js"></script>
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
}
.container1 {
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
</head>
<body onLoad="sfMg('ajax/sfMg','${sfCode}')">
	<div id="sfMg">
		<div id="logOut">
			<div id="homeBtn">
				<input type="button" value="HELP" onClick="meMg()"/>
			</div>
			<input type="button" value="로그아웃" onClick="logOut()" />
		</div>

		<div id="explainSf1">
			<span onClick="modSfModal()">직원수정</span>
		</div>
	 <form name='dynamicFormData1'>
		<div class="container1" id="container1">
			<div class="mdialog">
				<div class="mcontent">
					<div class="mheader">
						<h4 id=mheader class="mtitle">직원 수정</h4>
					</div>
					<div>센터번호</div>
					<input class="input" type="text"  name = "sfCtCode" readOnly = "readOnly"/></br></br>
					<div>사원번호</div>
					<input class="input" type="text"  name = "sfId" readOnly = "readOnly"/></br></br>
					<div>성명</div>
					<input class="input" type="text" name = "sfName" placeholder="이름을 입력하세요."/></br></br>
					<div>연락처</div>
					<input class="input" type="text" name = "sfNumber"  pattern="(010)\d{3,4}\d{4}" title="형식 01000000000"></br></br>
					<div>비밀번호</div>
					<input class="input" type="password" name = "sfPw" maxlength='15'/></br></br>
					<div>이메일</div>
					<input class="input" type="email" name = "sfEmail" placeholder="Email 입력"/></br></br>
					<div>직위</div>	
					<select name = "sfRank">
						<option value="직급" selected >직급</option>
						<option value="M1">M1</option>
						<option value="M2" >M2</option>
						<option value="M3">M3</option>
					</select></br>
						<input type="button" value="MODIFY" onClick="modSf('${sfList}')"/>
					<div class="mfooter">
						<input type="button" class="mbtn" value="닫기" onclick="closeModal1()" />						
					</div>
				</div>
			</div>
		</div>
	</form>

		<div id="explainSf">
		<span onClick="getMaxSf(this)">직원추가</span>
	</div>
<form name='dynamicFormData'>
		<div class="container" id="container">
			<div class="mdialog">
				<div class="mcontent">
					<div class="mheader">
						<h4 id=mheader class="mtitle">직원 추가</h4>
					</div>
					<div>센터번호</div>
					<input class="input" type="text"  name = "sfCtCode"/></br></br>
					<div>사원번호</div>
					<input class="input" type="text"  name = "sfId" placeholder="Max"/></br></br>
					<div>성명</div>
					<input class="input" type="text" name = "sfName" placeholder="이름을 입력하세요."/></br></br>
					<div>연락처</div>
					<input class="input" type="text" name = "sfNumber"  pattern="(010)\d{3,4}\d{4}" title="형식 01000000000"></br></br>
					<div>비밀번호</div>
					<input class="input" type="password" name = "sfPw" maxlength='15'/></br></br>
					<div>이메일</div>
					<input class="input" type="email" name = "sfEmail" placeholder="Email 입력"/></br></br>
					<div>직위</div>	
					<select name = "sfRank">
						<option value="직급" selected >직급</option>
						<option value="M1">M1</option>
						<option value="M2" >M2</option>
						<option value="M3">M3</option>
					</select></br>
						<input type="button" value="CREATE" onClick="insSf('${sfList}')"/>
					<div class="mfooter">
						<input type="button" class="mbtn" value="닫기" onclick="closeModal()" />						
					</div>
				</div>
			</div>
		</div>
	</form>

		<div id="infoSf">
			 <label for="searchStaff">직원검색</label> 
			<select id="searchMenu">
				<option value="이름">이름</option>
				<option value="직급" selected>직급</option>
			</select>
				<span>search</span>
				<input type="text" class="searchSf" />
				<input type="button" class="sfSearchBtn" value="검색" onClick="searchSfMg('ajax/searchSfMg','${sfList}')"/>
		</div>
			<div class="category">
				<p class="menuTitle" id="meMg" onClick="goMePage('${sfCode}')">회원관리</p>
			</div>
			<div class="category">
				<p class="menuTitle" id="sfMg" onClick="goSfPage()">직원관리</p>

			</div>
			<div class="category">
				<p class="menuTitle" id="lessonMg" onClick="goLessonPage('${sfCode}')">수업관리</p>
			</div>
			<div class="category">
				<p class="menuTitle" id="goodsMg" onClick="goGoodsPage('${sfCode}')">장비관리</p>
			</div>
			<div class="category">
				<p class="menuTitle" id="payMg" onClick="goPayPage('${sfCode}')">결제관리</p>
			</div>
		<div class="category">
		<div id="list">${list }</div>
	</div>
	</div>

</body>
</html>