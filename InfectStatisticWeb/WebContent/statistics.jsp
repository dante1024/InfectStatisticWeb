<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="backend.Entry" %>
<%@page import="backend.Interface" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

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
	int id = 0;
	
	String province = null;
	String idString = request.getParameter("id");
	if (idString != null){
		id = Integer.parseInt(idString);
		switch (id)
		{
		case 1:
			province = "北京";
			break;
		case 2:
			province = "天津";
			break;
		case 3:
			province = "上海";
			break;
		case 4:
			province = "重庆";
			break;
		case 5:
			province = "河北";
			break;
		case 6:
			province = "河南";
			break;
		case 7:
			province = "云南";
			break;
		case 8:
			province = "辽宁";
			break;
		case 9:
			province = "黑龙江";
			break;
		case 10:
			province = "湖南";
			break;
		case 11:
			province = "安徽";
			break;
		case 12:
			province = "山东";
			break;
		case 13:
			province = "新疆";
			break;
		case 14:
			province = "江苏";
			break;
		case 15:
			province = "浙江";
			break;
		case 16:
			province = "江西";
			break;
		case 17:
			province = "湖北";
			break;
		case 18:
			province = "广西";
			break;
		case 19:
			province = "甘肃";
			break;
		case 20:
			province = "山西";
			break;
		case 21:
			province = "内蒙古";
			break;
		case 22:
			province = "陕西";
			break;
		case 23:
			province = "吉林";
			break;
		case 24:
			province = "福建";
			break;
		case 25:
			province = "贵州";
			break;
		case 26:
			province = "广东";
			break;
		case 27:
			province = "青海";
			break;
		case 28:
			province = "西藏";
			break;
		case 29:
			province = "四川";
			break;
		case 30:
			province = "宁夏";
			break;
		case 31:
			province = "海南";
			break;
		
		}
	}
	
	int[] a=Interface.tendencyOfAnyDay("2020-01-21",province);
	
	Map<String, int []> dateMap = Interface.tendencyOfAll(province);
	
	String userDate = request.getParameter("user_date");
	
	int ip2String = 0;
	String ip3String = null;
	int cure2String = 0;
	String cure3String = null;
	int dead2String = 0;
	String dead3String = null;
	int total2=0;

	if (userDate == null || userDate.equals("")){
		userDate = "2020-02-02";
		
		ip2String=Interface.anyProvince(province)[0];
		int ip3 = Interface.anyProvinceForDate("2020-02-02",province)[0] - Interface.anyProvinceForDate("2020-02-02",province)[0];
		if (ip3 < 0){
			ip3String = "" + ip3;
		}
		else{
			ip3String = "+" + ip3;
		}
		
		cure2String = Interface.anyProvince(province)[2];
		int cure3 = Interface.anyProvinceForDate("2020-02-02",province)[2] - Interface.anyProvinceForDate("2020-02-01",province)[2];
		if (cure3 < 0){
			cure3String=""+cure3;
		}
		else{
			cure3String="+"+cure3;
		}
		
		dead2String = Interface.anyProvince(province)[3];
		int dead3 = Interface.anyProvinceForDate("2020-02-02",province)[3] - Interface.anyProvinceForDate("2020-02-01",province)[3];
		if (dead3 < 0){
			dead3String=""+dead3;
		}
		else{
			dead3String="+"+dead3;
		}

		total2 = ip2String + cure2String + dead2String;

		
	}
	else{
		
		//userDate="**"+userDate+"**";
		
		String[] dateList = {
				"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		List<String> dateArrayList = new ArrayList<String>();
		for (int i=0;i < dateList.length;i++)
		{
			dateArrayList.add(dateList[i]);
		}
		int index = dateArrayList.indexOf(userDate) - 1;
		String previousDate = dateArrayList.get(index);
		
		ip2String=Interface.anyProvinceForDate(userDate,province)[0];
		int ip3 = Interface.anyProvinceForDate(userDate,province)[0] - Interface.anyProvinceForDate(previousDate,province)[0];
		if (ip3 < 0){
			ip3String=""+ip3;
		}
		else{
			ip3String="+"+ip3;
		}
		
		cure2String=Interface.anyProvinceForDate(userDate,province)[2];
		int cure3 = Interface.anyProvinceForDate(userDate,province)[2] - Interface.anyProvinceForDate(previousDate,province)[2];
		if (cure3 < 0){
			cure3String=""+cure3;
		}
		else{
			cure3String="+"+cure3;
		}
		
		dead2String=Interface.anyProvinceForDate(userDate,province)[3];
		int dead3 = Interface.anyProvinceForDate(userDate,province)[3] - Interface.anyProvinceForDate(previousDate,province)[3];
		if (dead3 < 0){
			dead3String=""+dead3;
		}
		else{
			dead3String="+"+dead3;
		}

		total2 = Interface.anyProvinceForDate(userDate,province)[0] + Interface.anyProvinceForDate(userDate,province)[2] + Interface.anyProvinceForDate(userDate,province)[3];

		
	}
	
	
	
	
%>



<div id="information">
	<h5 id="ip1">现有确诊</h5>
	<h4 id="ip2"><%=ip2String%></h4>
	<h5 id="ip3">昨日<%=ip3String%></h5>
	<h5 id="total1">累计确诊</h5>
	<h4 id="total2"><%=total2%></h4>
	<h5 id="total3">昨日<%=ip3String%></h5>
	<h5 id="cure1">累计治愈</h5>
	<h4 id="cure2"><%=cure2String%></h4>
	<h5 id="cure3">昨日<%=cure3String%></h5>
	<h5 id="dead1">累计死亡</h5>
	<h4 id="dead2"><%=dead2String%></h4>
	<h5 id="dead3">昨日<%=dead3String%></h5>
	
</div>


<form id="date"  action="/InfectStatisticWeb/statistics.jsp?id=<%=idString%>" method="post">
	选择日期: <input type="date" name="user_date" />
	<input type="submit" value="查询"/>
</form>

<h1>当前日期：<%=userDate %></h1>

<div id="container" style="height: 600px;width:900px;background:white;margin:20px 0 0;"></div>

<script type="text/javascript">


var option = {
		title: {
	        text: '<%=province%> 疫情趋势', // 标题名称
	    },
	    xAxis: {
	        type: 'category',
	        data: ['01-19', '01-20', '01-21', '01-22', '01-23', '01-24', '01-25','01-26','01-27',
	        	'01-28','01-29','01-30','01-31','02-01','02-02']
	    },
	    yAxis: {
	        type: 'value',
	        name: '单位:例',
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
        legend: {
            data: ['新增确诊趋势', '新增疑似趋势', '治愈趋势', '死亡趋势']
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
	    series: [
	    	
	    	{
	    	name:"新增确诊趋势",
	        data: [<%=dateMap.get("2020-01-19")[0]%>, <%=dateMap.get("2020-01-20")[0]%>, 
	            <%=dateMap.get("2020-01-21")[0]%>, <%=dateMap.get("2020-01-22")[0]%>,
	            <%=dateMap.get("2020-01-23")[0]%>, <%=dateMap.get("2020-01-24")[0]%>,
	            <%=dateMap.get("2020-01-25")[0]%>,<%=dateMap.get("2020-01-26")[0]%>,
	            <%=dateMap.get("2020-01-27")[0]%>,<%=dateMap.get("2020-01-28")[0]%>,
	            <%=dateMap.get("2020-01-29")[0]%>,<%=dateMap.get("2020-01-30")[0]%>,
	            <%=dateMap.get("2020-01-31")[0]%>,<%=dateMap.get("2020-02-01")[0]%>,
	            <%=dateMap.get("2020-02-02")[0]%>],
	        type: 'line',
	        
	        symbol:'star',//拐点样式
            symbolSize: 5,//拐点大小
	        smooth: true,
	        itemStyle : {
                normal : {
                    lineStyle:{
                        color:"#EE3B3B",//折线颜色
                        borderColor:'#EE3B3B',
                    }
                }
            },
	    },
	    {
	    	name:"新增疑似趋势",
	        data: [<%=dateMap.get("2020-01-19")[1]%>, <%=dateMap.get("2020-01-20")[1]%>, 
	            <%=dateMap.get("2020-01-21")[1]%>, <%=dateMap.get("2020-01-22")[1]%>,
	            <%=dateMap.get("2020-01-23")[1]%>, <%=dateMap.get("2020-01-24")[1]%>,
	            <%=dateMap.get("2020-01-25")[1]%>,<%=dateMap.get("2020-01-26")[1]%>,
	            <%=dateMap.get("2020-01-27")[1]%>,<%=dateMap.get("2020-01-28")[1]%>,
	            <%=dateMap.get("2020-01-29")[1]%>,<%=dateMap.get("2020-01-30")[1]%>,
	            <%=dateMap.get("2020-01-31")[1]%>,<%=dateMap.get("2020-02-01")[1]%>,
	            <%=dateMap.get("2020-02-02")[1]%>],
	        type: 'line',
	        symbol:'star',//拐点样式
            symbolSize: 5,//拐点大小
	        smooth: true,
	        itemStyle : {
                normal : {
                    lineStyle:{
                        color:"#EE7942",//折线颜色
                        borderColor:'#EE7942',
                    }
                }
            },
	    },
	    
	    {
	    	name:"治愈趋势",
	        data: [<%=dateMap.get("2020-01-19")[2]%>, <%=dateMap.get("2020-01-20")[2]%>, 
	            <%=dateMap.get("2020-01-21")[2]%>, <%=dateMap.get("2020-01-22")[2]%>,
	            <%=dateMap.get("2020-01-23")[2]%>, <%=dateMap.get("2020-01-24")[2]%>,
	            <%=dateMap.get("2020-01-25")[2]%>,<%=dateMap.get("2020-01-26")[2]%>,
	            <%=dateMap.get("2020-01-27")[2]%>,<%=dateMap.get("2020-01-28")[2]%>,
	            <%=dateMap.get("2020-01-29")[2]%>,<%=dateMap.get("2020-01-30")[2]%>,
	            <%=dateMap.get("2020-01-31")[2]%>,<%=dateMap.get("2020-02-01")[2]%>,
	            <%=dateMap.get("2020-02-02")[2]%>],
	        type: 'line',
	        symbol:'star',//拐点样式
            symbolSize: 5,//拐点大小
	        smooth: true,
	        itemStyle : {
                normal : {
                    lineStyle:{
                        color:"#20B2AA",//折线颜色
                        borderColor:'#20B2AA',
                    }
                }
            },
	    },
	    
	    
	    {
	    	name:"死亡趋势",
	        data: [<%=dateMap.get("2020-01-19")[3]%>, <%=dateMap.get("2020-01-20")[3]%>, 
	            <%=dateMap.get("2020-01-21")[3]%>, <%=dateMap.get("2020-01-22")[3]%>,
	            <%=dateMap.get("2020-01-23")[3]%>, <%=dateMap.get("2020-01-24")[3]%>,
	            <%=dateMap.get("2020-01-25")[3]%>,<%=dateMap.get("2020-01-26")[3]%>,
	            <%=dateMap.get("2020-01-27")[3]%>,<%=dateMap.get("2020-01-28")[3]%>,
	            <%=dateMap.get("2020-01-29")[3]%>,<%=dateMap.get("2020-01-30")[3]%>,
	            <%=dateMap.get("2020-01-31")[3]%>,<%=dateMap.get("2020-02-01")[3]%>,
	            <%=dateMap.get("2020-02-02")[3]%>],
	        type: 'line',
	        symbol:'star',//拐点样式
            symbolSize: 5,//拐点大小
	        smooth: true,
	        itemStyle : {
                normal : {
                    lineStyle:{
                        color:"#36648B",//折线颜色
                        borderColor:'#36648B',
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