package entry;

import java.io.File;
import java.util.Vector;

public class Entry {
	private static String path = "C:\\Users\\Peter\\Desktop\\部分疫情日志log";
	public static void main(String[] args) {
		String[] fileList = getAllFile(path);
		solveTheFile(fileList);
//		System.out.println("Yes");
	}
	
	private static void solveTheFile(String[] fileList) {
		// TODO Auto-generated method stub
		
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
