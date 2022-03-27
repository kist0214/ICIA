
let list;
 let jsPIp;
let datalesson;

	


function YopenModal(){
	let container = document.getElementById("gModal");
	container.style.filter = "alpha(Opacity=50)";
	container.style.display = "block";
}

function YcloseModal(){
	let container = document.getElementById("gModal");
	container.style.display = "none";
}

	
function meLessonMg(ctCode){
	
	const form = makeForm("", "meLessonMg", "POST")
	//const ctCode = makeInputElement("hidden","ctCode",ctCode,"")

	//form.appendChild(ctCode);
      document.body.appendChild(form);
      form.submit();
}

function meConfig(ctCode){
	
	const form = makeForm("", "meConfig", "POST")
	//const ctCode = makeInputElement("hidden","ctCode",ctCode,"")

	//form.appendChild(ctCode);
      document.body.appendChild(form);
      form.submit();
}

function getMeMg(ctcode){
	let jsondata = [];
	jsondata.push({"ctCode":ctcode});
	const clientdata = JSON.stringify(jsondata);
	whatsend("ajax/meMg","","getedmelist",false,"post");

}



function openModal() {
	let container =  document.getElementById("container");
	container.style.filter = "alpha(Opacity=50)";
	container.style.display = "block";
}
function openModal1() {
	let container =  document.getElementById("container1");
	container.style.filter = "alpha(Opacity=50)";
	container.style.display = "block";
}


function closeModal() {
	let container =  document.getElementById("container");
	container.style.display = "none";
}

function closeModal1() {
	let container =  document.getElementById("container1");
	container.style.display = "none";
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

function whatsend(action, data, fn, content,method) {
	const ajax = new XMLHttpRequest();
	
	ajax.onreadystatechange = function() {
		
			if (ajax.readyState == 4 && ajax.status == 200) {
		
			window[fn](JSON.parse(ajax.responseText));
		}
	};
	
	if(method == "Get"){
		
		ajax.open("get", action, true);
	}else{
		ajax.open("post", action, true);
		ajax.setRequestHeader("Content-Type",content? "application/x-www-form-urlencoded;charset=utf-8 ":"application/json;charset=utf-8");
	}
	
	ajax.send(data);
}


function getAjax1(action, data, fn, content ,method) {
   let ajax = new XMLHttpRequest();

   ajax.onreadystatechange = function() {
      if (ajax.readyState == 4 && ajax.status == 200) {
         window[fn](ajax.responseText);
         //document.getElementById("ajaxData").innerHTML = serverData;
      }
   };

   ajax.open("post", action, true);
   ajax.setRequestHeader("Content-type",
         "application/json;charset=utf-8");
   ajax.send(data);
}

function meProfile(){
	let jsondata = [];
	const mmeCode = "10001";
	const cctCode = "1234567890";
	jsondata.push({"meCode":mmeCode,"ctCode":cctCode});
	const clientData = JSON.stringify(jsondata);
	whatsend("ajax/meDtInfo",clientData,"modProfileInfo",false,"post");
}


function modProfileInfo(data){
	for (idx = 0; idx< data.length; idx++){
	document.getElementById("meEmail").innerHTML = data[idx].meEmail;
	document.getElementById("meBirth").innerHTML = data[idx].meBirth;
	document.getElementById("meName").innerHTML = data[idx].meName;
	document.getElementById("meGender").innerHTML = data[idx].meGender;
	document.getElementById("meNumber").innerHTML = data[idx].meNumber;
}
}



function meDtInf(cctCode,mmeCode){
	let jsondata = [];
	
	jsondata.push({"meCode":mmeCode,"ctCode":cctCode});
	const clientData = JSON.stringify(jsondata);
	
	whatsend("ajax/meDtInfo",clientData,"meDtInfo1",false,"post");
	
}

function meDtInfo1(data){
	let STCODE = "M1";
	alert(data[0].value);
	for (idx = 0; idx< data.length; idx++){
	message = '<div>';
	message += '<table>';
	message += '<tr><td>회원이름</td><td>'+ data[idx].meName +"("+ data[idx].meBirth +"세,"+data[idx].meGender+')'+'</td></tr>';
	message += '<tr><td>담당트레이너</td><td>'+data[idx].sfName+'</td></tr><br>';
	message += '<tr><td>이메일</td><td>'+data[idx].meEmail+'</td></tr><br>';
	message += '<tr><td>연락처</td><td>'+data[idx].meNumber+'</td></tr>';
	message += '</table>';
 	if(STCODE == ("M1")){
		message += '<table>';
		message += '<tr><td>결제일</td><td>'+data[idx].paDate+'</td></tr>';
		message += '<tr><td>락카번호</td><td>'+data[idx].locker+'</td></tr>';
		message += '<tr><td>결제금액</td><td>'+data[idx].paTotal+'</td></tr>';
		message += '<tr><td>회원유형</td><td>'+data[idx].lsName+'</td></tr>';
		message += '</table>';
		message += '</div>';
	}	
	}
      document.getElementById("list").innerHTML = message;
}

function meInbodyMg(){
	let jsondata = [];
	const mmeCode = "10001";
	const cctCode = "1234567890";
	jsondata.push({"meCode":mmeCode,"ctCode":cctCode});
	const clientData = JSON.stringify(jsondata);
	alert(jsondata[0].ctCode);
		whatsend("ajax/meInbodyMg",clientData,"meInbodyMg1",false,"post");
}

function meInbodyMg1(data){
	alert(data.value);
	message = '<div>';
	message += '<table>';
	message += '<tr><td>'+data[9].daName+'</td><td>'+ data[9].idCount +"&nbsp"+data[9].daUnit+'</td></tr>';
	message += '<tr><td>'+data[1].daName+'</td><td>'+ data[1].idCount +"&nbsp"+data[1].daUnit+'</td></tr>';
	message += '<tr><td>'+data[10].daName+'</td><td>'+ data[10].idCount +"&nbsp"+data[10].daUnit+'</td></tr>';
	message += '</table>'+'<br>';
 	
		message += '<table>';
		message += '<tr><td>'+data[2].daName+'</td><td>'+ data[2].idCount +"&nbsp"+data[2].daUnit+'</td></tr>';
		message += '<tr><td>'+data[0].daName+'</td><td>'+ data[0].idCount +"&nbsp"+data[0].daUnit+'</td></tr>';
		message += '<tr><td>'+data[3].daName+'</td><td>'+ data[3].idCount +"&nbsp"+data[3].daUnit+'</td></tr>';
		message += '<tr><td>'+data[6].daName+'</td><td>'+ data[6].idCount +"&nbsp"+data[6].daUnit+'</td></tr>';
		message += '<tr><td>'+data[5].daName+'</td><td>'+ data[5].idCount +"&nbsp"+data[5].daUnit+'</td></tr>';
		message += '<tr><td>'+data[4].daName+'</td><td>'+ data[4].idCount +"&nbsp"+data[4].daUnit+'</td></tr>';
		message += '<tr><td>'+data[8].daName+'</td><td>'+ data[8].idCount +"&nbsp"+data[8].daUnit+'</td></tr>';
		message += '<tr><td>'+data[7].daName+'</td><td>'+ data[7].idCount +"&nbsp"+data[7].daUnit+'</td></tr>';
		message += '</table>';
		message += '</div>';
		
		message = '<div>';
		message += '<table>';
		message += '<tr><td>'+'목표운동량'+'</tr></td>';
		message += '<tr><td>'+'운동명'+ '&nbsp&nbsp' +'</tr></td>';
		message += '</table>';
		message += '</div>';
	
      document.getElementById("list").innerHTML = message;
}

function checkMePw(cctcode, mmecode){
	let jsondata = [];
	alert(mmecode);

	jsondata.push({"meCode":mmecode,"ctCode":cctcode});
	const clientData = JSON.stringify(jsondata);
	
		whatsend("ajax/meDtInfo",clientData,"checkMePw1",false,"post");
	
	}

function checkMePw2(mmecode, cctcode){
	let jsondata = [];
	
	alert(mmecode);
	alert(cctcode);
	
	jsondata.push({"meCode":'10001',"ctCode":'1234567890'});
	const clientData = JSON.stringify(jsondata);
	
		whatsend("ajax/meDtInfo",clientData,"checkMePw3",false,"post");
		
	}

function checkMePw3(data){
	alert(data);
	const list = document.getElementById("profile");
	const list2 = document.getElementById("profile2");
	
	for(idx = 0; idx< data.length; idx++){
		alert(data[idx].mePw);
		if(data[idx].mePw == document.getElementById("mePw1").value){
			while(list2.hasChildNodes()){
			list2.removeChild(list2.lastChild);
			}
			let input1 = document.createElement("input");
			list2.setAttribute("type","submit");
			input1.setAttribute("value", data[idx].meEmail);
			input1.setAttribute("readOnly","");
			input1.setAttribute("id","meEmail");
			
			
			let input2 = document.createElement("select");
			let option1 = document.createElement("option");
			let option2 = document.createElement("option");
			input2.setAttribute("id","meGender");
			input2.appendChild(option1);
			option1.setAttribute("value","G1");
			option1.innerHTML = "남";
			input2.appendChild(option2);
			option2.setAttribute("value","G2");
			option2.innerHTML = "여";
			input2.innerHTML.value = data[idx].meGender;
			
			
			let input3 = document.createElement("input");
			input3.setAttribute("placeHolder", data[idx].meBirth);
			input3.setAttribute("type","date");
			input3.setAttribute("id","meBirth");
			let input4 = document.createElement("input");
			input4.setAttribute("placeHolder", data[idx].meName);
			input4.setAttribute("id","meName")
			let input5 = document.createElement("input");
			input5.setAttribute("placeHolder", data[idx].meNumber);
			input5.setAttribute("id","meNumber")
			let input6 = document.createElement("input");
			input6.setAttribute("class","modMeMg");
			input6.setAttribute("onClick","modMeMg("+data[idx].meCode+")");
			input6.setAttribute("type","button");
			input6.setAttribute("value","저장");
			
			
			list2.appendChild(input1);
			list2.appendChild(document.createElement("br"));
			list2.appendChild(input2);
			list2.appendChild(document.createElement("br"));
			list2.appendChild(input3);
			list2.appendChild(document.createElement("br"));
			list2.appendChild(input4);
			list2.appendChild(document.createElement("br"));
			list2.appendChild(input5);
			list2.appendChild(input6);
			closeModal1();
		}else{
		}
		}
}

function modMeMg(mmecode){

	let form = document.getElementById("profile2");
	const meEmail = document.getElementById("meEmail").value;
	const meGender = document.getElementById("meGender").value;
	const meBirth = document.getElementById("meBirth").value;
	const meName = document.getElementById("meName").value;
	const meNumber = document.getElementById("meNumber").value;
	let jsondata = [];
	jsondata.push({meCode: mmecode ,meEmail:meEmail,meGender:meGender,meBirth:meBirth,meName:meName,meNumber:meNumber});
	const clientdata = JSON.stringify(jsondata);
	alert(clientdata);
	whatsend("ajax/modMeMg",clientdata,"",false,"post");
}

function checkMePw1(data){
	for(idx = 0; idx< data.length; idx++){
		if(data[idx].mePw == document.getElementById("mePw").value){
		alert("이용해주셔서 감사합니다.");
		delMe();
		closeModal();
	}else{
		alert("비밀번호가 틀렸습니다.");
	}
	}
}
function delMe1(){
	getAjax1("/delMe","","",true,"post");
}

function delMe(){
	
	const form = makeForm("", "/delMe", "POST")
	//const ctCode = makeInputElement("hidden","ctCode",ctCode,"")

	//form.appendChild(ctCode);
      document.body.appendChild(form);
      form.submit();
}

function getAjaxJsonUsingJquery(action, clientData, fn) {
		$.ajax({
			async : true,
			type : "post",
			url : action,
			data : clientData,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(jsonObject){
				alert("AJAX 통신 성공으로 서버 데이터가 도착했습니다.");
				alert(JSON.stringify(jsonObject));
				window[fn](jsonObject);
			},
			beforeSend : function(){
				// AJAX 통신 요청 전 호출되는 이벤트
				alert("AJAX 통신을 시작합니다.");
			},
			complete : function(){
				// AJAX 통신이 완료 될 때 호출되는 이벤트
				alert("AJAX 통신을 종료합니다.");
			},
			err : function(error){
				// 통신 실패시 호출되는 이벤트
				alert("AJAX 통신실패했습니다.");
			},
			timeout : 10000
		});
	}

function initPage(){
	 whatsend("https://api.ipify.org?format=json","","getPublicIp","Get");
}

function loadPage(msg){
	if(!msg=="")
	alert(msg);
}

function getPublicIp(pip){
	jsPIp = pip.ip;
}



function makeForm(fname, faction, fmethod){
	const form = document.createElement("form");
	if(fname != ""){form.setAttribute("name", fname);}
	form.setAttribute("action", faction);
	form.setAttribute("method", fmethod);
	return form;
}

function makeInputElement(type, name, value, placeholder){
	const input = document.createElement("input");
	input.setAttribute("type", type);
	input.setAttribute("name", name);
	if(value != ""){input.setAttribute("value", value);}
	if(placeholder != ""){input.setAttribute("placeholder", placeholder);}
	
	return input;
}


function isEmpty(obj) {
		let check = true;
		if (obj.value == "") {
			check = false;
		}
		return check;

	}


function meLogIn(){


let mecode = document.getElementsByName("meCode")[0].value;
let mepw = document.getElementsByName("mePw")[0].value;

if(mecode != "" || mepw != "" ){
	let form = document.getElementsByName("dynamicFormdata")[0];
	form.submit();
}else{
 let msg = document.getElementById("msg");
 
 msg.innerText = "올바르게 입력해주세요.";
	
}}

function ctLogIn(){
	let ctcode = document.getElementsByName("ctCode")[0].value;
	let sfcode = document.getElementsByName("sfId")[0].value;
	let sfpw = document.getElementsByName("sfPw")[0].value;
	
     let  ip = jsPIp;

	const hidden = makeInputElement("hidden","ahIp",ip,"");
	
	if(ctcode != "" && sfcode != "" && sfpw != ""){
		let form = document.getElementsByName("dynamicFormdata2")[0];

	form.appendChild(hidden);
	
	form.submit();
}else{
 let msg = document.getElementById("msg");
 ms.innerText = "올바르게 입력해주세요.";
	
}
	

	
}


function modPw(){
	let email = document.getElementById("email").value;
	let pw1 = document.getElementById("pw1").value;
	let pw2 = document.getElementById("pw2").value;
	
	if(pw1 != pw2){
		alert("비밀번호를 확인해주세요.");
		/*
		const msg = "비밀번호를 확인해주세요.";
		document.getElementById("msg").innerText = msg;*/
	}else{
		const hidden1 = makeInputElement("hidden","sfEmail",email,"");
		const hidden2 = makeInputElement("hidden","sfPw",pw2,"");
		
	 const form =  makeForm("","modPw","post");

	form.appendChild(hidden1);
	form.appendChild(hidden2);
	document.body.appendChild(form);
	form.submit();
	
	}
}



function sendEmail(){
	
	
	let email = document.getElementById("email").value;
	 
	const hidden = makeInputElement("hidden","sfEmail",email,"");
	 const form =  makeForm("","sendEmail","post");

	form.appendChild(hidden);
	document.body.appendChild(form);
	form.submit();
	
	
	/*
	let jsondata = [];
	jsondata.push({sfEmail:email});
	
	const clientdata = JSON.stringify(jsondata);
	alert(clientdata);
	whatsend("sendEmail",clientdata,"sendmail",false,"post");
	*/
}


function checkmail(msg){
	alert(msg);
	 msg = document.getElementById("msg");
	
	msg.innerHTML = msg;
	
	
}



function searchMeMg(){
	let ctcode = document.getElementById("caCode");
	let mecode = document.getElementById("meName");
	

	let jsondata = [];
	jsondata.push({"caCode":ctcode,"meName": mecode});
	
	const clientdata = JSON.stringify(jsondata);
	whatsend("ajax/searchMeMg",clientdata,"getselist",false,"post");
	
}

function getselist(data){

	data2 = data;
	const list =  document.getElementById("list");
	
      while(list.hasChildNodes()){
			list.removeChild(list.lastChild);
		}
	for (idx = 0; idx < data2.length; idx++) {
		
		let div = document.createElement("div");
	div.setAttribe("onClick", "showGoodsinModal("+idx+")");
	
	let span1=  document.createElement("span");
	span1.innerText = data[idx].meName;
	let span2=  document.createElement("span");
	span2.innerText = data[idx].meGender;
	let span3=  document.createElement("span");
	span3.innerText = data[idx].meBirth;
	let span4=  document.createElement("span");
	span4.innerText = data[idx].meNumber;
	let span5=  document.createElement("span");
	span5.innerText = data[idx].meLsName;
	div.appendChild(span1);
	div.appendChild(span2);
	div.appendChild(span3);   
	div.appendChild(span4);  

	div.appendChild(span5);           
  list.appendChild(div);

}
	
}

	function getCenterList(mecode){
	
		let jsondata = [];
		
	/*	
	let da =  document.getElementById("da").value;
	let ti =  document.getElementById("ti").value;
	let ctcode = document.getElementsByName("searchct")[0].value;
	let cacode = document.getElementsByName("searchca")[0].value;
	let text = document.getElementsByName("searchbox")[0].value;
	*/
	jsondata.push({"meCode":mecode});
	const clientdata = JSON.stringify(jsondata);
	whatsend("ajax/getLessonList",clientdata,"getmectlist",false,"post");
	
}


	function getmectlist(json){
		 let pjson =JSON.parse(json)

		centerdata = json;
	let body = document.getElementById("category");
	
	if(pjson.length>0){
		data = "<select name='searchct'>"
		for(i=0;i<pjson.length;i++){
			data+=	"<option value='"+pjson[i].ctCode+"'>"+pjson[i].ctName+"</option>"
		}
		data+= "</select>"
		
		data += "<select name='searchca'> "
			data+=	"<option value='sfName' >트레이너명</option>"
			data+=	"<option value='lsName'>수업명</option>"
			data+= "</select>"

	body.innerHTML = data;
	}else{const msg = document.getElementsByClassName("select")[0];
			msg.value = "";
			msg.placeholder="검색어를 확인해 주세요.";
			}
}



	function getctLessonList(){
	
		let jsondata = [];
	let da =  document.getElementById("da").value;

	let ctcode = document.getElementsByName("searchct")[0].value;
	let cacode =  document.getElementsByName("searchca")[0].value;
	let text = document.getElementsByClassName("input")[0].value;
	alert(da );
	alert(ctcode );
	alert(cacode  );
	alert(text );
	
	if(da == null){
	jsondata.push({ctCode: ctcode,caCode:cacode, meBirth: text });
	}else {
	jsondata.push({ctCode: ctcode,meCode:da});
	}
	
	const clientdata = JSON.stringify(jsondata);
	
	whatsend("ajax/searchLsMg",clientdata,"getsearchctlslist",false,"post");
	
}


function getsearchctlslist(data){
	alert(data);
	
}



function getInbodyModal() {
	let container =  document.getElementById("containerIn");
	container.style.filter = "alpha(Opacity=50)";
	container.style.display = "block";
	
	
}
function meLogInModal() {
let containerSF =  document.getElementById("containerSF");
containerSF.style.display = "none";

	let container =  document.getElementById("container");
	container.style.filter = "alpha(Opacity=50)";
	container.style.display = "block";
	
}


function ctLogInModal() {
	let container =  document.getElementById("containerSF");
	container.style.filter = "alpha(Opacity=50)";
	container.style.display = "block";
	
	
}



function closeModalb() {
	// whatsend("https://api.ipify.org?format=json","","getPublicIp",false,"Get");
	let container =  document.getElementById("container");
	let containerSF =  document.getElementById("containerSF");
	
	
	container.style.display = "none";
	containerSF.style.display = "none";

	
}

	
	function sendEmailForm(){
		
		  const form =  makeForm("","sendEmailForm","GET");
document.body.appendChild(form);
		form.submit();
	}
	
	
	function searchLsMg(){
	let ctcode = document.getElementById("caCode");
	alert(ctcode);
	let mecode = document.getElementById("meName");
	

	let jsondata = [];
	jsondata.push({"caCode":ctcode,"meName": mecode});
	
	const clientdata = JSON.stringify(jsondata);
	whatsend("ajax/searchLsMg",clientdata,"getselist",false,"post");
	
}
	
	
	
	
	
	
	
	
	

function goGoodsPage(qctCode){
	const form = makeForm("goGoods", "goGoodsPage", "POST");
	const ctCode = makeInputElement("hidden", "ctCode", qctCode, "");
	
	form.appendChild(ctCode);
	
	document.body.appendChild(form);
	
	form.submit();
}


function goLessonPage(ctcode){
	const form = makeForm("goLesson", "goLessonPage", "POST");
	const ctCode = makeInputElement("hidden", "ctCode", ctcode, "");
	
	form.appendChild(ctCode);
	
	document.body.appendChild(form);
	
	form.submit();
}

function goPayPage(ctcode){
	const form = makeForm("goPay", "goPayPage", "POST");
	const ctCode = makeInputElement("hidden", "ctCode", ctcode, "");
	
	form.appendChild(ctCode);
	
	document.body.appendChild(form);
	
	form.submit();
}

function goJoinPage(){
	const form = makeForm("goJoin", "goJoinPage", "POST");
	
	document.body.appendChild(form);
	
	form.submit();
}

function goMePage(ctcode){
	
	const form = makeForm("goMember", "goMePage", "POST");
	const ctCode = makeInputElement("hidden", "ctCode", ctcode, "");
	
	form.appendChild(ctCode);
	
	document.body.appendChild(form);
	
	form.submit();
}	

function goSfPage(ctcode){

	const form = makeForm("", "goSfPage", "POST");
	const ctCode = makeInputElement("hidden", "ctCode", ctcode, "");
	
	form.appendChild(ctCode);
	
	document.body.appendChild(form);
	
	form.submit();
}	
function goHome() {
	const form = makeForm("", "/", "GET")
      document.body.appendChild(form);
      form.submit();	
}










