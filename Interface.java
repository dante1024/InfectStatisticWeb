import edu.fzu.InfectStatisticWeb.pojo.Province;
import entry.Entry;

public class Interface {
	/*
	 * ����ȫ����Ϣ
	 */
	public Province nationwide() {
		// TODO Auto-generated method stub
		Province nationWide = Entry.map.get("ȫ��");
		return nationWide;
	}
	
	/*
	 * ����ĳʡ��Ϣ
	 */
	public Province anyProvince(String provinceName) {
		// TODO Auto-generated method stub
		Province anyProvince = Entry.map.get(provinceName);
		return anyProvince;
	}
}
