package action;

import java.util.ArrayList;
import java.util.TreeMap;

import javax.servlet.SessionTrackingMode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*import javax.websocket.Session;*/

import svc.Hotel_RoomService;
import svc.Hotel_YoyakuService;
import vo.ActionForward;
import vo.Hotel_main_DTO;
import vo.Hotel_review_DTO;
import vo.Hotel_room_DTO;
import vo.Hotel_yoyaku_DTO;
import vo.Member_info;
import vo.PageInfo;

public class Hotel_YoyakuAction implements Action {
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		request.setCharacterEncoding("UTF-8");
		
		
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>> 예약 엑션 들어옴");
		
		int hot_main_num=Integer.parseInt(request.getParameter("hot_main_num"));
		int hot_room_num=Integer.parseInt(request.getParameter("hot_room_num"));
		
		String mb_id =request.getParameter("mb_id"); 
		String hot_checkin_date =request.getParameter("hot_checkin_date"); 
		String hot_checkout_date =request.getParameter("hot_checkout_date"); 
					
		Hotel_YoyakuService hotel_YoyakuService = new Hotel_YoyakuService();
		ActionForward forward= new ActionForward();
		
		Hotel_room_DTO yoyakuDate =new Hotel_room_DTO();	
		
		yoyakuDate.setHot_room_num(hot_room_num);
		yoyakuDate.setHot_checkin_date(hot_checkin_date);
		yoyakuDate.setHot_checkout_date(hot_checkout_date);
		
		
		Boolean a= hotel_YoyakuService.yoyakuDate(yoyakuDate);

		System.out.println(yoyakuDate+" : 데이트엑션 yoyakuDate");	
		System.out.println(hot_checkin_date+" : 데이트엑션 hot_checkin_date");		
		System.out.println(hot_checkout_date+" : 데이트엑션 hot_checkout_date");		
		System.out.println(hot_main_num+" : 데이트엑션 hot_main_num");		
		System.out.println(hot_room_num+" : 데이트엑션 hot_room_num");		
		
		request.setAttribute("hot_main_num", hot_main_num);
		request.setAttribute("hot_room_num", hot_room_num);		
		
		request.setAttribute("hot_checkin_date", hot_checkin_date);
		request.setAttribute("hot_checkout_date", hot_checkout_date);	
		
		request.setAttribute("yoyakuDate", yoyakuDate);
		
		if(a){
			ArrayList<Hotel_main_DTO> yoyakuMain = hotel_YoyakuService.yoyakuMain(hot_main_num);	
			ArrayList<Member_info> yoyakuList = hotel_YoyakuService.yoyakuList(mb_id);			
			TreeMap<Integer, Hotel_room_DTO> yoyakuRoom = hotel_YoyakuService.yoyakuRoom(hot_room_num);				
			int kanryo_rommcount=Hotel_YoyakuService.kanryo_room(hot_room_num, hot_checkin_date, hot_checkout_date);
			
			System.out.println(mb_id+" : 엑션 mb_id");		
			System.out.println(yoyakuMain+" : 엑션 yoyakuMain");
			System.out.println(yoyakuList+" : 엑션 yoyakuLsit");
			System.out.println(yoyakuRoom+" : 엑션 yoyakuRoom");
			
			
			request.setAttribute("hot_main_num", hot_main_num);
			request.setAttribute("hot_room_num", hot_room_num);	
			
			request.setAttribute("yoyakuMain", yoyakuMain);
			request.setAttribute("yoyakuList", yoyakuList);
			request.setAttribute("yoyakuRoom", yoyakuRoom);
			request.setAttribute("kanryo_rommcount", kanryo_rommcount);
			
			
			forward.setPath("../hotel/hotel_yoyaku_01.jsp");
	   		return forward;
			
		}else {
			forward.setPath("../index.jsp");;
	   		return forward;
		}
		
		
		
//		request.setAttribute("mainList", mainList);
		
	   
	
   		
   		
	 }
}
