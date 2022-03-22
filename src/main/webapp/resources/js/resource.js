/**
 * 
 */


let list;
 let jsPIp;

	

	
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
function getedmelist(dataa){
	let jsondata = [];
	jsondata.push({"ctCode":ctcode});
	const clientdata = JSON.stringify(jsondata);
	whatsend("ajax/meMg","","getedmelist",false,"post");

}
	let data22;
function getedmelist(json){
	alert(JSON.stringify(json));

	let body = document.getElementById("ajax");
	
	if(json.length>0){
		data22 = json;
		data = "<tr><td></td><td>이름</td><td>성별</td><td>연령</td><td>핸드폰</td><td>유형</td></tr>";
		for(i=0;i<json.length;i++){
			data += "<tr>";
			data += "<td><input type=\"radio\" name=\"radibut\"/></td>";
			data += "<td>"+json[i].meName+"</td>";
			data += "<td>"+json[i].meGender+"</td>";
			data += "<td>"+json[i].meBirth+"</td>";
			data += "<td>"+json[i].meNumber+"</td>";
			data += "<td>"+json[i].mecaName+"</td>";
			
			data += "</tr>"
		}
	body.innerHTML = data;
	}else{const msg = document.getElementsByClassName("select")[0];
			msg.value = "";
			msg.placeholder="검색어를 확인해 주세요.";}
}

function writegoodslist(data){
	data22 = data;
	const list =  document.getElementById("list");
	//let message = '<div><span>상품코드</span><span>상품이름</span><span>상품원가</span><span>상품가격</span><span>상품재고</span><span>상품할인률</span><span>판매상태</span><span>사진</span></div>';
      while(list.hasChildNodes()){
			list.removeChild(list.lastChild);
		}
	for (idx = 0; idx < data22.length; idx++) {
		
		let div = document.createElement("div");
	div.setAttribute("onClick", "showGoodsinModal("+idx+")");
	
	let span1=  document.createElement("span");
	span1.innerText = data[idx].goCode;
	let span2=  document.createElement("span");
	span2.innerText = data[idx].goName;
	let span3=  document.createElement("span");
	span3.innerText = data[idx].goPrice;
	let span4=  document.createElement("span");
	span4.innerText = data[idx].goDiscount;
	let span5=  document.createElement("span");
	span5.innerText = data[idx].goImage;
	div.appendChild(span1);
	div.appendChild(span2);
	div.appendChild(span3);   
	div.appendChild(span4);   
	div.appendChild(span5);           
//속성을 포함해서 넣으면 어펜드, 태그부터 넣을거면 innerhtml, 태그안에 텍스트만 넣을거면 innerText
  list.appendChild(div);
     }
}

//모달에서 상세정보보
function showGoodsinModal(data){
	
	let mheader = document.getElementById("mheader");
	let mbody = document.getElementById("mbody");
	//커멘드네임 세팅
	let modalmod2 =  document.getElementsByName("modalmod")[0];

	modalmod2.setAttribute("onClick", "modGoodsInModal("+idx+")");
	modalmod2.setAttribute("value","상품정보수정요청");
	//헤더 수정
	
	mheader.innerText = data[idx].meName +"  회원이름"+"<br>";
	//바디정보
	let body2 = "<table>"+data[idx].meBrith+"<td>나이"+data[idx].meEmail+"</td><td>이메일</td>"+
		
	"<td>매입가"+data[idx].meNumber+"</td>"+"<td>판매가"+data[idx].mePw+"</td>"+
	"<td>재고"+data[idx].locker+"</td>"+"<td>할인률"+data[idx].meGender+"</td>"+"<td>판매상태"+data2[idx].goStatus+"</td></tr>";
		mbody.innerHTML = body2;
	openModal();
}


function modGoodsInModal(idx){
	//폼 수정
	let form = document.getElementsByName("dynamicFormdata")[0];
	form.setAttribute("action", "final/modGoodsInModal");
	form.setAttribute("method", "post");
	form.setAttribute("enctype", "multipart/form-data");
	
	let formdata = new FormData(form);
	formdata.append("goCode",data2[idx].goCode);
	formdata.append("goName",data2[idx].goName);
	formdata.append("goCost",data2[idx].goCost);
	formdata.append("goPrice",data2[idx].goPrice);
	formdata.append("goStatus",data2[idx].goStatus);
	formdata.append("goDiscount",data2[idx].goDiscount);
	formdata.append("goImage",files.length>0?data2[idx].goCode +"."+ files[0].type.substring(files[0].type.indexOf("/")+1) :data2[idx].goImage);
		
		formdata.append("goStock",data2[idx].goStock);
	
		
		ajaxconnection(form.getAttribute("action"),formdata,"udtedGoodsInfo",false);
		}

function udtedGoodsInfo(data){

	closeModal();
	writegoodslist(data);
	
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
		
			window[fn](ajax.responseText);
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

function getAjax(action, data, fn, content ,method) {
   let ajax = new XMLHttpRequest();

   ajax.onreadystatechange = function() {
      if (ajax.readyState == 4 && ajax.status == 200) {
         window[fn](JSON.parse(ajax.responseText));
         //document.getElementById("ajaxData").innerHTML = serverData;
      }
   };
   ajax.open("post", action, true);
   ajax.setRequestHeader("Content-type",
         "application/x-www-form-urlencoded");
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
         "application/x-www-form-urlencoded");
   ajax.send(data);
}

function meProfile(){
	getAjax("ajax/meDtInfo","","modProfileInfo",false,"post");
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

function meDtInf(){
	getAjax("ajax/meDtInfo","","meDtInfo1",false,"post");
	
}

function meDtInfo1(data){
	let STCODE = "M1";
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

function checkMePw(){
		getAjax("ajax/meDtInfo","","checkMePw1",false,"post");
		alert("ss");
	}

function checkMePw2(){
		getAjax("ajax/meDtInfo","","checkMePw3",false,"post");
		alert("ㅇㅇ");
	}

function checkMePw3(data){
	const list = document.getElementById("profile");
	const list2 = document.getElementById("profile2");
	for(idx = 0; idx< data.length; idx++){
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
			input6.setAttribute("onClick","modMeMg()");
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
			alert("1234");
			alert(data[idx].mePw);
		}
		}
}
function modMeMg1(){
	alert("그러게");
}
function modMeMg(){
	let form = document.getElementById("profile2");
	const meEmail = document.getElementById("meEmail").value;
	const meGender = document.getElementById("meGender").value;
	const meBirth = document.getElementById("meBirth").value;
	const meName = document.getElementById("meName").value;
	const meNumber = document.getElementById("meNumber").value;
	let jsondata = [];
	jsondata.push({meEmail:meEmail,meGender:meGender,meBirth:meBirth,meName:meName,meNumber:meNumber});
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
	
function getmemList(list, stcode, elcode){

	let data = "stCode=" + encodeURIComponent(stcode);
	
	//getAjaxJson(list, data, "getedmemlist", "post")
	
	
	getAjaxJsonUsingJquery("ajax/MemberList", data, "getedmemlist");
	
}

function getedmemlist(data){
	 message = '<table><tr><td>매장코드</td><td>회원코드</td><td>회원이름</td><td>회원등급</td></tr>';
      for (idx = 0; idx < data.length; idx++) {
         message += '<tr><td>' + data[idx].stCode + '</td><td>'
               + data[idx].cmCode + '</td><td>' + data[idx].cmName
               + '</td><td>' + data[idx].cmRank + '</td>';
         message += '</tr>';
      }
      message += '</table>';
      document.getElementById("list").innerHTML = message;
	
}
function getempList(list, stcode, elcode){
	

	let data = "stCode=" + encodeURIComponent(stcode)+"&elCode="+encodeURIComponent(elcode);
	
	whatsend(list, data, "getedemplist", "post")
}
function getedemplist(data){
	
	message = '<table><tr><td>매장코드</td><td>직원코드</td><td>직원이름</td><td>직원등급</td></tr>';
      for (idx = 0; idx < data.length; idx++) {
         message += '<tr><td>' + data[idx].stCode + '</td><td>'
               + data[idx].elCode + '</td><td>' + data[idx].elName
               + '</td><td>' + data[idx].lvCode+ '</td>';
         message += '</tr>';
      }

      message += '</table>';


      document.getElementById("list").innerHTML = message;
	
}
function isEmpty(obj) {
		let check = true;
		if (obj.value == "") {
			check = false;
		}
		return check;

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

function getmanagepage(stcode,elcode,lvcode){
	
	const form = makeForm("", "GETMANAGEMENTPAGE", "get")
const StCode = makeInputElement("hidden","StCode",stcode,"");
const ElCode = makeInputElement("hidden","ElCode",elcode,"");    
const lvCode = makeInputElement("hidden","lvCode",lvcode,"");

form.appendChild(lvCode);
form.appendChild(StCode);
form.appendChild(ElCode);
      
      document.body.appendChild(form);
      form.submit();
	
	
}
function getsalespage(stcode,elcode,lvcode){
	
	const form = makeForm("", "GETSALESPAGE", "get")
const StCode = makeInputElement("hidden","StCode",stcode,"");
const ElCode = makeInputElement("hidden","ElCode",elcode,"");    



form.appendChild(StCode);
form.appendChild(ElCode);
      
      document.body.appendChild(form);
      form.submit();
	

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


function logOut(stcode,elcode){
	
const form = makeForm("", "AccessOut", "post")
const StCode = makeInputElement("hidden","StCode",stcode,"");
const ElCode = makeInputElement("hidden","ElCode",elcode,"");
const PublicIp = makeInputElement("hidden","PublicIp",jsPIp,"");
	form.appendChild(StCode);
	form.appendChild(ElCode);
	form.appendChild(PublicIp);
      
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
	
	 
function auth() {

	
	const hidden = makeInputElement("hidden","publicIp",jsPIp,"");
	let form = document.getElementsByName("login")[0];
	form.appendChild(hidden);
	
	const userData = [document.getElementsByName("stCode")[0],
	document.getElementsByName("elCode")[0],
	document.getElementsByName("elPassword")[0],
	document.getElementsByName("publicIp")[0]];


	
 	message = ["매장코드없음","직원코드없음","직원비번없음","ip안넘어옴"];
for(let index = 0; index< userData.length; index++){
	if(!isEmpty(userData[index])){
		alert(message[index]);

		return;
	}
}
	
        form.submit();
	
      }


function ClickOrderList(srCode){
		let list = document.getElementById("list");
		
		while(list.hasChildNodes()){
			list.removeChild(list.lastChild);
		}
					
	const day = document.querySelector("#date").value;
	if(day==""){
		alert("날짜를 선택해주세요.");
		return;
	}
		let data = "srCode=" + encodeURIComponent(srCode)+"&otDate="+encodeURIComponent(day);
	//alert(data);
	whatsend("GetOrderInfo",data, "addOrders");
	
		}


	
	


	

function addOrders (ordersInfo) {

	let list = document.getElementById("list");	
	if(Object.keys(ordersInfo).length != 0){
	for (colIndex= 0; colIndex <Object.keys(ordersInfo).length ; colIndex++) {	
		
		orderOne[colIndex] = 
   		"<span id = 'otDate'>"+ordersInfo[colIndex].otDate+"</span>"+'\u00A0'+
        "<span id = 'otTime'>"+ ordersInfo[colIndex].otTime+"에"+"</span>"+'\u00A0'+
      	"<span id = 'meCode'>"+ordersInfo[colIndex].meCode+"</span>"+
        "<span id = 'meName'>"+ordersInfo[colIndex].meName +"</span>"+'\u00A0'+"*"+'\u00A0'+
        "<span id = 'otQuantity'>"+ordersInfo[colIndex].otQuantity+"개"+"</span>"+'\u00A0'+
        "<span id = 'cuName'>"+ordersInfo[colIndex].cuName+"</span>"+"("+'\u00A0'+
        "<span id = 'cuNumber'>"+ordersInfo[colIndex].cuNumber+"</span>"+") 님이"+
        "<span id = 'stCode'>" +ordersInfo[colIndex].stCode+"</span>"+'\u00A0'+
        "<span id = 'stName'>"+ordersInfo[colIndex].stName+"</span>"+"하셨습니다.";
					
		let div = document.createElement("div");
		div.setAttribute("class","oneorder");
		div.innerHTML = orderOne[colIndex];
				
			
		list.appendChild(div);
	}
		}else{
			alert("해당 날짜의 주문이 없습니다.");
		}
			
}

document.onkeydown = function(e){
	// 새로고침 Ctrl+R Ctrl+N
	const k = e.keyCode;
	//F5
	if(k == 116 || (e.ctrlKey && k == 82)){
		refresh('1006','1006');
		e.preventDefault(); //기존이벤트사용하게방지
		e.returnValue = ''; //크롬필수로 ㄷ리턴값줘야함
	}
	
}

function refresh(stCode, elCode) {
	
	const form = makeForm("", "Refresh", "post");
	const clientData = [makeInputElement("hidden", "stCode", stCode, ""), makeInputElement("hidden", "elCode", elCode, ""), makeInputElement("hidden", "publicIp", publicIp, "")];
	
	for(idx=0; idx<clientData.length;idx++){
		form.appendChild(clientData[idx]);
	}		

	document.body.appendChild(form);
	form.submit();
}


function meLogIn(){
	let form = document.getElementsByName("dynamicFormdata")[0];
	form.submit();
	
}

function ctLogIn(){
	
     let  ip = jsPIp;

	const hidden = makeInputElement("hidden","ahIp",ip,"");
	
	let form = document.getElementsByName("dynamicFormdata2")[0];

	
	form.appendChild(hidden);
	
	
	
	
	form.submit();
	
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
function ctLogIn(){
	
     let  ip = jsPIp;
	const hidden = makeInputElement("hidden","ahIp",ip,"");
	let form = document.getElementsByName("dynamicFormdata2")[0];
	form.appendChild(hidden);
	form.submit();
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
//속성을 포함해서 넣으면 어펜드, 태그부터 넣을거면 innerhtml, 태그안에 텍스트만 넣을거면 innerText
  list.appendChild(div);

}
	
}



function getInbodyModal() {
	let container =  document.getElementById("containerIn");
	container.style.filter = "alpha(Opacity=50)";
	container.style.display = "block";
	
	
}
function meLogInModal() {
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
	 whatsend("https://api.ipify.org?format=json","","getPublicIp",false,"Get");
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




