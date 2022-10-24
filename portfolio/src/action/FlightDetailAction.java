package action;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.FlightDetailService;
import svc.FlightListService;
import vo.ActionForward;
import vo.FlightTicketBean;

public class FlightDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		System.out.println("디테일 액션 진입");
		ArrayList<FlightTicketBean> article1 =new ArrayList<FlightTicketBean>();
		ArrayList<FlightTicketBean> article2 =new ArrayList<FlightTicketBean>();
		
		System.out.println(request.getParameter("ticketNum1") + " / "+ request.getParameter("ticketNum2"));
		
		int ticketNum1= Integer.parseInt(request.getParameter("ticketNum1"));
		int ticketNum2= Integer.parseInt(request.getParameter("ticketNum2"));
		
		
		
		FlightDetailService FlightDetailService = new FlightDetailService();
		article1 = FlightDetailService.getArticle_detail_go(ticketNum1);
		article2 = FlightDetailService.getArticle_detail_back(ticketNum2);
		
		request.setAttribute("ticketBeanList_go", article1);
		request.setAttribute("ticketBeanList_back", article2);
		ActionForward forward = new ActionForward();	
		
  		forward.setPath("/flight/flightpage_detail.jsp");
  		
  		return forward;

	 }
}
