function searchLesson(ctcode){
	const searchDate = document.getElementById("searchDate");
	const searchSf = document.getElementById("searchSf");
	if(searchSf.value == "return" || searchDate.value == "return"){
		const msg = document.getElementsByClassName("lsSearchBtn")[0]
		msg.value = "";
		msg.placeholder="검색범위를 설정해 주세요.";
	}
	let json = [];
	json.push({});
}