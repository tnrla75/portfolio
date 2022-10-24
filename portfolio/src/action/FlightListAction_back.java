package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.FlightListService;
import vo.ActionForward;
import vo.FlightTicketBean;
import vo.PageInfo;

public class FlightListAction_back implements Action{
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		
		 ArrayList<FlightTicketBean> article1 =new ArrayList<FlightTicketBean>();
		 
		String departure = request.getParameter("departure1");
		String arrive =  request.getParameter("arrive1");
		String people =request.getParameter("flight_people1");
		String seat = request.getParameter("seatGrade1");
		String arrivalday = request.getParameter("arrivalDay1");
		String departureday = request.getParameter("departureDay1");
		String totalprice = request.getParameter("totalprice");
		System.out.println(arrivalday + " / " + departureday);
		FlightListService FlightListService = new FlightListService();
		/*BoardBean article = boardDetailService.getArticle(board_num);*/
		int page2=1;
		int limit=10;
		if(request.getParameter("page2")!=null){
			page2=Integer.parseInt(request.getParameter("page2"));
		}
		
		
		
		
		
		// 전체 글 개수
		article1 = FlightListService.getArticle_back(arrive, departure,  people, seat, arrivalday , page2, limit);
		int listCount=FlightListService.getListCount(arrive, departure,  people, seat, arrivalday);
		
  		int maxPage=(int)((double)listCount/limit+0.95);
  		// 10 / 10+0.95  1보다 약간큼 
  		int startPage = (((int) ((double)page2 / 10 + 0.9)) - 1) * 10 + 1;
  		
  	    int endPage = startPage+10-1;

  		if (endPage> maxPage) endPage= maxPage;

  		PageInfo pageInfo = new PageInfo();
  		pageInfo.setEndPage(endPage);
  		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page2);
		pageInfo.setStartPage(startPage);	
	
		
		request.setAttribute("ticketBeanList2", article1);
		request.setAttribute("pageInfo2", pageInfo);
		ActionForward forward = new ActionForward();	   
		
 		forward.setPath("/flight/flightpage_back.jsp");
 		
 		return forward;

	 }
}
