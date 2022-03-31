
let data;


function sfMg(ctcode) {

closeModal();


	let jsonData = [];
	jsonData.push({ctCode:ctcode});
	const clientData = JSON.stringify(jsonData);
	
	getAjax("ajax/sfMg", clientData, "sfList", false);
	
}
let sfInfo;
let datad;
function sfList(json) {

	closeModal();
	let list = document.getElementById("ajax");
	
	if(json.length>0){
	sfInfo = json;
	datad = '<table><tr><td></td><td>사원번호</td><td>직원명</td><td>직원등급</td><td>이메일</td><td>전화번호</td></tr>';	
	
	for (i=0; i<json.length;i++) {
		
		datad += '<tr><td><input type="checkbox" name="radioBtn"/></td>'
		datad += '<td>' + json[i].sfId + '</td>' 
		datad += '<td>' + json[i].sfName 
		datad += '</td><td>' + json[i].caName 
		datad += '</td><td>' + json[i].sfEmail  
		datad += '</td><td>' + json[i].sfNumber + '</td>';
		datad += '</tr>';

	}
	datad += '</table>';
	
	

	list.innerHTML = datad;
	}else{const msg = document.getElementsByClassName("searchSf")[0]
			msg.value = "";
			msg.placeholder="입력해주세요.";}
}

function searchSfMg(ctcode){
	
	const searchText = document.getElementById("searchMenu").value;
	const searchSf = document.getElementsByClassName("searchSf")[0].value;

let json = [];
	
	json.push({ctCode:ctcode,caCode:searchText,caName:searchSf});
	if(searchSf==""){
		sfMg(ctCode);
	}else{
		const data = JSON.stringify(json);
		getAjax("ajax/searchSfMg", data, "sfList", false);
	}
}


function insSf() {
	let ctcode = document.getElementsByName("ctCode")[1].value;
	let id = document.getElementsByName("sfId")[1].value;
	let name =  document.getElementsByName("sfName")[1].value;
	let number =  document.getElementsByName("sfNumber")[1].value;
	let password =  document.getElementsByName("sfPw")[1].value;
	let email =  document.getElementsByName("sfEmail")[1].value;
	let caname =  document.getElementsByName("caName")[1].value;	

	let json = [];
	json.push({"ctCode": ctcode, "sfId": id ,"sfName" : name, "sfNumber" : number , "sfPw" : password , "sfEmail" : email, "caName" : caname});
	const clientData = JSON.stringify(json);
	getAjax("ajax/insSf", clientData, "sfList", false);

}

function modSf() {
	let ctcode = document.getElementsByName("ctCode")[0].value;
	let id = document.getElementsByName("sfId")[0].value;
	let name =  document.getElementsByName("sfName")[0];
	let number =  document.getElementsByName("sfNumber")[0];
	let password =  document.getElementsByName("sfPw")[0].value;
	let email =  document.getElementsByName("sfEmail")[0];
	let rank =  document.getElementsByName("sfRank")[0].value;
	let json = [];
	if(name.value == ""){
		name = name.placeholder;
	}else{
		name = name.value;
	}
	if(number.value == ""){
		number = number.placeholder;
	}else{
		number = number.value;
	}
	if(email.value == ""){
		email = email.placeholder;
	}else{
		email = email.value;
	}
	
	var clientData;
	if(password == ""){
		json.push({ctCode: ctcode, sfId: id ,sfName : name, sfNumber : number , sfEmail : email, sfRank : rank});
		clientData = JSON.stringify(json);
		getAjax("ajax/modSf2", clientData, "sfList", false);
	}else{
		json.push({ctCode: ctcode, sfId: id ,sfName : name, sfNumber : number , sfPw : password , sfEmail : email, sfRank : rank});
		clientData = JSON.stringify(json);
		getAjax("ajax/modSf", clientData, "sfList", false);
	}
	closeModal1();
}


function getAjax(action, data, fn,  content) {
	let ajax = new XMLHttpRequest();

	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			
			window[fn](JSON.parse(ajax.responseText));
			//document.getElementById("ajaxData").innerHTML = serverData;
		}
	};

	ajax.open("post", action, true);

	ajax.setRequestHeader("Content-Type",content? "application/x-www-form-urlencoded;charset=utf-8 ":"application/json;charset=utf-8");
	
	ajax.send(data);
}

function getAjaxData(action, data) {
	let ajax = new XMLHttpRequest();

	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			let serverData = ajax.responseText;
			if (serverData.substr(0, 1) != "<") {

				document.getElementById(serverData).click();
			} else {

				document.getElementById("ajaxData").innerHTML = serverData;
			}

		}
	};

	ajax.open("post", action, true);
	ajax.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	ajax.send(data);
}

/* Modal Dialog */


function getMaxSf() {
		let container = document.getElementById("container");
		container.style.filter = "alpha(Opacity=50)";
		container.style.display = "block";
	}


function modSfModal() {
	const sfSelect = document.getElementsByName("radioBtn");
	const sfId = document.getElementsByName("sfId")[0];
	const sfName = document.getElementsByName("sfName")[0];
	const sfNumber = document.getElementsByName("sfNumber")[0];
	const sfEmail = document.getElementsByName("sfEmail")[0];
	const sfRank = document.getElementsByName("sfRank")[0];
	 // 선택된 목록 가져오기
  	const sfCheck = 'input[name="radioBtn"]:checked';
  	// 선택된 목록의 갯수 세기
  	const sfCheckNum = document.querySelectorAll(sfCheck).length;
	if(sfCheckNum==0){
		alert("먼저 선택해주세요.");
		return;
	}else if(sfCheckNum>1){
		alert("하나만 선택해주세요.");
		return;
	}
	for(i=0;i<sfSelect.length;i++){
		if(sfSelect[i].checked==true){
			sfId.value = sfInfo[i].sfId;
			sfName.placeholder = sfInfo[i].sfName;
			sfNumber.placeholder = sfInfo[i].sfNumber;
			sfEmail.placeholder = sfInfo[i].sfEmail;
			for(j=0;j<sfRank.length;j++){
				if(sfRank.options[j].innerText == sfInfo[i].caName){
					sfRank.options[j].setAttribute('selected', '');
				}else{
					sfRank.options[j].removeAttribute('selected');
				}
			}
		}
	}
	let container1 = document.getElementById("container1");
	container1.style.filter = "alpha(Opacity=50)";
	container1.style.display = "block";
}







		
	


 function closeModal() {
		let container = document.getElementById("container");
		container.style.display = "none";
		
	}

 
 function closeModal1() {
		let container1 = document.getElementById("container1");
		container1.style.display = "none";
	}
	
function closeModal2() {
		let container2 = document.getElementById("container2");
		container2.style.display = "none";
		
	}

function closeModal3() {
		let container3 = document.getElementById("container3");
		container3.style.display = "none";
		
	}

function closeModal4() {
		let container4 = document.getElementById("container4");
		container4.style.display = "none";
	}

function getLsCaList() {
	let container2 = document.getElementById("container2");
	container2.style.filter = "alpha(Opacity=50)";
	container2.style.display = "block";
}

function getMaxLesson(ctcode,sfcode) {
	var json = []
	json.push({ctCode:ctcode,sfCode:sfcode});
	const data = JSON.stringify(json);
	getAjax("ajax/getMaxLesson",data,"getMaxLesson2",false);
}
function getMaxLesson2(json) {
	const lscode = document.getElementsByName("lsCode")[0];
	lscode.setAttribute("value",json.lsCode);
	lscode.setAttribute("readOnly",true);
	let container3 = document.getElementById("container3");
	container3.style.filter = "alpha(Opacity=50)";
	container3.style.display = "block";
}

function modLessonModal() {
	let container4 = document.getElementById("container4");
	container4.style.filter = "alpha(Opacity=50)";
	container4.style.display = "block";
}


/* selectRecord */
function selectRecord(sfCode){
  if(currentRecord != null) {
	currentRecord.style.color = "#000000";
	currentRecord = null;
	}
	
	currentRecord = sfCode;
	sfCode.style.color = "#FF007F";
}

/* Lesson */

function goLessonPage(ctcode) {
	const form = makeForm("goLesson", "goLessonPage", "POST");
	const ctCode = makeInputElement("hidden", "ctCode", ctcode, "");
	
	form.appendChild(ctCode);
	
	document.body.appendChild(form);
	
	form.submit();
}

function lessonMg(ctCode) {

closeModal3();

	let jsonData = [];
	jsonData.push({ctCode:ctCode});
	const clientData = JSON.stringify(jsonData);
	
	getAjax("ajax/lessonMg", clientData, "lsList", false);
	
}

	
let lsInfo;
	let datat;
function lsList(jsonData) {
	datat = jsonData;
	
	
	let body = document.getElementById("list");

	if(jsonData.length>0){
	lsInfo = jsonData;
	datat = '<tr><td></td><td>수업명</td><td>개강일</td><td>트레이너명</td><td>수강인원</td></tr>';	
	
	for (i=0; i<jsonData.length;i++) {
		
		datat += '<tr><td><input type="checkbox" name="radioBtn"/></td>'
		datat += '<td>' + jsonData[i].lsName + '</td>' 
		datat += '<td>' + jsonData[i].lsOpen 
		datat += '</td><td>' + jsonData[i].sfName  
		datat += '</td><td>' + jsonData[i].lsMeCount + '</td>';
		datat += '</tr>';

	}
	body.innerHTML = datat;
	}else{const msg = document.getElementsByClassName("lsSearchBtn")[0]
			msg.value = "";
			msg.placeholder="입력해주세요.";}
	closeModal2();
	
}

function searchLesson(ctcode){
	const time = document.getElementsByName("bdaytime")[0].value;
	const searchText1 = document.getElementById("searchSf").value;
	var searchLs = document.getElementsByClassName("lsSearchBtn")[0].value;
if(searchLs ==""){
	searchLs = "    ";
}
	let json = [];
	json.push({ctCode:ctcode, lsOpen:time, lsName:searchText1, sfName:searchLs});
	if(searchLs==""){
		lessonMg(ctcode);
	}else{
		const data = JSON.stringify(json);
		getAjax("ajax/searchLesson", data, "lsList", false);
	}
   }


function insLsPay() {
	let ctcode = document.getElementsByName("ctCode")[0].value;
	let cacode = document.getElementsByName("caCode2")[0].value;
	let qty =  document.getElementsByName("lpQty")[0].value;
	let price =  document.getElementsByName("lpPrice")[0].value;
		

	let json = [];
	json.push({"ctCode": ctcode, "caCode": cacode ,"lpQty" : qty, "lpPrice" : price});
	const clientData = JSON.stringify(json);
	getAjax("ajax/insLsPay", clientData, "lsList", false);
	
	closeModal2();
	
}

function insLesson(ctcode) {
	let sfcode = document.getElementsByName("sfCode")[0].value;
	let sfname =  document.getElementsByName("sfName")[0].value;
	let lscode =  document.getElementsByName("lsCode")[0].value;
	let cacode =  document.getElementsByName("caCode")[0].value;
	let lsname =  document.getElementsByName("lsName")[0].value;
	let lsopen =  document.getElementsByName("lsOpen")[0].value;
	let lsprogress =  document.getElementsByName("lsProgress")[0].value;
	let lsmecount =  document.getElementsByName("lsMeCount")[0].value;
	
	
	let json = [];
	json.push({"ctCode": ctcode, "sfCode": sfcode , "sfName" : sfname , "lsCode" : lscode ,  "caCode" : cacode, "lsName" : lsname , "lsOpen" : lsopen , "lsProgress":lsprogress, "lsMeCount" : lsmecount});
	const clientData = JSON.stringify(json);

	getAjax("ajax/insLesson", clientData, "lsList", false);
	closeModal3();
	 
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
