package entry;

import java.io.File;
import java.util.Vector;

public class Entry {
	private static String path = "C:\\Users\\Peter\\Desktop\\����������־log";
	public static void main(String[] args) {
		String[] fileList = getAllFile(path);
		solveTheFile(fileList);
//		System.out.println("Yes");
	}
	
	private static void solveTheFile(String[] fileList) {
		// TODO Auto-generated method stub
		
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
