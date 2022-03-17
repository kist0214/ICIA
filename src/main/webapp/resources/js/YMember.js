/**
 * 
 */
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


function getMeMg(ctcode){
	let json = [];
	json.push({ctCode:ctcode});
	const data = JSON.stringify(json);
	ajax("ajax/meMg",data,"meList");
}

let meList;

function meList(json){
	meList=json;
	const ajax = document.getElementById("ajax");
	let data = '<tr><td></td><td>이름</td><td>성별</td><td>연령</td><td>전화번호</td><td>유형</td><td>결제횟수/잔여횟수<td><td><td></tr>';
	for(i=0;i<json.length;i++){
		data += '<tr><td><input type=\"radio\" name=\"radibut\"/></td>';
		data +='<td>'+json[i].meName+'</td>';
		data +='<td>'+json[i].meGender+'</td>';
		data +='<td>'+json[i].meBirth+'</td>';
		data +='<td>'+json[i].meNumber+'</td>';
		data +='<td>'+json[i].meCaname+'</td>';
		data +='<td>'+json[i].lpQty+'/'+json[i].lpStocks+'</td>';
		if(json[i].stCode=='M1'){
			data +='<td><input type="button" value="만료" onclick="clickExpiration(\''+i+'\')"/></td></tr>';
		}
	}
	ajax.innerHTML=data;
}

//만료버튼클릭
function clickExpiration(this){
	
}