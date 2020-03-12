import edu.fzu.InfectStatisticWeb.pojo.Province;
import entry.Entry;

public class Interface {
	/*
	 * 返回全国信息
	 */
	public Province nationwide() {
		// TODO Auto-generated method stub
		Province nationWide = Entry.map.get("全国");
		return nationWide;
	}
	
	/*
	 * 返回某省信息
	 */
	public Province anyProvince(String provinceName) {
		// TODO Auto-generated method stub
		Province anyProvince = Entry.map.get(provinceName);
		return anyProvince;
	}
}
