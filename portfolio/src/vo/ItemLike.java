package vo;

import java.sql.Date;

public class ItemLike {
	String mb_id;
	String itemCode;
	Date likeDay;
	
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
	public Date getLikeDay() {
		return likeDay;
	}
	public void setLikeDay(Date likeDay) {
		this.likeDay = likeDay;
	}

}
