package action;

import java.util.ArrayList;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.Hotel_RoomService;
import svc.Hotel_YoyakuService;
import vo.ActionForward;
import vo.Hotel_main_DTO;
import vo.Hotel_review_DTO;
import vo.Hotel_room_DTO;
import vo.Member_info;
import vo.PageInfo;

public class Hotel_YoyakuAction implements Action {
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		request.setCharacterEncoding("UTF-8");
		
				
		int hot_main_num=Integer.parseInt(request.getParameter("hot_main_num"));
		int hot_room_num=Integer.parseInt(request.getParameter("hot_room_num"));
		String mb_id = request.getParameter("mb_id"); 
		
		Hotel_YoyakuService hotel_YoyakuService = new Hotel_YoyakuService();
		
		ArrayList<Hotel_main_DTO> yoyakuMain = hotel_YoyakuService.yoyakuMain(hot_main_num);	
		ArrayList<Member_info> yoyakuList = hotel_YoyakuService.yoyakuList(mb_id);
		TreeMap<Integer, Hotel_room_DTO> yoyakuRoom = hotel_YoyakuService.yoyakuRoom(hot_room_num);	
		
		System.out.println(mb_id+" : �뿊�뀡 mb_id");		
		System.out.println(yoyakuMain+" : �뿊�뀡 yoyakuMain");
		System.out.println(yoyakuList+" : �뿊�뀡 yoyakuLsit");
		System.out.println(yoyakuRoom+" : �뿊�뀡 yoyakuRoom");
		
		request.setAttribute("hot_main_num", hot_main_num);
		request.setAttribute("hot_room_num", hot_room_num);		
		
		request.setAttribute("yoyakuMain", yoyakuMain);
		request.setAttribute("yoyakuList", yoyakuList);
		request.setAttribute("yoyakuRoom", yoyakuRoom);
		
		ActionForward forward= new ActionForward();
		
//		request.setAttribute("mainList", mainList);
		
	   
		forward.setPath("../hotel/hotel_batis_yoyaku_01.jsp");
   		return forward;
	
   		
   		
	 }
}
