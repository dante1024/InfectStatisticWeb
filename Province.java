package edu.fzu.InfectStatisticWeb.pojo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Province {
	private String name;
	private Map<String, Date> dateMap = new HashMap<String, Date>();;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Map<String, Date> getDateMap(){
		return dateMap;
	}
	
	public void addDate(String dateStr, Date date) {
		dateMap.put(dateStr, date);
	}
}
