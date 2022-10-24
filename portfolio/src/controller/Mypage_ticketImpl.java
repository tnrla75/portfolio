package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Mypage_ticketModel;
import vo.FlightReserveListBean;

public class Mypage_ticketImpl implements MypageCommandInter {
	static Mypage_ticketImpl impl = new Mypage_ticketImpl();

	public static Mypage_ticketImpl instance(){
		return impl;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String mb_id = request.getParameter("mb_id");
		System.out.println("imp ticketImpl" + mb_id);
		Mypage_ticketModel model = Mypage_ticketModel.instance();
		ArrayList<FlightReserveListBean> list1 = (ArrayList<FlightReserveListBean>) model.mypage_flightreserve(mb_id);
		
		request.setAttribute("list1", list1);
		
		return "mypage_ticketOrder.jsp";
	}

}
