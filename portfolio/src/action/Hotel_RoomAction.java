package action;


import java.util.ArrayList;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Hotel_MainService;
import svc.Hotel_RoomService;
import vo.ActionForward;
import vo.Hotel_main_DTO;
import vo.Hotel_review_DTO;
import vo.Hotel_room_DTO;
import vo.PageInfo;

public class Hotel_RoomAction implements Action {
	
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		request.setCharacterEncoding("UTF-8");
//		媛앹떎�젙蹂� 諛� 由щ럭�젙蹂�
		
//		int hot_room_num=Integer.parseInt(request.getParameter("hot_room_num"));
		int hot_main_num=Integer.parseInt(request.getParameter("hot_main_num"));		
		
//		HttpRequest request=request.getParameter();
		
		Hotel_RoomService hotel_RoomService = new Hotel_RoomService();	
		
		
		ArrayList<Hotel_room_DTO> roomList = hotel_RoomService.getArticle(hot_main_num);	
		
		ArrayList<Hotel_main_DTO> mainList = hotel_RoomService.jjinmainService(hot_main_num);
		
		ActionForward forward_hotel = new ActionForward();
		
		
		
		
		
//		 �샇�뀛 �젙蹂� 媛��졇�삩 怨�
		ArrayList<Hotel_review_DTO> reviewList=new ArrayList<Hotel_review_DTO>();

		int page=1;
		int limit=4;
		
//		HttpSession session=request.getSession();
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount=hotel_RoomService.reviewListCount(hot_main_num);
		reviewList=hotel_RoomService.reviewList(hot_main_num,page,limit);
		
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
		
		System.out.println(roomList+" : 엑션 roomList");
		System.out.println(hot_main_num+" : 엑션 hot_main_num");
		System.out.println(mainList+" : 엑션 mainList");
		
		request.setAttribute("hot_main_num", hot_main_num);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("roomList", roomList);

		request.setAttribute("pageInfo", pageInfo);
	
		ActionForward forward= new ActionForward();
		
		request.setAttribute("mainList", mainList);
		
	   
		forward_hotel.setPath("../hotel/hotel_room.jsp");
   		return forward_hotel;
	
   		
   		
	 }
}
