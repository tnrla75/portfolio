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

public class Hotel_NationAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
	 	request.setCharacterEncoding("UTF-8"); 
	 	
	 	int page=1;
		int limit=4;
	 	
		String hot_nation=request.getParameter("hot_nation");
		
	 	Hotel_MainService hotel_mainService = new Hotel_MainService();	
		
		TreeMap<Integer, Hotel_room_DTO> main_roomList = hotel_mainService.getArticle();	
		ArrayList<Hotel_main_DTO> ajaxList=new ArrayList<Hotel_main_DTO>();
		
//		HttpSession session=request.getSession();
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		Hotel_MainService hotel_MainService = new Hotel_MainService();
		
		ajaxList=hotel_MainService.nationList(page,limit,hot_nation);
		
		System.out.println(ajaxList+" : 엑션 nationList");
		System.out.println("엑션 hot_nation >>> " + hot_nation);
		
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
		request.setAttribute("main_roomList", main_roomList);		
		request.setAttribute("ajaxList", ajaxList);
		
		ActionForward forward= new ActionForward();
		
   		forward.setPath("hotel_main_ajaxView.jsp");
   		return forward;
   		
   		
	 }
}
