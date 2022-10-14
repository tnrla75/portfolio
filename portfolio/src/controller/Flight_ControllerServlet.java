package controller;
import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Flight_ControllerServlet extends HttpServlet{

	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		CommandInter inter = null;
		String viewName = "";
		System.out.println("컨트롤러 "+ command);
		
		try {
			if(command.equals("flight_end")){
				inter = Flightend_Impl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("flightseatB737_1") || command.equals("flightseatB737_2")){
				inter = FlightSeat_ImplB.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("flightseatA321_1") || command.equals("flightseatA321_2")){
				inter = FlightSeat_ImplA.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("flight_bag_meal")){
				inter = Flight_bag_meal_Impl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else {
				viewName = "error.html";
				response.sendRedirect(viewName);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}



