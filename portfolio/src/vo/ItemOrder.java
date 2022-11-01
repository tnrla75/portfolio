package vo;

import java.sql.Date;

public class ItemOrder {
	private String order_no;
	private String mb_id;
	private int count;
	private String option;
	private Date order_date;
	
	private String itemCode;
	private String brandName;
	private String itemName;
	private String itemImg;
	private int itemWon;
	private int itemDollar;
	private int discount;
	private int discountWon;
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
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
	public int getItemWon() {
		return itemWon;
	}
	public void setItemWon(int itemWon) {
		this.itemWon = itemWon;
	}
	public int getItemDollar() {
		return itemDollar;
	}
	public void setItemDollar(int itemDollar) {
		this.itemDollar = itemDollar;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getDiscountWon() {
		return discountWon;
	}
	public void setDiscountWon(int discountWon) {
		this.discountWon = discountWon;
	}

}
