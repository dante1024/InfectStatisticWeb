package backend;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;


public class Entry {
	private static String path = "C:\\Users\\lenovo\\Desktop\\部分疫情日志log";
	public static Map<String, Province> map = new HashMap<String, Province>();
	public static String[] province = {"全国", "安徽", "北京", "重庆", "福建", "甘肃", "广东", "广西", "贵州", "海南", "河北",
			"河南", "黑龙江", "湖北", "湖南", "吉林", "江苏", "江西", "辽宁", "内蒙古", "宁夏", "青海", "山东", "山西", "陕西",
			"上海", "四川", "天津", "西藏", "新疆", "云南", "浙江"
	};
	
	
	public static String[] dateList = {"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
			"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
			"2020-02-01", "2020-02-02"
	};
	
	public static void main(String[] args) {
		initMap();
		String[] fileList = getAllFile(path);
		solveTheFile(fileList);
		Province nationWide = Entry.map.get("广东");
		System.out.println(nationWide.getDateMap().get("2020-01-19").getIp());
	}
	
	public static void initMap() {
		
		for(String aProvince : province) {
			Province p = new Province();
			p.setName(aProvince);
			Map<String, Date> dateMap = p.getDateMap();
			for(String dateString : dateList) {
				dateMap.put(dateString, new Date());
			}
			map.put(aProvince, p);
		}
		
		
	}

	/*
	 * 处理每一个文件
	 */
	public static void solveTheFile(String[] fileList) {
		Province nationwide = map.get("全国");
		// TODO Auto-generated method stub
		for(String aFile : fileList) {
			String fileDate = aFile.substring(0, aFile.indexOf("."));
			
			Date nationwideDate = new Date();
			nationwideDate.setDate(fileDate);
			
			try {
	    		File file = new File(path + "\\" + aFile);
	    		InputStreamReader inputReader = new InputStreamReader(new FileInputStream(file), "GB2312");
	    		BufferedReader bf = new BufferedReader(inputReader);
	    		String str;
	    		
	    		while ((str = bf.readLine()) != null && str.indexOf("//") != 0) {
	    			if(str.length() == 0)
	    				continue;
	    			String[] information = str.split("\\s+");
	    			String provinceName = information[0];//先取到省份
	    			int number = getNumber(information);//取出各行人数
	    			
	    			if(map.get(provinceName) != null) {
	    				Province province = map.get(provinceName);
	    				Map<String, Date> dateMap = province.getDateMap();
	    				Date date = new Date();
	    				
	    				if(dateMap.get(fileDate) != null) {
	    					date = province.getDateMap().get(fileDate);
	    				}
	    				else {
	    					date = new Date();
	    					date.setDate(fileDate);
	    				}
	    				
	    				switch (information[1]) {
						case "新增":
							if(information[2].equals("感染患者")) {
								int ip = date.getIp();
								ip += number;
								date.setIp(ip);
								
								int nationwideIp = nationwideDate.getIp();
								nationwideIp += number;
								nationwideDate.setIp(nationwideIp);
							}
							else {//疑似患者的情况
								int sp = date.getSp();
								sp += number;
								date.setSp(sp);
								
								int nationwideSp = nationwideDate.getSp();
								nationwideSp += number;
								nationwideDate.setSp(nationwideSp);
							}
							break;
						case "治愈":
							int cure = date.getCure();
							int ip1 = date.getIp();
							cure += number;
							ip1 -= number;
							date.setCure(cure);
							date.setIp(ip1);
							
							int nationwideCure = nationwideDate.getCure();
							nationwideCure += number;
							nationwideDate.setCure(nationwideCure);
							break;
						case "死亡":
							int dead = date.getDead();
							int ip2 = date.getIp();
							dead += number;
							ip2 -= number;
							date.setDead(dead);
							date.setIp(ip2);
							
							int nationwideDead = nationwideDate.getDead();
							nationwideDead += number;
							nationwideDate.setDead(nationwideDead);
							break;
						default:
							break;
						}
	    				dateMap.put(fileDate, date);
	    				nationwide.getDateMap().put(fileDate, nationwideDate);
	    			}
	    		}			
	    		bf.close();		
	    	//	bw.close();
	    		inputReader.close();
	    	
			} 
	    	catch (IOException  e) {
	    		e.printStackTrace();
			}
		}
	}
	
	/*
	 * 获取各行的人数
	 */
	public static int getNumber(String[] information) {
		//获取人数
		String numString = information[information.length - 1];
		int index = numString.indexOf("人");
		numString = numString.substring(0, index);
		int number = Integer.parseInt(numString);
		return number;
	}

	/*
	 * 获取目录下所有文件名
	 */
	public static String[] getAllFile(String path) {
		String[] fileList = null;
		File file = new File(path);
		if(file.isDirectory()) {
			Vector<String> toHandleDate = new Vector<String>();//获取符合要求待处理的日期文件
			fileList = file.list(); // 获得目录下的所有文件的文件名
			for(String fileName : fileList) {
//				fileName = fileName.substring(0, fileName.indexOf('.'));//截断后缀名
//				//日期比较
//				if(fileName.compareTo(targetDate) <= 0) {
//					toHandleDate.add(fileName);
//					System.out.println(fileName);
//				}
//				else {
//					break;
//				}
//				System.out.println(fileName);
			}
		}
		return fileList;
		
		
		
	}
	


	
}
