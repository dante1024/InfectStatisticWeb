<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="backend.Entry" %>
<%@page import="backend.Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<link rel="stylesheet" type="text/css" href="/InfectStatisticWeb/css/statistics.css" />


</head>
<body>

<%
	String path = "C:\\Users\\lenovo\\Desktop\\部分疫情日志log";
	Entry entry = new Entry();
	Entry.initMap();
	String[] fileList = Entry.getAllFile(path);
	Entry.solveTheFile(fileList);

%>

<div id="container" style="height: 600px;width:900px;background:white;margin:20px 0 0;"></div>

<script type="text/javascript">


var option = {
		title: {
	        text: '多条折线图测试用例', // 标题名称
	    },
	    xAxis: {
	        type: 'category',
	        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
	    },
	    yAxis: {
	        type: 'value'
	    },
	    tooltip: {
            formatter: function (params) {
                var info = '<p style="font-size:18px">' + '66666' + '</p><p style="font-size:14px">'+'确诊：'+'人'+'</p>'
                
                return info;
            },
            //提示标签背景颜色
            backgroundColor:"rgba(0,0,255,0.5)",
            textStyle: { color: "#fff" } //提示标签字体颜色
        },
        legend: {
            data: ['用例A', '用例B']
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
	    series: [
	    	
	    	{
	    	name:"用例a",
	        data: [820, 932, 901, -934, 1290, 1330, 1320],
	        type: 'line',
	        
	        symbol:'star',//拐点样式
            symbolSize: 5,//拐点大小
	        smooth: true,
	        itemStyle : {
                normal : {
                    lineStyle:{
                        color:"#FF0000"//折线颜色
                    }
                }
            },
	    },
	    {
	    	name:"用例b",
	        data: [45, 78, 425, -94, 290, 230, 630],
	        type: 'line',
	        symbol:'star',//拐点样式
            symbolSize: 5,//拐点大小
	        smooth: true,
	        itemStyle : {
                normal : {
                    lineStyle:{
                        color:"#FF0000"//折线颜色
                    }
                }
            },
	    },
	    ]
	};


//初始化echarts实例
var myChart = echarts.init(document.getElementById('container'));
//使用制定的配置项和数据显示图表
myChart.setOption(option);

</script>


</body>
</html>