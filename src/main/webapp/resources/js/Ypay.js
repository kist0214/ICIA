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

function onLoadPay(ctcode){
	json = [];
	json.push({ctCode:ctcode});
	const data = JSON.stringify(json);
	ajax("ajax/onLoadPay",data,"payList");
	const date = document.getElementById("searchDate");
	date.value = new Date().toISOString().substring(0, 10);
}

function payList(list){
	const ajax = document.getElementById("ajax");
	let data = '<tr><td>결제일</td><td>분류명</td><td>회원이름</td><td>횟수(개월수)</td><td>결제금액</td></tr>';
	for(i=0;i<list.length;i++){
		data += '<tr><td>'+list[i].paDate+'</td><td>'+list[i].caCode+'</td><td>'+list[i].meName+'</td><td>'+list[i].lpQty+'</td><td>'+list[i].paTotal+'</td></tr>';
	}
	ajax.innerHTML=data;
}

function searchPay(ctcode){
	const date = document.getElementById("searchDate");
	json = [];
	json.push({ctCode:ctcode,paDate:date.value});
	const data = JSON.stringify(json);
	ajax("ajax/searchPay",data,"payList");
}