<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="backend.Entry" %>
<%@page import="backend.Interface" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

    
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
	
	
	String userDate = request.getParameter("user_date");

	int ip2String = 0;
	String ip3String = null;
	int sp2String = 0;
	String sp3String = null;
	int cure2String = 0;
	String cure3String = null;
	int dead2String = 0;
	String dead3String = null;
	int total2=0;
	
	
	int beijing = 0;
    int tianjin = 0;
    int shanghai = 0;
    int chongqing = 0;
    int hebei = 0;
    int henan = 0;
    int yunnan = 0;
    int liaoning = 0;
    int heilongjiang = 0;
    int hunan = 0;
    int anhui = 0;
    int shandong = 0;
    int xinjiang = 0;
    int jiangsu = 0;
    int zhejiang = 0;
    int jiangxi = 0;
    int hubei = 0;
    int guangxi = 0;
    int gansu = 0;
    int shanxi = 0;
    int neimenggu = 0;
    int shanxi2 = 0;
    int jilin = 0;
    int fujian = 0;
    int guizhou = 0;
    int guangdong = 0;
    int qinghai = 0;
    int xizang = 0;
    int sichuan = 0;
    int ningxia = 0;
    int hainan = 0;
	
	System.out.println(userDate);
	
	if (userDate == null || userDate.equals("")){
		userDate="2020-02-02";
		
		ip2String = Interface.nationwide()[0];
		int ip3 = Interface.nationwideForDate("2020-02-02")[0] - Interface.nationwideForDate("2020-02-01")[0];
		if (ip3 < 0){
			ip3String=""+ip3;
		}
		else{
			ip3String="+"+ip3;
		}
		
		sp2String = Interface.nationwide()[1];
		int sp3 = Interface.nationwideForDate("2020-02-02")[1] - Interface.nationwideForDate("2020-02-01")[1];
		if (sp3 < 0){
			sp3String=""+sp3;
		}
		else{
			sp3String="+"+sp3;
		}
		
		cure2String = Interface.nationwide()[2];
		int cure3 = Interface.nationwideForDate("2020-02-02")[2] - Interface.nationwideForDate("2020-02-01")[2];
		if (cure3 < 0){
			cure3String=""+cure3;
		}
		else{
			cure3String="+"+cure3;
		}
		
		dead2String = Interface.nationwide()[3];
		int dead3 = Interface.nationwideForDate("2020-02-02")[3] - Interface.nationwideForDate("2020-02-01")[3];
		if (dead3 < 0){
			dead3String=""+dead3;
		}
		else{
			dead3String="+"+dead3;
		}
		
		total2 = ip2String + cure2String + dead2String;
		
		
		beijing=Interface.anyProvince("北京")[0];
	    tianjin=Interface.anyProvince("天津")[0];
	    shanghai=Interface.anyProvince("上海")[0];
	    chongqing=Interface.anyProvince("重庆")[0];
	    hebei=Interface.anyProvince("河北")[0];
	    henan=Interface.anyProvince("河南")[0];
	    yunnan=Interface.anyProvince("云南")[0];
	    liaoning=Interface.anyProvince("辽宁")[0];
	    heilongjiang=Interface.anyProvince("黑龙江")[0];
	    hunan=Interface.anyProvince("湖南")[0];
	    anhui=Interface.anyProvince("安徽")[0];
	    shandong=Interface.anyProvince("山东")[0];
	    xinjiang=Interface.anyProvince("新疆")[0];
	    jiangsu=Interface.anyProvince("江苏")[0];
	    zhejiang=Interface.anyProvince("浙江")[0];
	    jiangxi=Interface.anyProvince("江西")[0];
	    hubei=Interface.anyProvince("湖北")[0];
	    guangxi=Interface.anyProvince("广西")[0];
	    gansu=Interface.anyProvince("甘肃")[0];
	    shanxi=Interface.anyProvince("山西")[0];
	    neimenggu=Interface.anyProvince("内蒙古")[0];
	    shanxi2=Interface.anyProvince("陕西")[0];
	    jilin=Interface.anyProvince("吉林")[0];
	    fujian=Interface.anyProvince("福建")[0];
	    guizhou=Interface.anyProvince("贵州")[0];
	    guangdong=Interface.anyProvince("广东")[0];
	    qinghai=Interface.anyProvince("青海")[0];
	    xizang=Interface.anyProvince("西藏")[0];
	    sichuan=Interface.anyProvince("四川")[0];
	    ningxia=Interface.anyProvince("宁夏")[0];
	    hainan=Interface.anyProvince("海南")[0];
	}
	else{
		
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
		
		ip2String = Interface.nationwideForDate(userDate)[0];
		int ip3 = Interface.nationwideForDate(userDate)[0] - Interface.nationwideForDate(previousDate)[0];
		if (ip3 < 0){
			ip3String=""+ip3;
		}
		else{
			ip3String="+"+ip3;
		}
		
		sp2String = Interface.nationwideForDate(userDate)[1];
		int sp3 = Interface.nationwideForDate(userDate)[1] - Interface.nationwideForDate(previousDate)[1];
		if (sp3 < 0){
			sp3String=""+sp3;
		}
		else{
			sp3String="+"+sp3;
		}
		
		cure2String = Interface.nationwideForDate(userDate)[2];
		int cure3 = Interface.nationwideForDate(userDate)[2] - Interface.nationwideForDate(previousDate)[2];
		if (cure3 < 0){
			cure3String=""+cure3;
		}
		else{
			cure3String="+"+cure3;
		}
		
		dead2String = Interface.nationwideForDate(userDate)[3];
		int dead3 = Interface.nationwideForDate(userDate)[3] - Interface.nationwideForDate(previousDate)[3];
		if (dead3 < 0){
			dead3String=""+dead3;
		}
		else{
			dead3String="+"+dead3;
		}
		
		total2 = ip2String + cure2String + dead2String;		
		
		beijing=Interface.anyProvinceForDate(userDate,"北京")[0];
	    tianjin=Interface.anyProvinceForDate(userDate,"天津")[0];
	    shanghai=Interface.anyProvinceForDate(userDate,"上海")[0];
	    chongqing=Interface.anyProvinceForDate(userDate,"重庆")[0];
	    hebei=Interface.anyProvinceForDate(userDate,"河北")[0];
	    henan=Interface.anyProvinceForDate(userDate,"河南")[0];
	    yunnan=Interface.anyProvinceForDate(userDate,"云南")[0];
	    liaoning=Interface.anyProvinceForDate(userDate,"辽宁")[0];
	    heilongjiang=Interface.anyProvinceForDate(userDate,"黑龙江")[0];
	    hunan=Interface.anyProvinceForDate(userDate,"湖南")[0];
	    anhui=Interface.anyProvinceForDate(userDate,"安徽")[0];
	    shandong=Interface.anyProvinceForDate(userDate,"山东")[0];
	    xinjiang=Interface.anyProvinceForDate(userDate,"新疆")[0];
	    jiangsu=Interface.anyProvinceForDate(userDate,"江苏")[0];
	    zhejiang=Interface.anyProvinceForDate(userDate,"浙江")[0];
	    jiangxi=Interface.anyProvinceForDate(userDate,"江西")[0];
	    hubei=Interface.anyProvinceForDate(userDate,"湖北")[0];
	    guangxi=Interface.anyProvinceForDate(userDate,"广西")[0];
	    gansu=Interface.anyProvinceForDate(userDate,"甘肃")[0];
	    shanxi=Interface.anyProvinceForDate(userDate,"山西")[0];
	    neimenggu=Interface.anyProvinceForDate(userDate,"内蒙古")[0];
	    shanxi2=Interface.anyProvinceForDate(userDate,"陕西")[0];
	    jilin=Interface.anyProvinceForDate(userDate,"吉林")[0];
	    fujian=Interface.anyProvinceForDate(userDate,"福建")[0];
	    guizhou=Interface.anyProvinceForDate(userDate,"贵州")[0];
	    guangdong=Interface.anyProvinceForDate(userDate,"广东")[0];
	    qinghai=Interface.anyProvinceForDate(userDate,"青海")[0];
	    xizang=Interface.anyProvinceForDate(userDate,"西藏")[0];
	    sichuan=Interface.anyProvinceForDate(userDate,"四川")[0];
	    ningxia=Interface.anyProvinceForDate(userDate,"宁夏")[0];
	    hainan=Interface.anyProvinceForDate(userDate,"海南")[0];
		
		
	}
	
	
%>



<div id="information">
	<h5 id="ip1">现有确诊</h5>
	<h4 id="ip2"><%=ip2String%></h4>
	<h5 id="ip3">昨日<%=ip3String%></h5>
	<h5 id="sp1">现有疑似</h5>
	<h4 id="sp2"><%=sp2String%></h4>
	<h5 id="sp3">昨日<%=sp3String%></h5>
	<h5 id="cure1">累计治愈</h5>
	<h4 id="cure2"><%=cure2String%></h4>
	<h5 id="cure3">昨日<%=cure3String%></h5>
	<h5 id="dead1">累计死亡</h5>
	<h4 id="dead2"><%=dead2String%></h4>
	<h5 id="dead3">昨日<%=dead3String%></h5>
	
	<h5 id="total1">累计确诊</h5>
	<h4 id="total2"><%=total2%></h4>
</div>


<form action="/InfectStatisticWeb/index.jsp" method="post">
	选择日期: <input id="date" type="date" name="user_date" />
	<input type="submit" value="查询"/>
</form>


<h1>当前日期：<%=userDate %></h1>

<div id="container" style="height: 800px;width:1200px;background:white;margin:20px 0 0;"></div>




<script type="text/javascript">
    // 全国省份列表
    
    var beijing=<%=beijing%>;
    var tianjin=<%=tianjin%>;
    var shanghai=<%=shanghai%>;
    var chongqing=<%=chongqing%>;
    var hebei=<%=hebei%>;
    var henan=<%=henan%>;
    var yunnan=<%=yunnan%>;
    var liaoning=<%=liaoning%>;
    var heilongjiang=<%=heilongjiang%>;
    var hunan=<%=hunan%>;
    var anhui=<%=anhui%>;
    var shandong=<%=shandong%>;
    var xinjiang=<%=xinjiang%>;
    var jiangsu=<%=jiangsu%>;
    var zhejiang=<%=zhejiang%>;
    var jiangxi=<%=jiangxi%>;
    var hubei=<%=hubei%>;
    var guangxi=<%=guangxi%>;
    var gansu=<%=gansu%>;
    var shanxi=<%=shanxi%>;
    var neimenggu=<%=neimenggu%>;
    var shanxi2=<%=shanxi2%>;
    var jilin=<%=jilin%>;
    var fujian=<%=fujian%>;
    var guizhou=<%=guizhou%>;
    var guangdong=<%=guangdong%>;
    var qinghai=<%=qinghai%>;
    var xizang=<%=xizang%>;
    var sichuan=<%=sichuan%>;
    var ningxia=<%=ningxia%>;
    var hainan=<%=hainan%>;
    
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