package sample;

import java.sql.Date;

public class ProductDto {
	int pseq;
	String name;
	String kind;
	int price2;
	String content;
	String image;
	String bestyn;
	Date indate;
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBestyn() {
		return bestyn;
	}
	public void setBestyn(String bestyn) {
		this.bestyn = bestyn;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "ProductDto [pseq=" + pseq + ", name=" + name + ", kind=" + kind + ", price1=" + price2 + ", content="
				+ content + ", image=" + image + ", bestyn=" + bestyn + ", indate=" + indate + "]";
	}
}
