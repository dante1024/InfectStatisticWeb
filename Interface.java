import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sun.org.apache.bcel.internal.generic.NEW;

import edu.fzu.InfectStatisticWeb.pojo.Date;
import edu.fzu.InfectStatisticWeb.pojo.Province;
import entry.Entry;

public class Interface {
	/*
	 * ����ȫ����Ϣ
	 */
	public int[] nationwide() {
		// TODO Auto-generated method stub
		int[] result = {0, 0, 0, 0};//����Ϊip sp cure dead
		String[] dateList = {"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		Province nationWide = Entry.map.get("ȫ��");
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
	 * ����ĳʡ��Ϣ
	 */
	public static int[] anyProvince(String provinceName) {
		// TODO Auto-generated method stub
		int[] result = {0, 0, 0, 0};//����Ϊip sp cure dead
		String[] dateList = {"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		Province anyProvince = Entry.map.get("provinceName");
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
	 * ����ָ�����ڵ�ȫ����Ϣ
	 */
	public int[] nationwideForDate(String dateStr) {
		// TODO Auto-generated method stub
		List<String> dateList = getDateList(dateStr);
		int[] result = {0, 0, 0, 0};//����Ϊip sp cure dead
		
		Province nationWide = Entry.map.get("ȫ��");
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
	 * ����ָ�����ڵ�ĳʡ��Ϣ
	 */
	public int[] anyProvinceForDate(String dateStr, String provinceName) {
		// TODO Auto-generated method stub
		List<String> dateList = getDateList(dateStr);
		int[] result = {0, 0, 0, 0};//����Ϊip sp cure dead
		
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
	 * ����ĳһ�������
	 */
	public int[] tendencyOfAnyDay(String dateStr, String provinceName) {
		// TODO Auto-generated method stub
		String[] dateList = {
				"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		List<String> dateArrayList = new ArrayList<String>();
		for (int i=0;i<dateList.length;i++)
		{
			dateArrayList.add(dateList[i]);
		}
		
		int[] result = {0, 0, 0, 0};//����Ϊip sp cure dead
		Province province = Entry.map.get(provinceName);
		Map<String, Date> dateMap = province.getDateMap();
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
			
			result[0] = date.getIp() - previousDate.getIp();
			result[1] = date.getSp() - previousDate.getSp();
			result[2] = date.getCure() - previousDate.getCure();
			result[3] = date.getDead() - previousDate.getDead();
		}
		
		return result;
	}
	
	/*
	 * ��ȡ��������������
	 */
	private List<String> getDateList(String dateStr) {
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
}
