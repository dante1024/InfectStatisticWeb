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
</head>
<body>

<h1>hahaha</h1>
<form action="/InfectStatisticWeb/1.jsp" method="post">
	Date: <input type="date" name="user_date" />
	<input type="submit" />

<div id="container" style="height: 800px;width:1200px;background:white;margin:20px 0 0;"></div>

<%
	String path = "C:\\Users\\lenovo\\Desktop\\部分疫情日志log";
	Entry entry=new Entry();
	Entry.initMap();
	String[] fileList = Entry.getAllFile(path);
	Entry.solveTheFile(fileList);
	
	//int[] a=nationwide();
//	int[] a=Interface.anyProvince("福建");
//	int[] a=Interface.nationwideForDate("2020-01-20");
	// int[] a=Interface.anyProvinceForDate("2020-01-19","湖北");
%>


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
    
    var dataMap = [{id:1, name: '北京',value:beijing }, { name: '天津',value:tianjin}, { name: '上海',value:shanghai }, { name: '重庆',value:chongqing }, 
    	{ name: '河北',value:hebei }, { name: '河南',value:henan }, { name: '云南',value:yunnan }, { name: '辽宁',value:liaoning }, { name: '黑龙江',value:heilongjiang }, 
    	{ name: '湖南',value:hunan }, { name: '安徽',value:anhui }, { name: '山东',value:shandong }, { name: '新疆',value:xinjiang }, { name: '江苏',value:jiangsu }, 
    	{ name: '浙江',value:zhejiang }, { name: '江西',value:jiangxi }, { name: '湖北',value:hubei }, { name: '广西',value:guangxi }, { name: '甘肃',value:gansu }, 
    	{ name: '山西',value:shanxi }, { name: '内蒙古',value:neimenggu },  { name: '陕西',value:shanxi2 }, { name: '吉林',value:jilin }, { name: '福建',value:fujian }, 
    	{ name: '贵州',value:guizhou }, { name: '广东',value:guangdong }, { name: '青海',value:qinghai }, { name: '西藏',value:xizang }, { name: '四川',value:sichuan }, 
    	{ name: '宁夏',value:ningxia }, { name: '海南',value:hainan }, { name: '台湾',value:"none" }, { name: '香港',value:"none"}, { name: '澳门',value:"none" }]
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
    
    <%
    	//a aa=new a();
    	//String s=aa.g();
    
    %>
    
    var a=66;
    
    	
    
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
        window.location.href="1.jsp?id="+params.data.name;	
        
    });
    
    
    
</script>
</body>
</html>