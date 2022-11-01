package action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.CommandInter;
import model.Hotel_mainModel;
import vo.Hotel_yoyaku_DTO;

// �뿊�뀡 媛숈� �뒓�굦

public class Hotel_Batis_KanryoAcion implements CommandInter{

	private static final Hotel_yoyaku_DTO hotel_yoyaku_DTO = null;
	static Hotel_Batis_KanryoAcion kanryoList = new Hotel_Batis_KanryoAcion();
	
	public static Hotel_Batis_KanryoAcion instance(){
		return kanryoList;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">>>>>>>>>>>>�셿猷� �뿊�뀡 �뱶�윭�샂 1");
		
		Hotel_mainModel model = Hotel_mainModel.instance();
		List<Hotel_yoyaku_DTO> kanryoList =model.kanryoSelect();
		
		int hot_room_num=kanryoList.get(0).getHot_room_num();
		int hot_main_num =kanryoList.get(0).getHot_main_num();
		int hot_room_price =kanryoList.get(0).getHot_room_price();
		/*int hot_yoyaku_num=kanryoList.getHot_yoyaku_num();
		String hot_name=kanryoList.getHot_name();
		String hot_room_name=kanryoList.getHot_room_name();
		
		String mb_firstname=kanryoList.getMb_firstname();
		String mb_lastname=kanryoList.getMb_lastname();
		String mb_gender=kanryoList.getMb_gender();
		String hot_checkin_date=kanryoList.getHot_checkin_date();
		String hot_checkout_date=kanryoList.getHot_checkout_date();*/
		
		
		System.out.println(hot_room_num+" : kanryo �뿊�뀡 hot_room_num");
		System.out.println(hot_main_num+" : kanryo �뿊�뀡 hot_main_num");
		System.out.println(hot_room_price+" : kanryo �뿊�뀡 hot_room_price");
		
		Hotel_yoyaku_DTO yoyakuList= new Hotel_yoyaku_DTO();
		
		
		
		
		/*String hot_checkin_time=kanryoList.getHot_checkin_time();
		String hot_checkout_time=kanryoList.getHot_checkout_time();*/
		
		
	/*	yoyakuList.setMb_id(mb_id);
		yoyakuList.setHot_room_num(hot_room_num);
		yoyakuList.setHot_main_num(hot_main_num);
		yoyakuList.setHot_room_price(hot_room_price);
		yoyakuList.setHot_room_amount(1);
		yoyakuList.setHot_name(hot_name);
		yoyakuList.setHot_address(hot_address);
		yoyakuList.setHot_room_name(hot_room_name);
		yoyakuList.setMb_firstname(mb_firstname);
		yoyakuList.setMb_lastname(mb_lastname);
		yoyakuList.setMb_phonenum(mb_phonenum);
		yoyakuList.setMb_email(mb_email);
		yoyakuList.setMb_birth(mb_birth);
		yoyakuList.setMb_gender(mb_gender);
		yoyakuList.setHot_checkin_date(hot_checkin_date);
		yoyakuList.setHot_checkout_date(hot_checkout_date);
		yoyakuList.setHot_checkin_time(hot_checkin_time);
		yoyakuList.setHot_checkout_time(hot_checkout_time);*/
		
		System.out.println(">>>>>>>>>>>>�셿猷� �뿊�뀡 �뱶�윭�샂 2");
		
		request.setAttribute("kanryoList", kanryoList);
		
		System.out.println(kanryoList+" : �뿊�뀡 kanryo");
		
		
//		List<String> a = new ArrayList<String>();
//		java.util.Collections.sort(a);
		return "../hotel/hotel_batis_kanryo.jsp";
	}
}