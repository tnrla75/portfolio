package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MypageModel;
import vo.Travel_makeroute;
import vo.Travel_selectroute;

public class Mypage_travelMyrouteImpl implements MypageCommandInter {
	static Mypage_travelMyrouteImpl impl = new Mypage_travelMyrouteImpl();
	
	public static Mypage_travelMyrouteImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
			
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		
		ArrayList<Travel_selectroute> list = (ArrayList<Travel_selectroute>) model.travel_makeroute(mb_id);
		request.setAttribute("myroute", list);
		return "/overlap/mypage_travelmyroute.jsp";
	}
}