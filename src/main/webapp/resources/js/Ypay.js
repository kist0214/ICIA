


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
	const date = document.getElementById("searchDate");
	date.value = new Date().toISOString().substring(0, 7);
	json = [];
	json.push({ctCode:ctcode,paDate:date.value});
	const data = JSON.stringify(json);
	ajax("ajax/onLoadPay",data,"payList");
}


function payList(list){
	
	
	const ajax = document.getElementById("ajax");
	let data = '<tr><td>결제일</td><td>분류명</td><td>회원이름</td><td>횟수(개월수)</td><td>결제금액</td></tr>';
	for(i=0;i<list.length;i++){
		data += '<tr><td>'+list[i].paDate+'</td><td>'+list[i].caCode+'</td><td>'+list[i].meName+'</td><td>'+list[i].lpQty+'</td><td>'+list[i].paTotal+'</td></tr>';
	}
	ajax.innerHTML=data;
	a1(list);
}

function a1(list){
	let chData=[{},{},{},{},{},{}];
	for(i=0;i<chData.length;i++){
		chData[i]=0;
	}
	for(i=0;i<list.length;i++){
		var allnum='';
		var num='';
		 if(list[i].caCode=='P.T'){
			num = list[i].paTotal.split(',');
			for(j=0;j<num.length;j++){
				allnum += num[j];
			}
		chData[0]=parseInt(chData[0])+parseInt(allnum)/10000;
		}else if(list[i].caCode=='요가'){
			
			num = list[i].paTotal.split(',');
			for(j=0;j<num.length;j++){
				allnum += num[j];
			}
			chData[1]=parseInt(chData[1])+parseInt(allnum)/10000;
		}else if(list[i].caCode=='필라테스'){
			num = list[i].paTotal.split(',');
			for(j=0;j<num.length;j++){
				allnum += num[j];
			}
			chData[2]=parseInt(chData[2])+parseInt(allnum)/10000;
		}else if(list[i].caCode=='줌바댄스'){
			num = list[i].paTotal.split(',');
			for(j=0;j<num.length;j++){
				allnum += num[j];
			}
			chData[3]=parseInt(chData[3])+parseInt(allnum)/10000;
		}else if(list[i].caCode=='일반'){
			num = list[i].paTotal.split(',');
			for(j=0;j<num.length;j++){
				allnum += num[j];
			}
			chData[4]=parseInt(chData[4])+parseInt(allnum)/10000;
		}else if(list[i].caCode=='스피닝'){
			num = list[i].paTotal.split(',');
			for(j=0;j<num.length;j++){
				allnum += num[j];
			}
			chData[5]=parseInt(chData[5])+parseInt(allnum)/10000;
		}
	}
	
	newChart(chData);
	
}


function searchPay(ctcode){
	const date = document.getElementById("searchDate");
	json = [];
	json.push({ctCode:ctcode,paDate:date.value});
	const data = JSON.stringify(json);
	ajax("ajax/onLoadPay",data,"payList");
}
























