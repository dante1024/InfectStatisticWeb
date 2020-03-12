package entry;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import edu.fzu.InfectStatisticWeb.pojo.Date;
import edu.fzu.InfectStatisticWeb.pojo.Province;

public class Entry {
	private static String path = "C:\\Users\\Peter\\Desktop\\����������־log";
	public static Map<String, Province> map = new HashMap<String, Province>();
	public static String[] province = {"ȫ��", "����", "����", "����", "����", "����", "�㶫", "����", "����", "����", "�ӱ�",
			"����", "������", "����", "����", "����", "����", "����", "����", "���ɹ�", "����", "�ຣ", "ɽ��", "ɽ��", "����",
			"�Ϻ�", "�Ĵ�", "���", "����", "�½�", "����", "�㽭"
	};
	public static void main(String[] args) {
		initMap();
		String[] fileList = getAllFile(path);
		solveTheFile(fileList);
		Province nationWide = Entry.map.get("ȫ��");
		System.out.println(nationWide.getDateMap().get("2020-01-21").getIp());
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
	 * ����ÿһ���ļ�
	 */
	private static void solveTheFile(String[] fileList) {
		Province nationwide = map.get("ȫ��");
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
	    			System.out.println(str);
	    			String[] information = str.split("\\s+");
	    			//System.out.println(information[0]);
	    			String provinceName = information[0];//��ȡ��ʡ��
	    			int number = getNumber(information);//ȡ����������
	    			//System.out.println(number);
	    			
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
						case "����":
							if(information[2].equals("��Ⱦ����")) {
								int ip = date.getIp();
								ip += number;
								date.setIp(ip);
								
								int nationwideIp = nationwideDate.getIp();
								nationwideIp += number;
								nationwideDate.setIp(nationwideIp);
							}
							else {//���ƻ��ߵ����
								int sp = date.getSp();
								sp += number;
								date.setSp(sp);
								
								int nationwideSp = nationwideDate.getSp();
								nationwideSp += number;
								nationwideDate.setSp(nationwideSp);
							}
							break;
						case "����":
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
						case "����":
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
//			System.out.println(fileDate);
		}
	}
	
	/*
	 * ��ȡ���е�����
	 */
	public static int getNumber(String[] information) {
		//��ȡ����
		String numString = information[information.length - 1];
		int index = numString.indexOf("��");
		numString = numString.substring(0, index);
		int number = Integer.parseInt(numString);
		return number;
	}

	/*
	 * ��ȡĿ¼�������ļ���
	 */
	public static String[] getAllFile(String path) {
		String[] fileList = null;
		File file = new File(path);
		if(file.isDirectory()) {
			Vector<String> toHandleDate = new Vector<String>();//��ȡ����Ҫ�������������ļ�
			fileList = file.list(); // ���Ŀ¼�µ������ļ����ļ���
			for(String fileName : fileList) {
//				fileName = fileName.substring(0, fileName.indexOf('.'));//�ضϺ�׺��
//				//���ڱȽ�
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
