<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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



<div id="container" style="height: 800px;width:1200px;background:white;margin:20px 0 0;"></div>

<script type="text/javascript">
    // 全国省份列表
    
      var a=66;
    
    var dataMap = [{id:1, name: '北京',value:a }, { name: '天津',value:a }, { name: '上海' }, { name: '重庆' }, { name: '河北' }, { name: '河南' }, { name: '云南' }, { name: '辽宁' }, { name: '黑龙江' }, { name: '湖南' }, { name: '安徽' }, { name: '山东' },
    { name: '新疆' }, { name: '江苏' }, { name: '浙江' }, { name: '江西' }, { name: '湖北' }, { name: '广西' }, { name: '甘肃' }, { name: '山西' }, { name: '内蒙古' }, { name: '陕西' }, { name: '吉林' }, { name: '福建' }, { name: '贵州' },
    { name: '广东' }, { name: '青海' }, { name: '西藏' }, { name: '四川' }, { name: '宁夏' }, { name: '海南' }, { name: '台湾' }, { name: '香港' }, { name: '澳门' }]
    // 需要在页面上直接标记出来的城市
    var specialMap = ['浙江', '云南', '陕西'];
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
                var info = '<p style="font-size:18px">' + params.name + '</p><p style="font-size:14px">'+params.value+'</p>'
                return info;
            },
            backgroundColor: "#ff7f50",//提示标签背景颜色
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
                        // textStyle:{color:"#800080"}
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
                        areaColor: "#ffdead",
                    }
                },
                data: dataMap
            }
        ]
    };
    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('container'));
    //使用制定的配置项和数据显示图表
    myChart.setOption(option);
    myChart.on('click', function (params) {
        //console.log(params.id);
        if (params.id==1)
       	{
        	
        	console.log("点击的是北京");
            //window.location.href="1.jsp?id=1";

       	}
        else
       	{
        	console.log("不是北京");
        	//window.location.href="1.jsp?id=2";	
       	}
        
    });
    
    
    
</script>
</body>
</html>