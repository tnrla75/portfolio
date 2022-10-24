package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.FlightListService;
import vo.ActionForward;
import vo.FlightTicketBean;
import vo.PageInfo;;

public class FlightListAction_go implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		ArrayList<FlightTicketBean> article1 =new ArrayList<FlightTicketBean>();
		 
		String departure = request.getParameter("departure1");
		String arrive =  request.getParameter("arrive1");
		String people =request.getParameter("flight_people1");
		String seat = request.getParameter("seatGrade1");
		String arrivalday = request.getParameter("arrivalDay1");
		String departureday = request.getParameter("departureDay1");
		FlightListService FlightListService = new FlightListService();
		String arr = request.getParameter("arr");
		
		
		
		int page1=1;
		int limit=10;
		int listCount;
		if(request.getParameter("page1")!=null){
			page1 = Integer.parseInt(request.getParameter("page1"));
		}
		
		listCount=FlightListService.getListCount(departure, arrive, people, seat, departureday);
		article1 = FlightListService.getArticle_go(departure, arrive, people, seat, departureday , page1, limit);
		
   		int maxPage=(int)((double)listCount/limit+0.95);
   		// 10 / 10+0.95  1癰귣��뼄 占쎈튋揶쏄쑵寃� 
   		int startPage = (((int) ((double)page1 / 10 + 0.9)) - 1) * 10 + 1;
   		
   	    int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page1);
		pageInfo.setStartPage(startPage);	
	
		
		request.setAttribute("ticketBeanList1", article1);
		request.setAttribute("pageInfo1", pageInfo);
		ActionForward forward = new ActionForward();	
		forward.setPath("/flight/flightpage_go.jsp");
		
  		return forward;

	 }
}