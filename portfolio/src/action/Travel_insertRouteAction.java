package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandInter;
import svc.Travel_insertRouteService;
import vo.Travel_makeroute;


public class Travel_insertRouteAction implements CommandInter {
	static Travel_insertRouteAction impl = new Travel_insertRouteAction();
	
	public static Travel_insertRouteAction instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Travel_insertRouteService insertroute = Travel_insertRouteService.instance();
			
		HttpSession session = request.getSession();
		Travel_makeroute makeroute=null;
		makeroute = new Travel_makeroute();
		makeroute.setRoutetitle(request.getParameter("title"));
		makeroute.setLocal(request.getParameter("local"));
		makeroute.setMb_id(request.getParameter("mb_id"));
		makeroute.setRoute1_1(request.getParameter("1-0"));
		makeroute.setRoute1_2(request.getParameter("1-1"));
		makeroute.setRoute1_3(request.getParameter("1-2"));
		makeroute.setRoute1_4(request.getParameter("1-3"));
		makeroute.setRoute1_5(request.getParameter("1-4"));
		makeroute.setRoute2_1(request.getParameter("2-0"));
		makeroute.setRoute2_2(request.getParameter("2-1"));
		makeroute.setRoute2_3(request.getParameter("2-2"));
		makeroute.setRoute2_4(request.getParameter("2-3"));
		makeroute.setRoute2_5(request.getParameter("2-4"));
		makeroute.setRoute3_1(request.getParameter("3-0"));
		makeroute.setRoute3_2(request.getParameter("3-1"));
		makeroute.setRoute3_3(request.getParameter("3-2"));
		makeroute.setRoute3_4(request.getParameter("3-3"));
		makeroute.setRoute3_5(request.getParameter("3-4"));
		makeroute.setRoute4_1(request.getParameter("4-0"));
		makeroute.setRoute4_2(request.getParameter("4-1"));
		makeroute.setRoute4_3(request.getParameter("4-2"));
		makeroute.setRoute4_4(request.getParameter("4-3"));
		makeroute.setRoute4_5(request.getParameter("4-4"));
		makeroute.setRoute5_1(request.getParameter("5-0"));
		makeroute.setRoute5_2(request.getParameter("5-1"));
		makeroute.setRoute5_3(request.getParameter("5-2"));
		makeroute.setRoute5_4(request.getParameter("5-3"));
		makeroute.setRoute5_5(request.getParameter("5-4"));
		
		insertroute.insertroute(makeroute);
		return "../travel/travelroutemake_Complete.jsp";
		/*request.setAttribute("item", list);
		return "/overlap/mypage_travelReservation.jsp";*/
	}
}