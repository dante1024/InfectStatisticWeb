package backend;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sun.org.apache.bcel.internal.generic.NEW;



public class Interface {
	
	private static String path = "C:\\Users\\lenovo\\Desktop\\部分疫情日志log";

	/*
	 * 返回全国信息
	 */
	public static int[] nationwide() {
		// TODO Auto-generated method stub
		int[] result = {0, 0, 0, 0};//依次为ip sp cure dead
		String[] dateList = {"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		Province nationWide = Entry.map.get("全国");
		Map<String, Date> dateMap = nationWide.getDateMap();
		for(String dateString : dateList) {
			Date anyDate = dateMap.get(dateString);
			result[0] += anyDate.getIp();
			result[1] += anyDate.getSp();
			result[2] += anyDate.getCure();
			result[3] += anyDate.getDead();
		}
		return result;
	}
	
	/*
	 * 返回某省信息
	 */
	public static int[] anyProvince(String provinceName) {
		// TODO Auto-generated method stub
		int[] result = {0, 0, 0, 0};//依次为ip sp cure dead
		String[] dateList = {"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		Province anyProvince = Entry.map.get(provinceName);
		Map<String, Date> dateMap = anyProvince.getDateMap();
		for(String dateString : dateList) {
			Date anyDate = dateMap.get(dateString);
			
			result[0] += anyDate.getIp();
			result[1] += anyDate.getSp();
			result[2] += anyDate.getCure();
			result[3] += anyDate.getDead();
		}
		return result;
	}
	
	/*
	 * 返回指定日期的全国信息
	 */
	public static int[] nationwideForDate(String dateStr) {
		// TODO Auto-generated method stub
		List<String> dateList = getDateList(dateStr);
		int[] result = {0, 0, 0, 0};//依次为ip sp cure dead
		
		Province nationWide = Entry.map.get("全国");
		Map<String, Date> dateMap = nationWide.getDateMap();
		
		for(String dateString : dateList) {
			Date anyDate = dateMap.get(dateString);
			result[0] += anyDate.getIp();
			result[1] += anyDate.getSp();
			result[2] += anyDate.getCure();
			result[3] += anyDate.getDead();
		}
		
		return result;
	}
	
	/*
	 * 返回指定日期的某省信息
	 */
	public static int[] anyProvinceForDate(String dateStr, String provinceName) {
		// TODO Auto-generated method stub
		List<String> dateList = getDateList(dateStr);
		int[] result = {0, 0, 0, 0};//依次为ip sp cure dead
		
		Province nationWide = Entry.map.get(provinceName);
		Map<String, Date> dateMap = nationWide.getDateMap();
		
		for(String dateString : dateList) {
			Date anyDate = dateMap.get(dateString);
			result[0] += anyDate.getIp();
			result[1] += anyDate.getSp();
			result[2] += anyDate.getCure();
			result[3] += anyDate.getDead();
		}
		
		return result;
	}
	
	/*
	 * 返回某一天的趋势
	 */
	public static int[] tendencyOfAnyDay(String dateStr, String provinceName) {
		// TODO Auto-generated method stub
		String[] dateList = {
				"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
//		List<String> dateList = new ArrayList<String>(){"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
//			"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
//			"2020-02-01", "2020-02-02"
//		};
		List<String> dateArrayList = new ArrayList<String>();
		for (int i=0;i < dateList.length;i++)
		{
			dateArrayList.add(dateList[i]);
		}
		
		int[] result = {0, 0, 0, 0};//依次为ip sp cure dead
		Province province = Entry.map.get(provinceName);
		Map<String, Date> dateMap = province.getDateMap();
		
		int[] current = anyProvinceForDate(dateStr,provinceName);
		
		if(dateStr.equals("2020-01-19")) {
			Date date = dateMap.get(dateStr);
			result[0] = date.getIp();
			result[1] = date.getSp();
			result[2] = date.getCure();
			result[3] = date.getDead();
		}
		else {
			int index = dateArrayList.indexOf(dateStr) - 1;
			String previousDateStr = dateArrayList.get(index);
			Date date = dateMap.get(dateStr);
			Date previousDate = dateMap.get(previousDateStr);
			
			int[] previous = anyProvinceForDate(previousDateStr,provinceName);
			result[0] = current[0] - previous[0];
			result[1] = current[1] - previous[1];
			result[2] = current[2] - previous[2];
			result[3] = current[3] - previous[3];
		}
		
		return result;
	}
	/*
	 * 返回某省疫情
	 */
	public static Map<String, int []> tendencyOfAll(String provinceName){
		String[] dateList = {
				"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		
		int[] result = null;
		Map<String, int []> tendencyMap = new HashMap<String, int []>();

		for(String date : dateList) {
			result=tendencyOfAnyDay(date, provinceName);
			tendencyMap.put(date, result);
		}
		
		
		
		
		
		
		return tendencyMap;
	}
	
	/*
	 * 获取符合条件的日期
	 */
	private static List<String> getDateList(String dateStr) {
		String[] dateList = {
				"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		List<String> targetList = new ArrayList<String>();
		for(String date : dateList) {
			if(date.compareTo(dateStr) <= 0) {
				targetList.add(date);
			}
			else {
				break;
			}
		}
		return targetList;
	}
	
	public static void main(String[] args) {
		
		Entry entry=new Entry();
		Entry.initMap();
		String[] fileList = Entry.getAllFile(path);
		Entry.solveTheFile(fileList);
		
//		int[] a=nationwide();
//		int[] a=anyProvince("北京");
//		int[] a=nationwideForDate("2020-01-19");
//		int[] a=anyProvinceForDate("2020-01-21","湖北");
		int[] a=tendencyOfAnyDay("2020-01-21","湖北");
		
		int[] b=anyProvinceForDate("2020-01-19","湖北");
		int[] c=anyProvinceForDate("2020-01-20","湖北");
		
		for (int i=0;i<4;i++)
		{
//			System.out.println(c[i]-b[i]);
		}
		
		System.out.println(a[0]);
		System.out.println(a[1]);
		System.out.println(a[2]);
		System.out.println(a[3]);
		
		
		
	}
}
