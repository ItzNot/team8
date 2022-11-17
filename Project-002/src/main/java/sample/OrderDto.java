package sample;

import java.sql.Date;

public class OrderDto {
	int oseq;
	String id;
	Date indate;
	String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOseq() {
		return oseq;
	}
	public void setOseq(int oseq) {
		this.oseq = oseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "OrderDto [oseq=" + oseq + ", id=" + id + ", indate=" + indate + ", name=" + name + "]";
	}

}
