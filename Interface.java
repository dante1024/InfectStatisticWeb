import java.util.List;
import java.util.Map;

import com.sun.org.apache.bcel.internal.generic.NEW;

import edu.fzu.InfectStatisticWeb.pojo.Date;
import edu.fzu.InfectStatisticWeb.pojo.Province;
import entry.Entry;

public class Interface {
	/*
	 * 返回全国信息
	 */
	public int[] nationwide() {
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
	public int[] anyProvince(String provinceName) {
		// TODO Auto-generated method stub
		int[] result = {0, 0, 0, 0};//依次为ip sp cure dead
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
	 * 返回指定日期的全国信息
	 */
	public int[] nationwideForDate(String dateStr) {
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
	public int[] anyProvinceForDate(String dateStr, String provinceName) {
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
	 * 获取符合条件的日期
	 */
	private List<String> getDateList(String dateStr) {
		String[] dateList = {
				"2020-01-19", "2020-01-20", "2020-01-21", "2020-01-22", "2020-01-23", "2020-01-24", 
				"2020-01-25", "2020-01-26", "2020-01-27", "2020-01-28", "2020-01-29", "2020-01-30", "2020-01-31",
				"2020-02-01", "2020-02-02"
		};
		List<String> targetList = null;
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
