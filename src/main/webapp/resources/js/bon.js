

let jsPIp;




let data3;
function getmemberlist(data){
	
	
	data3 = data;
	const list =  document.getElementById("list");
	
      while(list.hasChildNodes()){
			list.removeChild(list.lastChild);
		}
	for (idx = 0; idx < data3.length; idx++) {
		
		let div = document.createElement("div");
	div.setAttribute("onClick", "showGoodsinModal("+idx+")");
	
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


function searchMeMg(){
	let ctcode = document.getElementById("caCode");
	let mecode = document.getElementById("meName");
	

	
	
	let jsondata = [];
	jsondata.push({"caCode":ctcode,"meName": mecode});
	
	const clientdata = JSON.stringify(jsondata);
	whatsend("ajax/searchMeMg",clientdata,"getselist",false,"post");
	
}
function getselist(data){

	data3 = data;
	const list =  document.getElementById("list");
	
      while(list.hasChildNodes()){
			list.removeChild(list.lastChild);
		}
	for (idx = 0; idx < data3.length; idx++) {
		
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

function getPublicIp(pip){
	jsPIp = pip.ip;
	
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
	let containerIn =  document.getElementById("containerIn");
	
	container.style.display = "none";
	containerSF.style.display = "none";

	
	
	
}

	function UploadFilebyAJax() {
		let form = document.getElementsByName("dynamicFormDataIn")[0];
		
		
	form.submit();

		
	}
	
	
	
	function sendEmailForm(){
		  const form =  makeForm("","sendEmailForm","GET");
		form.submit;
	}
	
	function ajaxFromData(action, data, fn, method) {
		const ajax = new XMLHttpRequest();
		
		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4 && ajax.status == 200) {
			//alert(ajax.responseText);
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
		
		const list =  document.getElementById("msg");
		
		let span1=  document.createElement("span");
	span1.innerText = msg;
	div.appendChild(span1);
	list.appendChild(div);
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



function loadPage(msg){
	if(!msg==""){}else{}

}


function logOut(ct,id){
	 whatsend("https://api.ipify.org?format=json","","getPublicIp",false,"Get");
	
	
	let a = makeInputElement("hidden", "sfId", id);
	let b = makeInputElement("hidden", "ctCode", ct);
	let form = makeForm("", "logOut", "POST");
	form.appendChild(a);
	form.appendChild(b);
      document.body.appendChild(form);
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


function refresh(stCode, elCode) {
	
	const form = makeForm("", "Refresh", "post");
	const clientData = [makeInputElement("hidden", "stCode", stCode, ""), makeInputElement("hidden", "elCode", elCode, ""), makeInputElement("hidden", "publicIp", publicIp, "")];
	
	for(idx=0; idx<clientData.length;idx++){
		form.appendChild(clientData[idx]);
	}		

	document.body.appendChild(form);
	form.submit();
}





	

		
		




