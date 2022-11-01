package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemModel;
import vo.FlightReserveListBean;
import vo.Item;
import vo.Member_info;

public class ItemOrder_ticketImpl implements ItemCommandInter {
	static ItemOrder_ticketImpl impl = new ItemOrder_ticketImpl();
	
	
	public static ItemOrder_ticketImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemModel model = ItemModel.instance();
		String flight_Ticket_Num = request.getParameter("flight_Ticket_Num");
		System.out.println(flight_Ticket_Num);
		
		ArrayList<FlightReserveListBean> list = (ArrayList<FlightReserveListBean>) model.select_ticketInfo(flight_Ticket_Num);
		request.setAttribute("ticketInfo", list);
		//controller
		return "/shopping/itemOrder1.jsp";
	}
}