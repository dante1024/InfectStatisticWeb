package entry;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import edu.fzu.InfectStatisticWeb.pojo.Province;

public class Entry {
	private static String path = "C:\\Users\\Peter\\Desktop\\部分疫情日志log";
	public static Map<String, Province> map = new HashMap<String, Province>();
	public static String[] province = {"全国", "安徽", "北京", "重庆", "福建", "甘肃", "广东", "广西", "贵州", "海南", "河北",
			"河南", "黑龙江", "湖北", "湖南", "吉林", "江苏", "江西", "辽宁", "内蒙古", "宁夏", "青海", "山东", "山西", "陕西",
			"上海", "四川", "天津", "西藏", "新疆", "云南", "浙江"
	};
	public static void main(String[] args) {
		initMap();
		String[] fileList = getAllFile(path);
		solveTheFile(fileList);
//		System.out.println("Yes");
	}
	
	private static void initMap() {
		// TODO Auto-generated method stub
		for(String aProvince : province) {
			Province p = new Province();
			p.setName(aProvince);
			map.put(aProvince, p);
		}
	}

	/*
	 * 处理每一个文件
	 */
	private static void solveTheFile(String[] fileList) {
		// TODO Auto-generated method stub
		for(String aFile : fileList) {
			String fileDate = aFile.substring(0, aFile.indexOf("."));
			
			try {
	    		File file = new File(path + "\\" + aFile);
	    		InputStreamReader inputReader = new InputStreamReader(new FileInputStream(file), "GB2312");
	    		BufferedReader bf = new BufferedReader(inputReader);
	    		String str;
	    		
	    		while ((str = bf.readLine()) != null && str.indexOf("//") != 0) {
	    			
	    			if(str.length() == 0)
	    				continue;
	    			System.out.println(str);
	    			String[] information = str.split("\\s+");
	    			//System.out.println(information[0]);
	    			String province = information[0];//先取到省份
	    			int number = getNumber(information);//取出各行人数
	    			//System.out.println(number);
	    			
	    			if(map.get(province) == null) {
	    				Province p = 
	    			}
	    		}			
	    		bf.close();		
	    	//	bw.close();
	    		inputReader.close();
	    	
			} 
	    	catch (IOException  e) {
	    		e.printStackTrace();
			}
//			System.out.println(fileDate);
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
				System.out.println(fileName);
			}
		}
		return fileList;
	}
}
