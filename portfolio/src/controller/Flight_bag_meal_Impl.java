package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FlightSeatBModel;
import vo.FlightSeatBean;
import vo.FlightTicketBean;

public class Flight_bag_meal_Impl implements CommandInter {

	static Flight_bag_meal_Impl impl = new Flight_bag_meal_Impl();

	public static Flight_bag_meal_Impl instance(){
		return impl;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("imp bag/meal");
		
		String ticketNum1 =request.getParameter("ticketNum1");
		String ticketNum2 =request.getParameter("ticketNum2");
		String[] lastname= request.getParameterValues("lastname");
		String[] firstname= request.getParameterValues("firstname");
		String totalprice = request.getParameter("totalprice");
		String[] box1 = request.getParameterValues("box1");
		String[] box2 = request.getParameterValues("box2");
		
		System.out.println("box1 : "+box1);
		System.out.println("box2 : "+box2);
		request.setAttribute("lastname", lastname);
		request.setAttribute("firstname", firstname);
		request.setAttribute("totalprice", totalprice);
		request.setAttribute("box1", box1);
		request.setAttribute("box2", box2);
		
		return "flight_bagmeal.jsp";
	}
}
