<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sendEmailForm</title>
<script src="res/js/resource.js"></script>
</head>
<link rel="stylesheet" type="text/css" href="res/css/sendEmailForm.css" />
<body>

	<div class="bCircle"></div>
	<div class="mCircle"></div>
	<div class="mCircle2"></div>
	<div class="mCircle3"></div>
	<div class="mCircle4"></div>
	<div class="mCircle5"></div>
	<div class="mCircle6"></div>
	<div class="bText">계획하지 않는 것은 실패를 계획하는 것과 마찬가지다.</div>
	<div class="mText">- 에피 닐 존스 -</div>
	<div class="solid"></div>
	<div class="solid2"></div>
	<div class="solid3"></div>
	<div class="solid4"></div>
	<div class="solid5"></div>
	<div class="solid6"></div>
	<div class="solid7"></div>
	<div class="solid8"></div>
	<div class="solid9"></div>
	<div class="solid10"></div>
	<div class="health">
		<img src="res/images/health.svg">
	</div>

	<table>
		<tr>
			<td class="textTop">이메일 보내기</td>
			<td class="textTopSub">계속하려면 당신의 계정을 입력해주세요.</td>
		</tr>
		<!--<tr>
			<td><input class="id" type="text" placeholder="아이디" /></td>
			<td class="idIcon"><i class="fi fi-rs-user"></i></td>
		</tr>
		 -->
		<tr>
			<td><input class="email" type="email" id="email"
				placeholder="이메일" /></td>
			<td class="emailIcon"><i class="fi fi-rr-envelope"></i></td>
		</tr>

		<tr>
			<td><input class="sendEmail" type="button" value="Send Email"
				id="email" onClick="sendEmail()" /></td>
		</tr>

		<tr>
			<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${sfEmail}</td>
		<tr>
		<tr>
			<td class=line><input class="join" type="button" value="계정만들기"
				onClick="goJoinPage()" /></td>
		</tr>
	</table>

	<div class="logo" onclick ="home()">
		<div class="zero">
			<br>
			<div class="one"></div>
		</div>
		<div class="hp">
			H E L P
			<div id="plan">Health Plan</div>
		</div>
	</div>
</body>
</html>