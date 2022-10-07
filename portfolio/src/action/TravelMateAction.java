package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TravelMateService;
import travel_package.MateDTO;
import vo.ActionForward;
import vo.PageInfo;

public class TravelMateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		TravelMateService mc = new TravelMateService();
		
		int page=1;
		int limit=10;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		int listCount= TravelMateService.getListCount();
		int maxPage=(int)((double)listCount/limit+0.95);                                   
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;                   
   	    int endPage = startPage+10-1;                                                   
   		if (endPage> maxPage) endPage= maxPage;
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		
		ArrayList<MateDTO> customer = mc.travelmate(page, limit);
		request.setAttribute("customer", customer);
		forward.setPath("../travel/travel_mate.jsp");
		return forward;
	}

}
