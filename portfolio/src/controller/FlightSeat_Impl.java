package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FlightEndModel;
import model.FlightSeatModel;
import vo.FlightTicketBean;
import vo.FlightSeatBean;

public class FlightSeat_Impl implements CommandInter {

	static FlightSeat_Impl impl = new FlightSeat_Impl();

	public static FlightSeat_Impl instance(){
		return impl;
	}

//	액션의 용도, DB로 연결하는 service로 감
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String ticketNum1 =request.getParameter("ticketNum1");
		String ticketNum2 =request.getParameter("ticketNum2");
		String[] lastname= request.getParameterValues("lastname");
		String[] firstname= request.getParameterValues("firstname");
		
		System.out.println("시트 액션 진입");
		FlightSeatModel model = FlightSeatModel.instance();
		ArrayList<FlightTicketBean> list1 = (ArrayList<FlightTicketBean>) model.ticket1(ticketNum1);
		ArrayList<FlightTicketBean> list2 = (ArrayList<FlightTicketBean>) model.ticket2(ticketNum2);
		ArrayList<FlightSeatBean> seat1 = (ArrayList<FlightSeatBean>) model.seat1(ticketNum1);
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("lastname", lastname);
		request.setAttribute("firstname", firstname);
		request.setAttribute("seat1", seat1);
		
		return "flight_seat.jsp";
	}
}
