package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FlightEndModel;
import model.FlightSeatBModel;
import vo.FlightTicketBean;
import vo.FlightSeatBean;

public class FlightSeat_ImplA implements CommandInter {

	static FlightSeat_ImplA impl = new FlightSeat_ImplA();

	public static FlightSeat_ImplA instance(){
		return impl;
	}

//	액션의 용도, DB로 연결하는 service로 감
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("imp A");
		String bool = request.getParameter("bool");
		
		String ticketNum1 =request.getParameter("ticketNum1");
		String ticketNum2 =request.getParameter("ticketNum2");
		String[] lastname= request.getParameterValues("lastname");
		String[] firstname= request.getParameterValues("firstname");
		
		String totalprice = request.getParameter("totalprice");
		
		
		FlightSeatBModel model = FlightSeatBModel.instance();
		ArrayList<FlightTicketBean> list1 = (ArrayList<FlightTicketBean>) model.ticket1(ticketNum1);
		ArrayList<FlightTicketBean> list2 = (ArrayList<FlightTicketBean>) model.ticket2(ticketNum2);
		ArrayList<FlightSeatBean> seat1 = (ArrayList<FlightSeatBean>) model.seat1(ticketNum1);
		ArrayList<FlightSeatBean> seat2 = (ArrayList<FlightSeatBean>) model.seat1(ticketNum2);
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("lastname", lastname);
		request.setAttribute("firstname", firstname);
		request.setAttribute("seat1", seat1);
		request.setAttribute("totalprice", totalprice);
		
		if(bool == null) {
			request.setAttribute("seat1", seat1);
			return "flight_seatA321_1.jsp";
		}
		else {
			request.setAttribute("seat2", seat2);
			return "flight_seatA321_2.jsp";
		}
	}
}
