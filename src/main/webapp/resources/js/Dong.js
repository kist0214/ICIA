/**
 * 
 */

let data;


function sfMg(ctcode) {
closeModalIn(); //지우지마시오
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
	datad = '<tr><td><input type="radio" name="radioBtn"/></td><td>사원번호</td><td>직원명</td><td>직원등급</td><td>전화번호</td></tr>';	
	
	for (i=0; i<json.length;i++) {
		
		datad += '<tr><td><input type="radio" name="radioBtn"/></td>'
		datad += '<td>' + json[i].sfId + '</td>' 
		datad += '<td>' + json[i].sfName + '</td>'
		datad += '<td>' + json[i].caName + '</td>'
		datad += '<td>' + json[i].sfNumber + '</td>';
		datad += '</tr>';

	}

	list.innerHTML = datad;
	}else{const msg = document.getElementsByClassName("searchSf")[0];
			msg.value = "";
			msg.placeholder= "검색어를 입력해주세요.";
			}
}

function searchSfMg(ctcode){
	
	const searchText = document.getElementById("searchMenu").value;
	
	const searchSf = document.getElementsByClassName("searchSf")[0].value;
	
	let json = [];
	json.push({ctCode : ctcode, caCode : searchText, sfName : searchSf});
	if(searchSf==""){
		sfMg(ctcode);
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

function getSfMaxCode(sfMaxCodes){
	let data;
	const sfCode = document.getElementById("sfCode");
	for(i=0;i<sfMaxCodes.length;i++){
		if(sfMaxCodes[i].caCode=="M1"){
			data += "<option value=\""+sfMaxCodes[i].caName+"\">관리자</option>"
		}else if(sfMaxCodes[i].eqCaCode=="M2"){
			data += "<option value=\""+sfMaxCodes[i].caName+"\">트레이너</option>"
		}else if(sfMaxCodes[i].eqCaCode=="M3"){
			data += "<option value=\""+sfMaxCodes[i].caName+"\">안내원</option>"
		}
	}
	sfCode.innerHTML=data;
}

function modSf() {
	let ctcode = document.getElementsByName("sfCtCode")[0].value;
	let id = document.getElementsByName("sfId")[0].value;
	let name =  document.getElementsByName("sfName")[0].value;
	let number =  document.getElementsByName("sfNumber")[0].value;
	let password =  document.getElementsByName("sfPw")[0].value;
	let email =  document.getElementsByName("sfEmail")[0].value;
	let rank =  document.getElementsByName("sfRank")[0].value;	
	
	
	let json = [];
	json.push({"sfCtCode": ctcode, "sfId": id ,"sfName" : name, "sfNumber" : number , "sfPw" : password , "sfEmail" : email, "sfRank" : rank});
	const clientData = JSON.stringify(json);
	getAjax("ajax/modSf", clientData, "sfList", false);

}


function getAjax(action, data, fn,  content) {
	let ajax = new XMLHttpRequest();

	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			alert(ajax.responseText);
			window[fn](JSON.parse(ajax.responseText));
			//document.getElementById("ajaxData").innerHTML = serverData;
		}
	};

	ajax.open("post", action, true);
	ajax.setRequestHeader("Content-type",
			content ? "application/x-www-form-urlencoded"
					: "application/json; charset=UTF-8");
	
	ajax.send(data);
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
      ajax.setRequestHeader("Content-type", "application/json; charset=utf-8");
   }
   ajax.send(data);
}

/* Modal Dialog */


function getMaxSf() {
		let container = document.getElementById("container");
		container.style.filter = "alpha(Opacity=50)";
		container.style.display = "block";
	}


function modSfModal() {
	let container1 = document.getElementById("container1");
	container1.style.filter = "alpha(Opacity=50)";
	container1.style.display = "block";
}



function closeModalIn() {
	let containerIn =  document.getElementsByName("containerIn")[0];
	containerIn.style.display = "none";

}

function UploadinbodyFile() {
		 const form = document.getElementsByName("containerIn")[0];
		form.submit();
	}
	
	
	function UploadinbodyFile() {
		 const form = document.getElementsByName("containerIn")[0];

				 let data = new FormData(form);
				 ajaxFromData("insInbody",data,"ajaxCallback","POST");
	}
	
	
	function ajaxFromData(action, data, fn, method) {
		const ajax = new XMLHttpRequest();
		
		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4 && ajax.status == 200) {
			
			window[fn](JSON.parse(ajax.responseText));
			
			
		}
		};
		if(method == "Get"){
			ajax.open("get", action, true);
		}
		else{
		ajax.open("post", action, true);
		//ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8 ");
		}
		ajax.send(data);
	}
	
	function ajaxCallback(msg){
	
		let ms = document.getElementById("msg");
		ms.innerText = msg.msg;
	}

	
	

		
	
function openModalIn() {
	
	let containerIn = document.getElementsByName("containerIn")[0];
	containerIn.style.filter = "alpha(Opacity=50)";
	containerIn.style.display = "block";

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

function getMaxLesson() {
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

function selectDateCheck() {
					// 현재 년월일 지정, 년월일 select 지정
					var nowDate = new Date(), nowYear = nowDate.getFullYear(), nowMonth = nowDate
							.getMonth() + 1, nowDay = nowDate.getDay(), _wrap = document
							.querySelectorAll('.ui-check-date'), _select = document
							.querySelectorAll('.ui-check-date select'), _year = document
							.querySelectorAll('.ui-check-date select[data-unit=y]'), _month = document
							.querySelectorAll('.ui-check-date select[data-unit=m]'), _day = document
							.querySelectorAll('.ui-check-date select[data-unit=d]'), yearTerm = 5; // default 년도 기간 설정

					// 초기 년도 설정
					// (1) data-tearm : 년도 기간 설정
					// (2) data-point : 년도 시점 설정
					for (var i = 0; i < _wrap.length; i++) {
						var startYear, endYear, setTerm = _wrap[i]
								.getAttribute('data-term') * 1, setPoint = _wrap[i]
								.getAttribute('data-point'), num = 0;

						_year[i].options[0] = new Option(_year[i]
								.getAttribute('data-default-option'), 'default'); // 'default' || ''

						// data-term 속성값이 있을 경우 기간 적용
						if (setTerm != null && setTerm != '') {
							yearTerm = setTerm;
						}

						// 년도 option 설정
						if (setPoint == 'up') {
							// 미래~현재
							startYear = nowYear + yearTerm;
							endYear = nowYear;
						} else if (setPoint == 'down' || setPoint == ''
								|| setPoint == null) {
							// 현재~과거
							startYear = nowYear;
							endYear = nowYear - yearTerm;
						} else {
							// up, down, null 이외의 값 지정
						}

						for (var j = startYear; j >= endYear; j--) {
							num++;
							_year[i].options[num] = new Option(j, j);
						}
					}

					// 초기 월 설정
					for (var i = 0; i < _wrap.length; i++) {
						_month[i].options[0] = new Option(_month[i]
								.getAttribute('data-default-option'), 'default');
						for (var j = 1; j <= 12; j++) {
							_month[i].options[j] = new Option(j, j);
						}
					}

					// 초기 일 절정
					for (var i = 0; i < _wrap.length; i++) {
						_day[i].options[0] = new Option(_day[i]
								.getAttribute('data-default-option'), 'default');
						for (var j = 1; j <= 31; j++) {
							_day[i].options[j] = new Option(j, j);
						}
					}

					// 년 선택 시, 일 설정 함수 실행
					for (var i = 0; i < _wrap.length; i++) {
						_year[i]
								.addEventListener('change', selectSetDay, false);
					}

					// 월 선택 시, 일 설정 함수 실행
					for (var i = 0; i < _wrap.length; i++) {
						_month[i].addEventListener('change', selectSetDay,
								false);
					}

					// 일 설정 함수
					function selectSetDay() {
						// 평년 각 달의 일수 배열
						// 선택한 select 그룹의 년월일 option value
						var arrDay = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31,
								30, 31 ], lastDay, wrap = this.parentNode, yearVal = wrap
								.querySelector('select[data-unit=y]').value, monthVal = wrap
								.querySelector('select[data-unit=m]').value, selectedDay = wrap
								.querySelector('select[data-unit=d]'), dayVal = selectedDay.value, defaultTxt = selectedDay
								.getAttribute('data-default-option'), defaultVal = 'default'; // 'default' || ''

						// 윤달체크 (true : 2월 마지막날 29일)
						if (yearVal % 4 == 0 && yearVal % 100 != 0
								|| yearVal % 400 == 0) {
							arrDay[1] = 29;
						}
						// 선택한 달의 일수 설정
						lastDay = (monthVal != defaultVal) ? arrDay[monthVal - 1]
								: 31;

						// 일 option 재설정
						selectedDay.options.length = 0; // option 목록 초기화
						selectedDay.options[0] = new Option(defaultTxt,
								defaultVal);
						for (var i = 1; i <= lastDay; i++) {
							selectedDay.options[i] = new Option(i, i);
						}

						// 선택한 날과 그 달의 마지막 날 비교
						// 선택한 날이 default가 아니고 마지막 날 보다 크면 : 마지막 날짜로 선택 일 변경
						// 아니면 : 선택한 날 그대로 가져감
						selectedDay.value = (dayVal != defaultVal && dayVal > lastDay) ? lastDay
								: dayVal;
					}
				}

				window.onload = function() {
					selectDateCheck();
				}
	
let lsInfo;
let datat;
	
function lessonMg(ctcode) {

	alert(ctcode);
	let jsonData = [];
	jsonData.push({ctCode:ctcode});
	const clientData = JSON.stringify(jsonData);
	
	getAjax("ajax/lessonMg", clientData, "lsList", false);
	
}

function lsList(jsonData) {
	lsInfo = jsonData;
	
	alert(jsonData);
	let body = document.getElementById("ajax");

	if(jsonData.length>0){
	datat = '<tr><td><input type="radio" name="radioBtn"/></td><td>수업명</td><td>개강일</td><td>트레이너명</td><td>수강인원</td></tr>';	
	
	for (i=0; i<jsonData.length;i++) {
		datat += '<tr>'
		datat += '<td><input type="radio" name="radioBtn"/></td>'
		datat += '<td>' + jsonData[i].lsName + '</td>' 
		datat += '<td>' + jsonData[i].lsOpen + '</td>'
		datat += '<td>' + jsonData[i].sfName + '</td>'
		datat += '<td>' + jsonData[i].lsMeCount + '</td>'
		datat += '</tr>';

	}
	alert(datat);
	body.innerHTML = datat;
	}else{const msg = document.getElementsByClassName("searchLs")[0]
			msg.value = "";
			msg.placeholder="검색어를 입력해주세요.";}
}

function searchLesson(ctcode){
	const searchText = document.getElementById("lsSearch");
	const searchLs = document.getElementsByClassName("searchLs")[0].value;
	let json = [];
	json.push({ctCode : ctcode, sfName : searchText, lsName : searchLs});
	if(searchLs==""){
		lessonMg(ctcode);
	}else{
		const data = JSON.stringify(json);
		getAjax("ajax/searchLesson", data, "lsList", false);
	}
	}
	
	