<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<script src="https://kit.fontawesome.com/64d58efce2.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="res/css/join.css" />
<title>MemberJoin & CenterJoin</title>
</head>
<body>

	<div class="container">
		<div class="forms-container">
			<div class="signin-signup">
				<form action="#" class="sign-in-form">
					<h2 class="title">회원가입</h2>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" placeholder="멤버코드" />
					</div>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" placeholder="이름"
							maxlength='20' />
					</div>
					<div class="input-field">
						<i class="fas fa-envelope"></i> <input type="email"
							placeholder="이메일" />
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password" maxlength='15'
							placeholder="비밀번호" />
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password" maxlength='15'
							placeholder="비밀번호확인" />
					</div>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" placeholder="번호"
							pattern="(010)-\d{3,4}-\d{4}" title="형식 010-0000-0000" />
					</div>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="date" placeholder="생일" />
					</div>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" placeholder="성별" />
					</div>
					<input type="submit" value="Create" class="btn solid" />
					
				</form>
				<form action="#" class="sign-up-form">
					<h2 class="title">센터가입</h2>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" placeholder="매장코드" />
					</div>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" placeholder="매장명" />
					</div>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" placeholder="매장주소" />
					</div>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" placeholder="대표자명" />
					</div>
					<div class="input-field">
						<i class="fas fa-envelope"></i> <input type="email"
							placeholder="이메일" />
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password" maxlength='15'
							placeholder="비밀번호" />
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password" maxlength='15'
							placeholder="비밀번호확인" />
					</div>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" placeholder="번호"
							pattern="(010)-\d{3,4}-\d{4}" title="형식 010-0000-0000" />
					</div>
					<input type="submit" class="btn" value="Create" />
					
				</form>
			</div>
		</div>

		<div class="panels-container">
			<div class="panel left-panel">
				<div class="content">
					<h3>센터가입하시겠습니까?</h3>
					<p>센터가입은 ...</p>
					<button class="btn transparent" id="sign-up-btn">Click
						Here!</button>
				</div>
				<img src="res/images/help.svg" class="image" alt="" />
			</div>
			<div class="panel right-panel">
				<div class="content">
					<h3>회원가입하시겠습니까?</h3>
					<p>회원가입은 ...</p>
					<button class="btn transparent" id="sign-in-btn">Click
						Here!</button>
				</div>
				<img src="res/images/plan.svg" class="image" alt="" />
			</div>
		</div>
	</div>
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

	<script>
	const sign_in_btn = document.querySelector("#sign-in-btn");
	const sign_up_btn = document.querySelector("#sign-up-btn");
	const container = document.querySelector(".container");
	sign_up_btn.addEventListener("click", () => {
	  container.classList.add("sign-up-mode");
	});
	
	sign_in_btn.addEventListener("click", () => {
	  container.classList.remove("sign-up-mode");
	});
	</script>
</body>
</html>
