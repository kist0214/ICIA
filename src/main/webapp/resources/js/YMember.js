
function ajax(action, data, fn) {
   let ajax = new XMLHttpRequest();
   ajax.onreadystatechange = function() {
      if (ajax.readyState == 4 && ajax.status == 200) {
         window[fn](JSON.parse(ajax.responseText));
      }
   };
      ajax.open("post", action, true);

      ajax.setRequestHeader("Content-type", "application/json; charset=utf-8");

   ajax.send(data);
}

let sfRanCode=[];
function getMeMg(ctcode,sfrank,sfcode){
	sfRanCode[0]=sfrank;
	sfRanCode[1]=sfcode;
	let json = [];
	json.push({ctCode:ctcode});
	const data = JSON.stringify(json);
	ajax("ajax/meMg",data,"getMeList");
}

let meList;

function getMeList(json){
	meList=json;
	const ajax = document.getElementById("ajax");
	let data = '<tr><td></td><td>이름</td><td>성별</td><td>연령</td><td>전화번호</td><td>유형</td><td>결제횟수/잔여횟수(개월)<td><td><td></tr>';
	for(i=0;i<json.length;i++){
		if(sfRanCode[0]=='M1'){
				if(json[i].lpStocks>0){
					data += '<tr id="meDtList" onClick="meDetail('+i+')"><td><input type=\"radio\" name=\"radibut\"/></td>';
					data +='<td>'+json[i].meName+'</td>';
					data +='<td>'+json[i].meGender+'</td>';
					data +='<td>'+json[i].meBirth+'</td>';
					data +='<td>'+json[i].meNumber+'</td>';
					data +='<td>'+json[i].caName+'</td>';
					if(json[i].caName=='일반'){
						data +='<td>'+json[i].lpQty+'</td>';
					}else{
						data +='<td>'+json[i].lpQty+'/'+json[i].lpStocks+'</td>';
					}
					if(json[i].stCode=='M1'){
						if(json[i].caName=='일반'){
							data +='<td><input type="button" value="만료" onclick="clickExpiration(\''+i+'\')"/></td></tr>';
						}
					}else{
						data +='<td>만료</td>';
					}
				
			}
		}else if(sfRanCode[1]==json[i].sfCode){
				if(json[i].lpStocks>0){
					data += '<tr id="meDtList" onClick="meDetail('+i+')"><td><input type=\"radio\" name=\"radibut\"/></td>';
					data +='<td>'+json[i].meName+'</td>';
					data +='<td>'+json[i].meGender+'</td>';
					data +='<td>'+json[i].meBirth+'</td>';
					data +='<td>'+json[i].meNumber+'</td>';
					data +='<td>'+json[i].caName+'</td>';
					if(json[i].caName=='일반'){
						data +='<td>'+json[i].lpQty+'</td>';
					}else{
						data +='<td>'+json[i].lpQty+'/'+json[i].lpStocks+'</td>';
					}
					if(json[i].stCode=='M1'){
						if(json[i].caName=='일반'){
							data +='<td><input type="button" value="만료" onclick="clickExpiration(\''+i+'\')"/></td></tr>';
						}
					}else{
						data +='<td>만료</td>';
					}
				
			}
		}
	}
	ajax.innerHTML=data;
	YcloseModal();
}

function clickExpiration(i){
	json=[];
	json.push({ctCode:meList[i].ctCode,meCode:meList[i].meCode});
	data=JSON.stringify(json);
	ajax("ajax/clickExpiration",data,"getMeList");
}

function meDetail(i){
	
}

function searchMe(ctcode){
	const select= document.getElementById('select').value;
	const searchText = document.getElementById('searchText').value;
	let json = [];
	json.push({ctCode:ctcode,meCode:select,meName:searchText});
	const data = JSON.stringify(json);
	alert(data);
	ajax("ajax/meMg",data,"getMeList");
}


function searchMeCharTwo(ctcode,sfrank,sfcode){
	const select = document.getElementById('select');
	if(select.value.length>2){
		return;
	}
	if(select.value.charAt(0)=='M'){
		let json = [];
		json.push({ctCode:ctcode,stCode:select.value});
		const data = JSON.stringify(json);
		ajax("ajax/meMg",data,"getMeList");
	}
	if(select.value.charAt(0)=='L'){
		let json = [];
		json.push({ctCode:ctcode,caCode:select.value});
		const data = JSON.stringify(json);
		ajax("ajax/meMg",data,"getMeList");
	}
	if(select.value=='1'){
		getMeMg(ctcode,sfrank,sfcode);
	}
}


function getCaList(ctcode){
	let json = [];
	json.push({ctCode:ctcode});
	const data = JSON.stringify(json);
	ajax("ajax/getCaList",data,"addMemberModal");
}

function addMemberModal(json){
	
	document.getElementById("mdtitle").innerText = "회원추가";
	var data = '<div><span>이름</span><br><span><input type ="text" id = "meName" placeholder="이름을 입력하세요."/></span></div>';
	data += '<div><span>이메일</span><br><span><input type = "text" id = "emailName"/><span>@<span><select id="juso">';
	data += '<option value = "return">주소선택</option>'
	data += '<option value = "daun.net">daun</option>';
	data += '<option value = "naver.com">naver</option>';
	data += '<option value = "google.com">GMAIL</option>';
	data += '<option value = "yahoo.com">yahoo</option>';
	data += '<option value = "outlook.com">outlook.com</option>';
	data += '<option value = "nate.com">nate</option>';
	data += '<option value = "dreamwiz.com">dreamwiz</option>';
	data += '<option value = "korea.com">korea.com</option></select></div>';
	for(i=0; i<json.length;i++){
		
		if(i==0){
			data+= '<article><div style = "width:20%;"><span><input type = "checkbox" name = "check" value="'+json[i].caCode+'"/><span><br><span>'+json[i].caName+'</span><br><span><select name="lpQty">';
			data+= '<option value="'+json[i].lpQty+','+json[i].lpPrice+'">'+json[i].lpQty+(json[i].caName=='일반'?'개월':'수량')+' : '+json[i].lpPrice+'</option>';
		}else{
			if(json[i].caName==json[i-1].caName){
				data+= '<option value="'+json[i].lpQty+','+json[i].lpPrice+'">'+json[i].lpQty+(json[i].caName=='일반'?'개월':'수량')+' : '+json[i].lpPrice+'</option>';
			}else{
				data+= '</select></span></div><div style = "width:20%;"><span><input type = "checkbox" name = "check" value="'+json[i].caCode+'"/><span><br><span>'+json[i].caName+'</span><br><span><select name="lpQty">';
				data+= '<option value="'+json[i].lpQty+','+json[i].lpPrice+'">'+json[i].lpQty+(json[i].caName=='일반'?'개월':'수량')+' : '+json[i].lpPrice+'</option>';
			}
			if(i==json.length-1){
				data+= '</select></div></article>';
			}
		}
	}
	var iptBtn =document.createElement("input");
	iptBtn.setAttribute("type","button");
	iptBtn.setAttribute("value","create");
	iptBtn.setAttribute("onclick","addMember('"+json[0].ctCode+"')");
	document.getElementById("mbody").appendChild(iptBtn);
	document.getElementById("mdbody").innerHTML = data
	YopenModal();
}

function addMember(ctcode){
	var mename = document.getElementById("meName").value;
	var emailName = document.getElementById("emailName").value;
	var juso = document.getElementById("juso").value;
	var email = emailName+"@"+juso;
	var check = document.getElementsByName("check");
	var lpPrQty = document.getElementsByName("lpQty");
	var json = [];
	for(i=0;i<check.length;i++){
		if(check[i].checked==true){
		json.push({ctCode:ctcode,meName:mename,meEmail:email,caCode:check[i].value,lpQty:lpPrQty[i].value.split(',')[0]});
		}
	}
	var data = JSON.stringify(json);
	ajax("ajax/addMember",data,"getMeList");
}













