
function home(){
	let form = makeForm("", "/", "GET");
      document.body.appendChild(form);
	form.submit();
}
function makeForm(fname, faction, fmethod){
	const form = document.createElement("form");
	if(fname != ""){form.setAttribute("name", fname);}
	form.setAttribute("action", faction);
	form.setAttribute("method", fmethod);
	return form;
}

let checkdata;

function creatMeJoin(){
	const form = document.getElementsByName("meJoin")[0];
	const mename = document.getElementsByName("meName")[0];
	const meemail = document.getElementsByName("meEmail")[0];
	const mepw = document.getElementsByName("mePw")[0];
	const mepwcheck = document.getElementsByName("mePwCheck")[0];
	const menumber = document.getElementsByName("meNumber")[0];
	const mebirth = document.getElementsByName("meBirth")[0];
	const megender = document.getElementsByName("meGender")[0];
	
	if(mename.value == "" || meemail.value == "" || mepw.value == "" || menumber.value == "" || mebirth.value == "" || megender.value == ""){
		alert("다시 확인해 주세요.");
		return;
	}
	
	for(i=0;i<checkdata.length;i++){
		if(meemail.value==checkdata[i].meEmail){
			alert("이메일이 중복됩니다.");
			return;
		}
		if(menumber.value==checkdata[i].meNumber){
			alert("이미 등록되어있는 번호입니다.");
			return;
		}
	}
	
	if(mepw.value==mepwcheck.value){
		form.submit();
	}else{
		alert("비밀번호를 확인해주세요.");
		return;
	}
}

function checkMeEmailNum(data){
	if(data==undefined){
	ajaxconnection("ajax/meEmailNum","","checkMeEmailNum",false);
	}
	checkdata=data;
}


function ajaxconnection(action, data, fn, content) {
   let ajax = new XMLHttpRequest();
   ajax.onreadystatechange = function() {
      if (ajax.readyState == 4 && ajax.status == 200) {
         window[fn](JSON.parse(ajax.responseText));
      }
   };
      ajax.open("post", action, true);
if(content){
      ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
   }
   ajax.send(data);
}

function creatCtJoin(){
	const form = document.getElementsByName("ctJoin")[0];
	const ctcode = document.getElementsByName("ctCode")[0];
	const ctname = document.getElementsByName("ctName")[0];
	const ctaddress = document.getElementsByName("ctAddress")[0];
	const ctceo = document.getElementsByName("sfName")[0];
	const sfemail = document.getElementsByName("sfEmail")[0];
	const sfpw = document.getElementsByName("sfPw")[0];
	const sfpwcheck = document.getElementsByName("sfPwCheck")[0];
	const ctnumber = document.getElementsByName("sfNumber")[0];
	
	if(ctcode.value == "" || ctname.value == "" || ctaddress.value == "" || ctceo.value == "" || sfemail.value == "" 
		|| sfpw.value == "" || ctnumber.value == ""){
		alert("다시 확인해 주세요.");
		return;
	}
	
	for(i=0;i<checkdata.length;i++){
		if(ctcode.value==checkdata[i].ctCode){
			alert("이미 등록되어있는 번호입니다.");
			return;
		}
	}
	
	if(sfpw.value==sfpwcheck.value){
		form.submit();
	}else{
		alert("비밀번호를 확인해주세요.");
		return;
	}
}

function checkCtCode(data){
	if(data==undefined){
	ajaxconnection("ajax/checkCtCode","","checkCtCode",false);
	}
	checkdata=data;
}


