package action;


import java.util.ArrayList;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.Hotel_MainService;

import vo.ActionForward;
import vo.Hotel_main_DTO;
import vo.Hotel_room_DTO;
import vo.PageInfo;


public class Hotel_MainAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		 	request.setCharacterEncoding("UTF-8"); 
		 	
		 	int page=1;
			int limit=4;
		 	
		 	
		 	Hotel_MainService hotel_mainService = new Hotel_MainService();	
			ArrayList<Hotel_main_DTO> mainList=new ArrayList<Hotel_main_DTO>();
			TreeMap<Integer, Hotel_room_DTO> main_roomList = hotel_mainService.getArticle();	
			
			
//			HttpSession session=request.getSession();
			
			if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			Hotel_MainService hotel_MainService = new Hotel_MainService();
			
			
			mainList=hotel_MainService.mainList(page,limit);
			
			
			int listCount=hotel_MainService.getListCount();
	   		int maxPage=(int)((double)listCount/limit+0.95); 
	   		int startPage = (((int) ((double)page / limit + 0.9)) - 1) * limit + 1;  // 10媛좊뜲 �냼�닽�젏�씠 �솢 �뱾�뼱媛�吏� �씠�빐媛� �븞媛�..
	   	    int endPage = startPage+limit-1;

	   		if (endPage> maxPage) endPage= maxPage;

	   		PageInfo pageInfo = new PageInfo();
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			
			request.setAttribute("pageInfo", pageInfo);
		
			ActionForward forward= new ActionForward();
			request.setAttribute("main_roomList", main_roomList);
			request.setAttribute("mainList", mainList);
			
	   		forward.setPath("../hotel/hotel_main.jsp");
	   		return forward;
	   		
	   		
		 }

}
