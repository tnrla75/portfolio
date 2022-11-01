package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import svc.Travel_writerouteService;
import vo.Member_info;
import vo.Travelatt;
import vo.Travelmap;

public class travel_writerouteAction implements CommandInter{

	static travel_writerouteAction impl = new travel_writerouteAction();

	public static travel_writerouteAction instance(){
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Travelmap aa = null;
		aa = new Travelmap();
		/*Travelmap aa = new Travelmap();*/
		String local = request.getParameter("local");
		Travel_writerouteService route = Travel_writerouteService.instance();
		ArrayList<Travelmap> list =(ArrayList<Travelmap>) route.writeroute(local);
		request.setAttribute("route", list); 
		return "writeRoute.travel";
	}
}