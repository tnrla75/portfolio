package vo;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

public class Hotel_room_DB {
	
	private int hot_room_num;
	private int hot_main_num;
	private String hot_room_img;
	private String hot_room_name;
	private String hot_room_info;
	private int hot_room_amount;
	private int hot_room_price;
	private String hot_room_maxpeople;
	private String hot_room_bedsort;
	
	private int att_Num;
	
	private String hot_main_img;
	private String hot_nation;
	private String hot_name;
	private String hot_address;
	private String hot_checkin_date;
	private String hot_checkout_date;
	
	private int hot_latitude;
	private int hot_longitude;
	private int hot_BOARD_RE_REF;
	private int hot_BOARD_RE_SEQ;
	private Date hot_BOARD_DATE;
	
	private int hot_re_num;
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
	
	public int getAtt_Num() {
		return att_Num;
	}
	public void setAtt_Num(int att_Num) {
		this.att_Num = att_Num;
	}
	public String getHot_main_img() {
		return hot_main_img;
	}
	public void setHot_main_img(String hot_main_img) {
		this.hot_main_img = hot_main_img;
	}
	public String getHot_nation() {
		return hot_nation;
	}
	public void setHot_nation(String hot_nation) {
		this.hot_nation = hot_nation;
	}
	public String getHot_name() {
		return hot_name;
	}
	public void setHot_name(String hot_name) {
		this.hot_name = hot_name;
	}
	public String getHot_address() {
		return hot_address;
	}
	public void setHot_address(String hot_address) {
		this.hot_address = hot_address;
	}
	public String getHot_checkin_date() {
		return hot_checkin_date;
	}
	public void setHot_checkin_date(String hot_checkin_date) {
		this.hot_checkin_date = hot_checkin_date;
	}
	public String getHot_checkout_date() {
		return hot_checkout_date;
	}
	public void setHot_checkout_date(String hot_checkout_date) {
		this.hot_checkout_date = hot_checkout_date;
	}
	public int getHot_latitude() {
		return hot_latitude;
	}
	public void setHot_latitude(int hot_latitude) {
		this.hot_latitude = hot_latitude;
	}
	public int getHot_longitude() {
		return hot_longitude;
	}
	public void setHot_longitude(int hot_longitude) {
		this.hot_longitude = hot_longitude;
	}
	public int getHot_BOARD_RE_REF() {
		return hot_BOARD_RE_REF;
	}
	public void setHot_BOARD_RE_REF(int hot_BOARD_RE_REF) {
		this.hot_BOARD_RE_REF = hot_BOARD_RE_REF;
	}
	public int getHot_BOARD_RE_SEQ() {
		return hot_BOARD_RE_SEQ;
	}
	public void setHot_BOARD_RE_SEQ(int hot_BOARD_RE_SEQ) {
		this.hot_BOARD_RE_SEQ = hot_BOARD_RE_SEQ;
	}
	public Date getHot_BOARD_DATE() {
		return hot_BOARD_DATE;
	}
	public void setHot_BOARD_DATE(Date hot_BOARD_DATE) {
		this.hot_BOARD_DATE = hot_BOARD_DATE;
	}
	
	
	public int getHot_room_num() {
		return hot_room_num;
	}
	public void setHot_room_num(int hot_room_num) {
		this.hot_room_num = hot_room_num;
	}
	public int getHot_main_num() {
		return hot_main_num;
	}
	public void setHot_main_num(int hot_main_num) {
		this.hot_main_num = hot_main_num;
	}	
	public String getHot_room_img() {
		return hot_room_img;
	}
	public void setHot_room_img(String hot_room_img) {
		this.hot_room_img = hot_room_img;
	}
	public String getHot_room_name() {
		return hot_room_name;
	}
	public void setHot_room_name(String hot_room_name) {
		this.hot_room_name = hot_room_name;
	}
	public String getHot_room_info() {
		return hot_room_info;
	}
	public void setHot_room_info(String hot_room_info) {
		this.hot_room_info = hot_room_info;
	}
	public int getHot_room_amount() {
		return hot_room_amount;
	}
	public void setHot_room_amount(int hot_room_amount) {
		this.hot_room_amount = hot_room_amount;
	}
	public int getHot_room_price() {
		return hot_room_price;
	}
	public void setHot_room_price(int hot_room_price) {
		this.hot_room_price = hot_room_price;
	}
	public String getHot_room_maxpeople() {
		return hot_room_maxpeople;
	}
	public void setHot_room_maxpeople(String hot_room_maxpeople) {
		this.hot_room_maxpeople = hot_room_maxpeople;
	}
	public String getHot_room_bedsort() {
		return hot_room_bedsort;
	}
	public void setHot_room_bedsort(String hot_room_bedsort) {
		this.hot_room_bedsort = hot_room_bedsort;
	}
	
	
	public int updateReadCount(int hot_room_num2) {
		// TODO Auto-generated method stub
		return 0;
	}
	public Hotel_room_DB room_select(int hot_room_num2) {
		// TODO Auto-generated method stub
		return null;
	}
	public void setConnection(Connection con) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
