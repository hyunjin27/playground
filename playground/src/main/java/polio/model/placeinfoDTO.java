package polio.model;

public class placeinfoDTO {
	
	int p_no;
	String p_name;
	String p_addr;
	String p_detail;
	String p_area;
	java.util.Date regdate;
	String reguser;
	public placeinfoDTO() {
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_area() {
		return p_area;
	}
	public void setP_area(String p_area) {
		this.p_area = p_area;
	}
	public String getP_addr() {
		return p_addr;
	}
	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}

	public String getP_detail() {
		return p_detail;
	}
	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	public java.util.Date getRegdate() {
		return regdate;
	}
	public void setRegdate(java.util.Date regdate) {
		this.regdate = regdate;
	}
	public String getReguser() {
		return reguser;
	}
	public void setReguser(String reguser) {
		this.reguser = reguser;
	}

}
