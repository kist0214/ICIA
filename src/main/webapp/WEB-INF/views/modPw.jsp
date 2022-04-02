<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modPw Page</title>
<script  src="res/js/resource.js"></script>
</head>
<link rel="stylesheet" type="text/css" href="res/css/modPw.css" />
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
			<td class="textTop">비밀번호 변경</td>
			<td class="textTopSub">계속하려면 당신의 계정을 입력해주세요.</td>
		</tr>
		<tr>
			<td><input class="email" id = "email"  type="text" placeholder="이메일" /></td>
			<td class="emailIcon"><i class="fi fi-rr-envelope"></i></td>
		</tr>
		<tr>
			<td><input class="pw" id = "pw1" type="text" placeholder="비밀번호" /></td>
			<td class="pwIcon"><i class="fi fi-rr-lock"></i></td>
		</tr>
		<tr>
			<td><input class="pw" id = "pw2"  type="password" placeholder="비밀번호 확인" /></td>
			<td class="pwIcon2"><i class="fi fi-rr-lock"></i></td>
		</tr>
		<tr>
			<td><input class="modPw" type="button" value="Modify Password"
				onClick= "modPw()" /></td>
		</tr>
		
		<tr>
			<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${sfEmail}</td>
		<tr>
		
		<tr>
			<td class=line><input class="join" type="button" value="로그인하기"
				onClick="goHome()" /></td>
		</tr>
	</table>
	
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

</body>
</html>