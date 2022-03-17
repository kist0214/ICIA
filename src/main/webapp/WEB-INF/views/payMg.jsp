<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onLoad = "onLoadPay()">
<div id = "topMenu">
	<div class = "menuContainer">
	<section class = "menuContainer">
	<article class="topmenu">
	<span class="topMenu" id="logOut" onClick="logOut()">로그아웃</span>
	</article>
	</section>
	</div>
</div>

<div>
<div class = "middle">
<form>
<input type="date"/>
<input type="button" value = "찾기" onClick = "payMg()"></input>
</form>
</div>

<div class = "side">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="bar-chart" width="300" height="230"></canvas>
</div>
</div>

<div>
<script>
const d = new Date();
const year = d.getFullYear(); // 년
const month = d.getMonth();   // 월
new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: [new Date(year, month - 3).toLocaleDateString().substring(2,8), 			new Date(year, month - 2).toLocaleDateString().substring(2,8),
      new Date(year, month - 1).toLocaleDateString().substring(2,8)],
      datasets: [
        {
        
          label: "만원",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
          data: [3000,2500,3500]
        }
      ]
    },
    options: {
    responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						min: 2000,
						max: 5000,
						fontSize : 12,
					}
				}]
			},
      
      legend: { display: false },
      title: {
        display: true,
        text: '최근 3개월 매출(단위 만)'
        
      }
      
    }
});
</script>
</div>
</body>
</html>