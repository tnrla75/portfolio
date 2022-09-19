package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.FlightListService;
import vo.ActionForward;
import vo.FlightTicketBean;
import vo.PageInfo;

public class FlightListAction_oneway implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
			
			 ArrayList<FlightTicketBean> article3 =new ArrayList<FlightTicketBean>();
			 
		 
			String departure = request.getParameter("departure2");
			String arrive =  request.getParameter("arrive2");
			String people =request.getParameter("flight_people2");
			String seat = request.getParameter("seatGrade2");
			String departureday = request.getParameter("departureDay2");
			
			int page3=1;
			int limit=10;
			if(request.getParameter("page3")!=null){
				page3=Integer.parseInt(request.getParameter("page3"));
			}
			
			FlightListService FlightListService = new FlightListService();
			int listCount=FlightListService.getListCount(departure, arrive, people, seat, departureday);
			
			/*ArrayList<FlightTicketBean> article3 = FlightListService.getArticle3(departure, arrive, people, seat,  departureday);*/
			article3 = FlightListService.getArticle_oneway(departure, arrive, people, seat, departureday , page3, limit);
			
			int maxPage=(int)((double)listCount/limit+0.95);
	   		// 10 / 10+0.95  1보다 약간큼 
	   		int startPage = (((int) ((double)page3 / 10 + 0.9)) - 1) * 10 + 1;
	   		
	   	    int endPage = startPage+10-1;

	   		if (endPage> maxPage) endPage= maxPage;

	   		PageInfo pageInfo = new PageInfo();
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page3);
			pageInfo.setStartPage(startPage);	
			
			request.setAttribute("ticketBeanList3", article3);
			request.setAttribute("pageInfo3", pageInfo);
			ActionForward forward = new ActionForward();	   
			
			
			
	  		forward.setPath("/flight/flightpage_oneway.jsp");
	  		
	  		return forward;

		 }
}
