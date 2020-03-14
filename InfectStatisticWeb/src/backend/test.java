package backend;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class test {
	
	private static String path = "C:\\Users\\lenovo\\Desktop\\部分疫情日志log";

	
	
	public static void main(String[] args) {
		
		
		
		Entry entry=new Entry();
		Entry.initMap();
		String[] fileList = Entry.getAllFile(path);
		Entry.solveTheFile(fileList);
		
		
		
		String[] dateList = {"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		
//		int[] a=Interface.nationwide();
//		int[] a=Interface.anyProvince("福建");
//		int[] a=Interface.nationwideForDate("2020-01-20");
//		int[] a=Interface.anyProvinceForDate("2020-01-19","湖北");
		int[] a=Interface.tendencyOfAnyDay("2020-01-21","湖北");
		
		Map<String, int []> dateMap = Interface.tendencyOfAll("湖北");

		for (int i=0;i<dateList.length;i++)
		{
			System.out.println(dateList[i]+":"+dateMap.get(dateList[i])[0]+" "+
		dateMap.get(dateList[i])[1]+" "+dateMap.get(dateList[i])[2]+" "+dateMap.get(dateList[i])[3]);
		}
		
		
//		for (Map.Entry<String, int []> entry1 : dateMap.entrySet()) {
//			  System.out.println("Key = " + entry1.getKey() 
//			  + ", Value = " + entry1.getValue()[0] +" "+ entry1.getValue()[1] +" "+ entry1.getValue()[2] +" "+ entry1.getValue()[3]);
//			}
		
//		System.out.println(a[0]);
//		System.out.println(a[1]);
//		System.out.println(a[2]);
//		System.out.println(a[3]);
		
		
		
	}
}
