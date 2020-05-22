<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" rel="stylesheet" type="text/css">
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
<style>
.c3 svg {background-color:#ffffff !important}
.c3 text {fill: #000000; font:10px Arial;}
.c3-grid line {stroke: #000000 !important; }
</style>
</head>
<body>
<script>
var ChartProp={"data":{"columns":[["홈플","10"]
,["쿠팡","12"]
,["롯데마트","11"]
,["이마트","13"]
]
,"type":"bar"}
,"color":{}
,"bar":{"width":{"ratio":"0.95"}
}
,"pie":{}
,"donut":{}
,"legend":{"show":true,"position":"bottom"}
,"tooltip":{"show":true,"grouped":true}
,"zoom":{"enabled":false}
,"transition":{}
,"point":{"show":true}
,"axis":{"rotated":false,"x":{"tick":{}
}
,"y":{}
}
,"grid":{"x":{"show":true}
,"y":{"show":true}
}
,"size":{"width":"600","height":"400"}
,"padding":{"left":30,"top":30,"bottom":0,"right":0}
}
window.onload=function(){
c3.generate(ChartProp);
var svg = d3.select('svg');
svg.append('text')
	.attr('x', parseInt(svg.style('width'))/2)
	.attr('y', 25)
	.style({'text-anchor': 'middle', 'font-size': '30px', 'fill':'#000000'})
	.text('마트 가격비교');
}
</script>
<div id="chart"></div>

</body>
</html>