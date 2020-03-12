package backend;

public class Date {
	private String date;
	private int ip;
	private int sp;
	private int cure;
	private int dead;
	
	public Date() {
		ip = sp = cure = dead = 0;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date; 
	}
	
	public int getIp() {
		return ip;
	}
	
	public void setIp(int ip) {
		this.ip = ip;
	}
	
	public int getSp() {
		return sp;
	}
	
	public void setSp(int sp) {
		this.sp = sp;
	}
	
	public int getCure() {
		return cure;
	}
	
	public void setCure(int cure) {
		this.cure = cure;
	}
	
	public int getDead() {
		return dead;
	}
	
	public void setDead(int dead) {
		this.dead = dead;
	}
}
