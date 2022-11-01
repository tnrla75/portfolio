package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MypageModel;
import vo.ItemOrder;
import vo.Travelatt_reservation;

public class Mypage_travelReservation implements MypageCommandInter {
	static Mypage_travelReservation impl = new Mypage_travelReservation();
	
	public static Mypage_travelReservation instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
			
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		System.out.println(mb_id+"bbb");
		
		ArrayList<Travelatt_reservation> list = (ArrayList<Travelatt_reservation>) model.travel_reserveation(mb_id);
		request.setAttribute("item", list);
		return "/overlap/mypage_travelReservation.jsp";
	}
}