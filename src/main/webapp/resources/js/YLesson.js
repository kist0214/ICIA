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

function modLsAjax(ctcode,sfcode){
	let name =  document.getElementById("lsName");
	let lsDate =  document.getElementById("lsDate");
	let lsTime =  document.getElementById("lsTime");
	let lsDate111 =  document.getElementsByName("lsDate111");
	let lsMeCount =  document.getElementById("lsMeCount");
	let min =  document.getElementById("min");
	let lsDate112='';
	for(i=0;i<lsTime.value.split(':').length;i++){
		lsDate112+=lsTime.value.split(':')[i];
	}
	var lsProgress='';
	
	for(i=0;i<lsDate111.length;i++){
		if(lsDate111[i].checked == true){
			lsProgress+='1';
		}else{
			lsProgress+='0';
		}
	}
	var min2='';
	if(min.value==''){
		alert('시간설정을 안하셨네요.');
		return;
	}
	if(min.value.length==2){
		min2='0'+min.value;
	}else{
		min2=min.value;
	}
	let json = [];
	json.push({sfName:sfcode,ctCode:ctcode,lsName:name.value,lsOpen:lsDate.value+" "+lsTime.value+':00',
	lsProgress:lsProgress+lsDate112+min2,lsMeCount:lsMeCount.value});
	const data = JSON.stringify(json);
	
	ajax("ajax/modLesson",data,"lsList");
}
var idx;
function leMeDt(lsCode,ctcode,i){
	idx=i;
	json=[];
	json.push({lsCode:lsCode,ctCode:ctcode});
	const data = JSON.stringify(json);
	ajax("ajax/lsMemDetail",data,"lsMeList");
}

let data1;
function lsMeList(json){
	data1 = json;
	const ajax2 = document.getElementsByName("ajax2");
	for(a=0;a<ajax2.length;a++){
		while(ajax2[a].hasChildNodes()){
         	ajax2[a].removeChild(ajax2[a].lastChild);
     	}
		
	}
	var data ='<tr><td></td><td>회원이름</td><td>성별</td><td>나이</td><td>전화번호</td><td>예약 확인</td><td rowspan ="'+json.length+1+'"><input type="button" value ="🗑️" onclick = "cancel()"/></td></tr>';
	
	for(i=0;i<json.length;i++){
		data += '<tr><td><input type = "radio" name = "lsMebtu"/></td>';
		data += '<td>'+json[i].meName+'</td><td>'+json[i].meGender+'</td><td>'+json[i].meBirth+'</td><td>'+json[i].meNumber+'</td>';
		if(json[i].stCode == 'R1'){
			data += '<td><input type = "button" value = "확인" onclick = "modLsSuccess(\''+json[i].lsCode+'\',\''+json[i].meCode+'\',\''+json[i].ctCode+'\')"/></td></tr>';
		}else if(json[i].stCode == 'R2'){
			data += '<td>예약 확정</td></tr>';
		}else if(json[i].stCode == 'R3'){
			data += '<td>취소</td></tr>';
		}
	}
	ajax2[idx].innerHTML = data;
}

function modLsSuccess(lsCode,meCode,ctCode){
	var json=[];
	json.push({lsCode:lsCode,meCode:meCode,ctCode:ctCode});
	const data = JSON.stringify(json);
	ajax("ajax/modLsSuccess",data,"lsMeList");
}


function cancel(){
	const lsMebtu=document.getElementsByName("lsMebtu");
	var json=[];
	for(i=0;i<lsMebtu.length;i++){
		if(lsMebtu[i].checked == true){
			json.push({lsCode:data1[i].lsCode,meCode:data1[i].meCode,ctCode:data1[i].ctCode});
		}
	}
	const data = JSON.stringify(json);
	
	ajax("ajax/modLsCancel",data,"lsMeList");
}











