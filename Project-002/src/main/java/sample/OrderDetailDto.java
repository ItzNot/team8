package sample;

public class OrderDetailDto {
	int odseq;
	int oseq;
	int pseq;
	int quantity;
	int allPrice;
	String result;
	
	public int getAllPrice() {
		return allPrice;
	}
	public void setAllPrice(int allPrice) {
		this.allPrice = allPrice;
	}
	public int getOdseq() {
		return odseq;
	}
	public void setOdseq(int odseq) {
		this.odseq = odseq;
	}
	public int getOseq() {
		return oseq;
	}
	public void setOseq(int oseq) {
		this.oseq = oseq;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "OrderDetailDto [odseq=" + odseq + ", oseq=" + oseq + ", pseq=" + pseq + ", quantity=" + quantity
				+ ", allPrice=" + allPrice + ", result=" + result + "]";
	}

}
