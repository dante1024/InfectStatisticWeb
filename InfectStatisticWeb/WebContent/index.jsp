<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="backend.Entry" %>
<%@page import="backend.Interface" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/china.js"></script>

<link rel="stylesheet" type="text/css" href="/InfectStatisticWeb/css/index.css" />

</head>
<body>

<%
	String path = "C:\\Users\\lenovo\\Desktop\\部分疫情日志log";
	Entry entry = new Entry();
	Entry.initMap();
	String[] fileList = Entry.getAllFile(path);
	Entry.solveTheFile(fileList);
	String ip3String = null;
	int ip3 = Interface.nationwideForDate("2020-01-20")[0] - Interface.nationwideForDate("2020-01-19")[0];
	if (ip3 < 0){
		ip3String=""+ip3;
	}
	else{
		ip3String="+"+ip3;
	}
	
	String sp3String = null;
	int sp3 = Interface.nationwideForDate("2020-01-20")[1] - Interface.nationwideForDate("2020-01-19")[1];
	if (sp3 < 0){
		sp3String=""+sp3;
	}
	else{
		sp3String="+"+sp3;
	}
	
	String cure3String = null;
	int cure3 = Interface.nationwideForDate("2020-01-20")[2] - Interface.nationwideForDate("2020-01-19")[2];
	if (cure3 < 0){
		cure3String=""+cure3;
	}
	else{
		cure3String="+"+cure3;
	}
	
	String dead3String = null;
	int dead3 = Interface.nationwideForDate("2020-01-20")[3] - Interface.nationwideForDate("2020-01-19")[3];
	if (dead3 < 0){
		dead3String=""+dead3;
	}
	else{
		dead3String="+"+dead3;
	}
	
	
	int total2 = Interface.nationwide()[0] + Interface.nationwide()[2] + Interface.nationwide()[3];
	//int[] a=nationwide();
//	int[] a=Interface.anyProvince("福建");
//	int[] a=Interface.nationwideForDate("2020-01-20");
	// int[] a=Interface.anyProvinceForDate("2020-01-19","湖北");
%>



<div id="information">
	<h5 id="ip1">现有确诊</h5>
	<h4 id="ip2"><%=Interface.nationwide()[0]%></h4>
	<h5 id="ip3">昨日<%=ip3String%></h5>
	<h5 id="sp1">现有疑似</h5>
	<h4 id="sp2"><%=Interface.nationwide()[1]%></h4>
	<h5 id="sp3">昨日<%=sp3String%></h5>
	<h5 id="cure1">累计治愈</h5>
	<h4 id="cure2"><%=Interface.nationwide()[2]%></h4>
	<h5 id="cure3">昨日<%=cure3String%></h5>
	<h5 id="dead1">累计死亡</h5>
	<h4 id="dead2"><%=Interface.nationwide()[3]%></h4>
	<h5 id="dead3">昨日<%=dead3String%></h5>
	
	
	<h5 id="total1">累计确诊</h5>
	<h4 id="total2"><%=total2%></h4>
	
	
	
</div>


<form action="/InfectStatisticWeb/1.jsp" method="post">
	选择日期: <input id="date" type="date" name="user_date" />
	<input type="submit" value="查询"/>
</form>

<div id="container" style="height: 800px;width:1200px;background:white;margin:20px 0 0;"></div>




<script type="text/javascript">
    // 全国省份列表
    
    var beijing=<%=Interface.anyProvince("北京")[0]%>;
    var tianjin=<%=Interface.anyProvince("天津")[0]%>;
    var shanghai=<%=Interface.anyProvince("上海")[0]%>;
    var chongqing=<%=Interface.anyProvince("重庆")[0]%>;
    var hebei=<%=Interface.anyProvince("河北")[0]%>;
    var henan=<%=Interface.anyProvince("河南")[0]%>;
    var yunnan=<%=Interface.anyProvince("云南")[0]%>;
    var liaoning=<%=Interface.anyProvince("辽宁")[0]%>;
    var heilongjiang=<%=Interface.anyProvince("黑龙江")[0]%>;
    var hunan=<%=Interface.anyProvince("湖南")[0]%>;
    var anhui=<%=Interface.anyProvince("安徽")[0]%>;
    var shandong=<%=Interface.anyProvince("山东")[0]%>;
    var xinjiang=<%=Interface.anyProvince("新疆")[0]%>;
    var jiangsu=<%=Interface.anyProvince("江苏")[0]%>;
    var zhejiang=<%=Interface.anyProvince("浙江")[0]%>;
    var jiangxi=<%=Interface.anyProvince("江西")[0]%>;
    var hubei=<%=Interface.anyProvince("湖北")[0]%>;
    var guangxi=<%=Interface.anyProvince("广西")[0]%>;
    var gansu=<%=Interface.anyProvince("甘肃")[0]%>;
    var shanxi=<%=Interface.anyProvince("山西")[0]%>;
    var neimenggu=<%=Interface.anyProvince("内蒙古")[0]%>;
    var shanxi2=<%=Interface.anyProvince("陕西")[0]%>;
    var jilin=<%=Interface.anyProvince("吉林")[0]%>;
    var fujian=<%=Interface.anyProvince("福建")[0]%>;
    var guizhou=<%=Interface.anyProvince("贵州")[0]%>;
    var guangdong=<%=Interface.anyProvince("广东")[0]%>;
    var qinghai=<%=Interface.anyProvince("青海")[0]%>;
    var xizang=<%=Interface.anyProvince("西藏")[0]%>;
    var sichuan=<%=Interface.anyProvince("四川")[0]%>;
    var ningxia=<%=Interface.anyProvince("宁夏")[0]%>;
    var hainan=<%=Interface.anyProvince("海南")[0]%>;
    
    var dataMap = [{id:1, name: '北京',value:beijing }, {id:2, name: '天津',value:tianjin}, {id:3, name: '上海',value:shanghai }, {id:4, name: '重庆',value:chongqing }, 
    	{id:5, name: '河北',value:hebei }, {id:6, name: '河南',value:henan }, {id:7, name: '云南',value:yunnan }, {id:8, name: '辽宁',value:liaoning }, 
    	{id:9, name: '黑龙江',value:heilongjiang }, {id:10, name: '湖南',value:hunan }, {id:11, name: '安徽',value:anhui }, {id:12, name: '山东',value:shandong }, 
    	{id:13, name: '新疆',value:xinjiang }, {id:14, name: '江苏',value:jiangsu }, {id:15, name: '浙江',value:zhejiang }, {id:16, name: '江西',value:jiangxi }, 
    	{id:17, name: '湖北',value:hubei }, {id:18, name: '广西',value:guangxi }, {id:19, name: '甘肃',value:gansu }, {id:20, name: '山西',value:shanxi }, 
    	{id:21, name: '内蒙古',value:neimenggu },  {id:22, name: '陕西',value:shanxi2 }, {id:23, name: '吉林',value:jilin }, {id:24, name: '福建',value:fujian }, 
    	{id:25, name: '贵州',value:guizhou }, {id:26, name: '广东',value:guangdong }, {id:27, name: '青海',value:qinghai }, {id:28, name: '西藏',value:xizang }, 
    	{id:29, name: '四川',value:sichuan }, {id:30, name: '宁夏',value:ningxia }, {id:31, name: '海南',value:hainan }, {id:32, name: '台湾',value:"none" }, 
    	{id:33, name: '香港',value:"none"}, {id:34, name: '澳门',value:"none" }]
    // 需要在页面上直接标记出来的城市
    //var specialMap = ['浙江', '云南', '陕西'];
    var specialMap = [];
    // 对dataMap进行处理，使其可以直接在页面上展示
    for (var i = 0; i < specialMap.length; i++) {
        for (var j = 0; j < dataMap.length; j++) {
            if (specialMap[i] == dataMap[j].name) {
                dataMap[j].selected = true;
                break;
            }

        }
    }
    // 绘制图表，准备数据
   
    var option = {
        tooltip: {
            formatter: function (params) {
                var info = '<p style="font-size:18px">' + params.name + '</p><p style="font-size:14px">'+'确诊：'+params.value+'人'+'</p>'
                return info;
            },
            //提示标签背景颜色
            backgroundColor:"rgba(0,0,255,0.5)",
            textStyle: { color: "#fff" } //提示标签字体颜色
        },
        series: [
            {
                name: '中国',
                type: 'map',
                mapType: 'china',
                selectedMode: 'multiple',
                label: {
                    normal: {
                        show: true,//显示省份标签
                        // textStyle:{color:"#c71585"}//省份标签字体颜色
                    },
                    emphasis: {
                        show: true,//对应的鼠标悬浮效果
                        //textStyle:{color:"#00FFFF"}
                    }
                },
                itemStyle: {
                    normal: {
                        borderWidth: .5,//区域边框宽度
                        // borderColor: '#009fe8',//区域边框颜色
                        // areaColor:"#ffefd5",//区域颜色
                    },
                    emphasis: {
                        borderWidth: .5,
                        borderColor: '#4b0082',
                        areaColor: "#00FFFF",
                    }
                },
                data: dataMap
            }
        ],
        
        visualMap: {
            show : true,
            x: 'left',
            y: 'bottom',
            splitList: [
                {start: 10000},
                {start: 1000, end: 9999},
                {start: 100, end: 999},
                {start: 10, end: 99},
                {start: 1, end: 9},
                {start: 0, end: 0},
            ],
            color: ['#660208', '#8C0D0D', '#CC2929','#FF7B69' ,'#FFAA85' , '#F8F9FA']
        },
        
    };
    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('container'));
    //使用制定的配置项和数据显示图表
    myChart.setOption(option);
    myChart.on('click', function (params) {
        console.log(params.data.id);
        window.location.href="statistics.jsp?id="+params.data.id;	
        
    });
    
    
    
</script>
</body>
</html>