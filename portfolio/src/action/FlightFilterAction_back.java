package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.FlightFilterService;
import svc.FlightListService;
import vo.ActionForward;
import vo.FlightTicketBean;
import vo.PageInfo;

public class FlightFilterAction_back implements Action  {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		System.out.println("필터 액션 java");
		 ArrayList<FlightTicketBean> article1 =new ArrayList<FlightTicketBean>();
		 
		String departure = request.getParameter("departure1");
		String arrive =  request.getParameter("arrive1");
		String people =request.getParameter("flight_people1");
		String seat = request.getParameter("seatGrade1");
		String departureday = request.getParameter("departureDay1");
		String arrivalday = request.getParameter("arrivalDay1");
		String startleftval1 = request.getParameter("startleftval1");
		String startrightval1 = request.getParameter("startrightval1");
		String startleftval2 = request.getParameter("startleftval2");
		String startrightval2 = request.getParameter("startrightval2");
		System.out.println("bb");
		FlightFilterService FlightFilterService = new FlightFilterService();		
		String arr = request.getParameter("arr");
		
		
		
		int page1=1;
		int limit=10;
		int listCount;
		if(request.getParameter("page1")!=null){
			page1 = Integer.parseInt(request.getParameter("page1"));
		}
		
		article1 = FlightFilterService.getArticle_fliter_back(departure, arrive, people, seat, arrivalday , startleftval1 , startrightval1 , startleftval2 , startrightval2 ,  page1, limit, arr);
		listCount=FlightFilterService.getListCountFilter_back(departure, arrive, people, seat, arrivalday, startleftval1 , startrightval1 , startleftval2 , startrightval2 , arr);

  		int maxPage=(int)((double)listCount/limit+0.95);
  		// 10 / 10+0.95  1蹂대떎 �빟媛꾪겮 
  		int startPage = (((int) ((double)page1 / 10 + 0.9)) - 1) * 10 + 1;
  		
  	    int endPage = startPage+10-1;

  		if (endPage> maxPage) endPage= maxPage;

  		PageInfo pageInfo = new PageInfo();
  		pageInfo.setEndPage(endPage);
  		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page1);
		pageInfo.setStartPage(startPage);	
	
		request.setAttribute("ticketBeanList1_filter", article1);
		request.setAttribute("pageInfo1_filter", pageInfo);
		ActionForward forward = new ActionForward();	
 		forward.setPath("/flight/ticket_filterlist_back.jsp");
 		
 		return forward;

	 }
}
