package controller;
import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import action.TravelAtt_reservationAction;
import action.Travel_insertRouteAction;
import action.travel_writerouteAction;
public class ControllerServlet extends HttpServlet{

	@Override
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		CommandInter inter = null;
		String viewName = "";
		System.out.println(command+"==command");

		
		try {
			 if(command.equals("attreservation")){
				inter = TravelAtt_reservationAction.instance();		
				viewName = inter.showData(request, response);	
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("routemap")){
				inter = travel_writerouteAction.instance();		
				viewName = inter.showData(request, response);	
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("makeroute")){
				inter = Travel_insertRouteAction.instance();		
				viewName = inter.showData(request, response);	
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			 else {
				viewName = "error.html";
				response.sendRedirect(viewName);
			}
		} catch (Exception e) {
			System.out.println(e+"212");
		}
	}
}



