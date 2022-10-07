package vo;

import java.sql.Date;

public class Hotel_review_DTO {
	
	private int hot_re_num;
	
	private int hot_main_num;
	private String hot_re_id;
	
	private int hot_re_rate;
	
	private String hot_re_content;
	
	private Date hot_re_date;
	
	
	
	public int getHot_re_num() {
		return hot_re_num;
	}
	public void setHot_re_num(int hot_re_num) {
		this.hot_re_num = hot_re_num;
	}
	
	
	
	
	
	public String getHot_re_id() {
		return hot_re_id;
	}
	public void setHot_re_id(String hot_re_id) {
		this.hot_re_id = hot_re_id;
	}
	public int getHot_re_rate() {
		return hot_re_rate;
	}
	public void setHot_re_rate(int hot_re_rate) {
		this.hot_re_rate = hot_re_rate;
	}
	public int getHot_main_num() {
		return hot_main_num;
	}
	public void setHot_main_num(int hot_main_num) {
		this.hot_main_num = hot_main_num;
	}

	
	
	public String getHot_re_content() {
		return hot_re_content;
	}
	public void setHot_re_content(String hot_re_content) {
		this.hot_re_content = hot_re_content;
	}
	
	public Date getHot_re_date() {
		return hot_re_date;
	}
	public void setHot_re_date(Date hot_re_date) {
		this.hot_re_date = hot_re_date;
	}
	
	
	
}
