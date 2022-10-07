package action;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import model.SawonModel;

import vo.Hotel_yoyaku_DTO;

// �뿊�뀡 媛숈� �뒓�굦

public class Hotel_KanryoAcion implements CommandInter{

	static Hotel_KanryoAcion impl = new Hotel_KanryoAcion();
	
	public static Hotel_KanryoAcion instance(){
		return impl;
	}

	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SawonModel model = SawonModel.instance();
		ArrayList<Hotel_yoyaku_DTO> list = (ArrayList<Hotel_yoyaku_DTO>) model.selectSawon();
		request.setAttribute("data", list);
//		List<String> a = new ArrayList<String>();
//		java.util.Collections.sort(a);
		return "hotel_batis_kanryo.jsp";
	}
}