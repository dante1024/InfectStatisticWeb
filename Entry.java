package entry;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Vector;

public class Entry {
	private static String path = "C:\\Users\\Peter\\Desktop\\����������־log";
	public static void main(String[] args) {
		String[] fileList = getAllFile(path);
		solveTheFile(fileList);
//		System.out.println("Yes");
	}
	
	/*
	 * ����ÿһ���ļ�
	 */
	private static void solveTheFile(String[] fileList) {
		// TODO Auto-generated method stub
		for(String aFile : fileList) {
			String fileDate = aFile.substring(0, aFile.indexOf("."));
			
			try {
	    		File file = new File(path + "\\" + aFile);
	    		InputStreamReader inputReader = new InputStreamReader(new FileInputStream(file), "UTF-8");
	    		BufferedReader bf = new BufferedReader(inputReader);
	    		String str;
	    		
	    		while ((str = bf.readLine()) != null && str.indexOf("//") != 0) {
	    			//System.out.println(str);
	    			String[] information = str.split("\\s+");
	    			//System.out.println(information[0]);
	    			String province = information[0];//��ȡ��ʡ��
	    			int number = getNumber(information);//ȡ����������
	    			
	    			
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
