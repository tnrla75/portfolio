package controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import model.FlightEndModel;
import vo.Travelatt;
import vo.Travelattandimg;
import vo.FlightReserveBean;
import vo.FlightTicketBean;



public class Flightend_Impl implements CommandInter{

	static Flightend_Impl impl = new Flightend_Impl();

	public static Flightend_Impl instance(){
		return impl;
	}

//	�븸�뀡�쓽 �슜�룄, DB濡� �뿰寃고븯�뒗 service濡� 媛�
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String ticketNum1 =request.getParameter("ticketNum1");
		String ticketNum2 =request.getParameter("ticketNum2");
		String[] lastname= request.getParameterValues("lastname");
		String[] firstname= request.getParameterValues("firstname");
		String[] box1= request.getParameterValues("box1");
		String[] box2= request.getParameterValues("box2");
		String totalprice = request.getParameter("totalprice");
		String mb_id = request.getParameter("mb_id");
		System.out.println(mb_id);
		
		ArrayList<FlightReserveBean> flightReserveBean = new ArrayList<FlightReserveBean>();
		FlightReserveBean reserveBean = null;
		
		
		// 媛��뒗�렪 
		for(int i =0; i< box1.length; i++) {
			reserveBean = new FlightReserveBean();
			reserveBean.setFlight_Ticket_Num(ticketNum1);
			reserveBean.setSeatNum(box1[i]);
			reserveBean.setFlight_Rlastname(lastname[i]);
			reserveBean.setFlight_Rfirstname(firstname[i]);
			reserveBean.setFlight_Reserve_price(totalprice);
			reserveBean.setMb_id(mb_id);
			flightReserveBean.add(reserveBean);
		}
		for(int i =0; i< box2.length; i++) {
			reserveBean = new FlightReserveBean();
			reserveBean.setFlight_Ticket_Num(ticketNum2);
			reserveBean.setSeatNum(box2[i]);
			reserveBean.setFlight_Rlastname(lastname[i]);
			reserveBean.setFlight_Rfirstname(firstname[i]);
			reserveBean.setFlight_Reserve_price(totalprice);
			reserveBean.setMb_id(mb_id);
			flightReserveBean.add(reserveBean);
		}
		
		// �삤�뒗�렪  
		/*flightReserveBean.setFlight_Ticket_Num(ticketNum2);
		flightReserveBean.setSeatNum(box2[0]);
		flightReserveBean.setFlight_Rlastname(lastname[0]);
		flightReserveBean.setFlight_Rfirstname(firstname[0]);
		flightReserveBean.setFlight_Reserve_price(totalprice);*/
		
		
		
		FlightEndModel model = FlightEndModel.instance();
		ArrayList<Travelattandimg> list = (ArrayList<Travelattandimg>) model.flightend_att();
		model.flightReserveInsert(flightReserveBean);
		
		request.setAttribute("data", list); 
		System.out.println("끝");
		return "flight_end.jsp";
	}
}