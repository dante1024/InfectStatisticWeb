package backend;

public class test {
	
	private static String path = "C:\\Users\\lenovo\\Desktop\\部分疫情日志log";

	public static void main(String[] args) {
		
		Entry entry=new Entry();
		Entry.initMap();
		String[] fileList = Entry.getAllFile(path);
		Entry.solveTheFile(fileList);
		
//		int[] a=nationwide();
//		int[] a=Interface.anyProvince("福建");
//		int[] a=Interface.nationwideForDate("2020-01-20");
		int[] a=Interface.anyProvinceForDate("2020-01-19","湖北");
		
		
		System.out.println(a[0]);
		System.out.println(a[1]);
		System.out.println(a[2]);
		System.out.println(a[3]);
		
		
		
	}
}
