





let data3;



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


	

		
		




