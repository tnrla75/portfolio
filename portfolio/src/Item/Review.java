package Item;

import java.sql.Date;

public class Review {
	String reviewNo;
	String mb_id;
	String itemCode;
	int reRate;
	String reText;
	String rePhoto1;
	String rePhoto2;
	String rePhoto3;
	Date reDate;
	
	public String getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public int getReRate() {
		return reRate;
	}
	public void setReRate(int reRate) {
		this.reRate = reRate;
	}
	public String getReText() {
		return reText;
	}
	public void setReText(String reText) {
		this.reText = reText;
	}
	public String getRePhoto1() {
		return rePhoto1;
	}
	public void setRePhoto1(String rePhoto1) {
		this.rePhoto1 = rePhoto1;
	}
	public String getRePhoto2() {
		return rePhoto2;
	}
	public void setRePhoto2(String rePhoto2) {
		this.rePhoto2 = rePhoto2;
	}
	public String getRePhoto3() {
		return rePhoto3;
	}
	public void setRePhoto3(String rePhoto3) {
		this.rePhoto3 = rePhoto3;
	}
	public Date getReDate() {
		return reDate;
	}
	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}
}
