function ajax(action, data, fn) {
   let ajax = new XMLHttpRequest();
   ajax.onreadystatechange = function() {
      if (ajax.readyState == 4 && ajax.status == 200) {
	alert(ajax.responseText);
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
	let sfName =  document.getElementById("sfName");
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
	sfCode:sfName.value,lsProgress:lsProgress+lsDate112+min2,lsMeCount:lsMeCount.value});
	const data = JSON.stringify(json);
	ajax("ajax/modLesson",data,"lsList");
}