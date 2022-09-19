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
		System.out.println("==bb");
		String arr = request.getParameter("arr");
		
		int page1=1;
		int limit=10;
		int listCount;
		if(request.getParameter("page1")!=null){
			page1 = Integer.parseInt(request.getParameter("page1"));
		}
		System.out.println("==cc");
//		泥댄겕諛뺤뒪瑜� 泥댄겕�뻽�쓣 寃쎌슦
		if(arr!=null) {
			article1 = FlightListService.getArticle_fliter(departure, arrive, people, seat, departureday , page1, limit, arr);
			listCount=FlightListService.getListCountFilter(departure, arrive, people, seat, departureday, arr);
		}
// 		泥댄겕諛뺤뒪瑜� 泥댄겕�븞�뻽�쓣 寃쎌슦
		else {
			article1 = FlightListService.getArticle_go(departure, arrive, people, seat, departureday , page1, limit);
			listCount=FlightListService.getListCount(departure, arrive, people, seat, departureday);
		}

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
	
		
		request.setAttribute("ticketBeanList1", article1);
		request.setAttribute("pageInfo1", pageInfo);
		ActionForward forward = new ActionForward();	
		
  		forward.setPath("/flight/flightpage_go.jsp");
  		
  		return forward;

	 }
}
