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

function goodsMg(ctCode){
	json=[];
	json.push({ctCode:ctCode});
	alert(ctCode);
	const data = JSON.stringify(json);
	ajaxconnection("ajax/goodsMg", data, "goodsList", true);
}


let goodsInfo;
function goodsList(json){
	alert(JSON.stringify(json));
	YcloseModal();
	let body = document.getElementById("ajax");
	let data;
	if(json.length>0){
		goodsInfo = json;
		data = "<tr><td></td><td>장비코드</td><td>장비명</td><td>분류</td><td>담당자</td><td>관리일자</td><td>상태</td></tr>";
		for(i=0;i<json.length;i++){
			data += "<tr>";
			data += "<td><input type=\"radio\" name=\"radibut\"/></td>";
			data += "<td>"+json[i].eqCode+"</td>";
			data += "<td>"+json[i].eqName+"</td>";
			data += "<td>"+json[i].eqCaName+"</td>";
			data += "<td>"+json[i].sfName+"</td>";
			data += "<td>"+json[i].egDate+"</td>";
			data += "<td>"+json[i].stName+"</td>";
			data += "</tr>"
		}
	body.innerHTML = data;
	}else{const msg = document.getElementsByClassName("searchGo")[0];
			msg.value = "";
			msg.placeholder="검색어를 확인해 주세요.";}
}

function searchGoods(ctcode){
	const searchText = document.getElementById("searchCategory");
	const searchGo = document.getElementsByClassName("searchGo")[0].value;
	let json = [];
	json.push({ctCode:ctcode,eqCaCode:searchText.value,eqCaName:searchGo});
	if(searchGo==""){
		goodsMg(ctcode);
	}else{
		const data = JSON.stringify(json); 
		ajaxconnection("ajax/searchGoods", data, "goodsList", true);
	}
}

function getCaCode(ctcode){
	var radio =document.getElementsByName("radibut");
	let idx;
	for (i=0; i<radio.length; i++) {
		if (radio[i].checked == true) {
			idx = i;
		}
	}
	
	document.getElementById("mdtitle").innerText = "장 비 수 정";
	let data = "<div><span>장비코드</span><br><span id=\"meqCode\">"+goodsInfo[idx].eqCode+"</span></div>";
	data += "<div><span>장비명</span><br><input type=\"text\" id=\"meqName\"value=\""+goodsInfo[idx].eqName+"\" placeholder=\"장비명을 입력해 주세요.\"/></div>";
	data += "<div><span>담당자</span><br><select id = \"msfCode\"></select></div>";
	data += "<div><span>관리일자<span><input id=\"egDate\" type=\"date\"/></div>";
	data += "<div><span>분류</span><br><select id=\"mcaCode\"></select></div>";
	data += "<div><span>상태</span><br><select id = \"mstCode\"></select></div>";
	data += "<input type=\"button\" value=\"modify\" onclick=\"modGoods('"+ctcode+"')\"/>";
	document.getElementById("mdbody").innerHTML=data;
	let json=[];
	json.push({ctCode:ctcode});
	const jsonData = JSON.stringify(json);
	ajaxconnection("ajax/getGoCaList", jsonData, "subModGoods", true);
	openModal();
}

function subModGoods(caData){
	const option = document.getElementById("mcaCode");
	const sfCode = document.getElementById("msfCode");
	const stCode = document.getElementById("mstCode");
	const egdate = document.getElementById("egDate");
	let data1;
	let data2;
	let data3;
	for(i=0;i<caData.length;i++){
		if(caData[i].eqCaCode != null){
			data1 += "<option value=\""+caData[i].eqCaCode+"\">"+caData[i].eqCaName+"</optiion>";
		}
	}
	for(i=0;i<caData.length;i++){
		if(caData[i].sfCode != null){
			data2 += "<option value=\""+caData[i].sfCode+"\">"+caData[i].sfName+"</optiion>";
		}
	}
	for(i=0;i<caData.length;i++){
		if(caData[i].stCode != null){
			data3 += "<option value=\""+caData[i].stCode+"\">"+caData[i].stName+"</optiion>";
		}
	}
	option.innerHTML=data1;
	sfCode.innerHTML=data2;
	stCode.innerHTML=data3;
	egdate.value = new Date().toISOString().substring(0, 10);
}

function modGoods(ctcode){
	const eqcode = document.getElementById("meqCode");
	const eqname = document.getElementById("meqName");
	const sfcode = document.getElementById("msfCode");
	const cacode = document.getElementById("mcaCode");
	const stcode = document.getElementById("mstCode");
	const egdate = document.getElementById("egDate").value;
let json =[];
json.push({ctCode:ctcode,eqCode:eqcode.innerText,eqName:eqname.value,sfCode:sfcode.value,eqCaCode:cacode.value,stCode:stcode.value,egDate:egdate.substr(0,4)+egdate.substr(5,2)+egdate.substr(8,2)});
const data = JSON.stringify(json);
ajaxconnection("ajax/modGoods", data, "goodsList", true);
}

function getGoodsCode(ctcode){
	document.getElementById("mdtitle").innerText = "장 비 추 가";
	let data = "<div><span>장비코드</span><br><select id=\"meqCode\" onchange=\"change()\"></select></div>";
	data += "<div><span>장비명</span><br><input type=\"text\" id=\"meqName\"value=\"\" placeholder=\"장비명을 입력해 주세요.\"/></div>";
	data += "<div><span>담당자</span><br>";
	data += "<select id = \"msfCode\"></select></div>";
	data += "<div><span>관리일자<span><input id=\"egDate\" type=\"date\"/></div>";
	data += "<div><span>분류</span><br>";
	data += "<select id=\"mcaCode\"onchange=\"change2()\">";
	
	data += "</select></div>";
	data += "<div><span>상태</span><br>";
	data += "<select id = \"mstCode\"></select></div>";
	data += "<input type=\"button\" value=\"CREATE\" onclick=\"insGoods('"+ctcode+"')\"/>";
	document.getElementById("mdbody").innerHTML=data;
	let json=[];
	json.push({ctCode:ctcode});
	const jsonData = JSON.stringify(json);
	ajaxconnection("ajax/getGoCaList", jsonData, "subModGoods", true);
	
	ajaxconnection("ajax/getGoodsCode", jsonData, "getGoodsMaxCode", true);
	openModal();
}

function getGoodsMaxCode(eqMaxCodes){
	let data;
	const meqCode = document.getElementById("meqCode");
	for(i=0;i<eqMaxCodes.length;i++){
		if(eqMaxCodes[i].eqCaCode=="E1"){
			data += "<option value=\""+eqMaxCodes[i].eqCode+"\">장비</option>"
		}else if(eqMaxCodes[i].eqCaCode=="E2"){
			data += "<option value=\""+eqMaxCodes[i].eqCode+"\">용품</option>"
		}else if(eqMaxCodes[i].eqCaCode=="E3"){
			data += "<option value=\""+eqMaxCodes[i].eqCode+"\">락카</option>"
		}
	}
	meqCode.innerHTML=data;
}

function insGoods(ctcode){
	const eqcode = document.getElementById("meqCode");
	const eqname = document.getElementById("meqName");
	const sfcode = document.getElementById("msfCode");
	const cacode = document.getElementById("mcaCode");
	const stcode = document.getElementById("mstCode");
	const egdate = document.getElementById("egDate").value;
	
	let json =[];
	json.push({ctCode:ctcode,eqCode:eqcode.value,eqName:eqname.value,sfCode:sfcode.value,eqCaCode:cacode.value,stCode:stcode.value,egDate:egdate.substr(0,4)+egdate.substr(5,2)+egdate.substr(8,2)});
	const data = JSON.stringify(json);
	ajaxconnection("ajax/insGoods", data, "goodsList", true);
}

function openModal(){
	let container = document.getElementById("gModal");
	container.style.filter = "alpha(Opacity=50)";
	container.style.display = "block";
}

function YcloseModal(){
	let container = document.getElementById("gModal");
	container.style.display = "none";
}


function change(){
	const eqcode = document.getElementById("meqCode");
	const eqcacode = document.getElementById("mcaCode");
	
	for(i=0;i<eqcode.length;i++){
		if(eqcode.options[eqcode.selectedIndex].innerText==eqcacode.options[i].innerText){
			eqcacode.options[i].setAttribute('selected', '');
		}
	}
}

function change2(){
	const eqcode = document.getElementById("meqCode");
	const eqcacode = document.getElementById("mcaCode");
	
	for(i=0;i<eqcacode.length;i++){
		if(eqcacode.options[eqcacode.selectedIndex].innerText==eqcode.options[i].innerText){
			eqcode.options[i].setAttribute('selected', '');
		}
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