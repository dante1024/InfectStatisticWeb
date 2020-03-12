package edu.fzu.InfectStatisticWeb.pojo;

import java.util.List;

public class Province {
	private String name;
	private List<Date> dateList;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public List<Date> getDateList(){
		return dateList;
	}
	
	public void addDate(Date d) {
		dateList.add(d);
	}
}
