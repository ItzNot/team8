package sample;

import java.sql.Date;

public class ProductDto {
	int prdid;
	String prdname;
	int price;
	String company;
	String address;
	String grade;
	Date createdt;
	public int getPrdid() {
		return prdid;
	}
	public void setPrdid(int prdid) {
		this.prdid = prdid;
	}
	public String getPrdname() {
		return prdname;
	}
	public void setPrdname(String prdname) {
		this.prdname = prdname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Date getCreatedt() {
		return createdt;
	}
	public void setCreatedt(Date createdt) {
		this.createdt = createdt;
	}
	@Override
	public String toString() {
		return "ProductDto [prdid=" + prdid + ", prdname=" + prdname + ", price=" + price + ", company=" + company
				+ ", address=" + address + ", grade=" + grade + ", createdt=" + createdt + "]";
	}
	

}
