package vo;

import java.sql.Date;

public class Mypage_review {
	private String mb_id;
	private String itemCode;
	private String brandName;
	private String itemName;
	private String itemImg;
	private int reRate;
	private String reText;
	private String rePhoto1;
	private String rePhoto2;
	private String rePhoto3;
	private Date reDate;
	
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
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemImg() {
		return itemImg;
	}
	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
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
