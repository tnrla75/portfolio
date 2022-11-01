/*
package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.Hotel_YoyakuService;
import vo.ActionForward;
import vo.Hotel_room_DTO;

public class Hotel_Yoyaku_DateAction implements Action {
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		request.setCharacterEncoding("UTF-8");

		
		int hot_main_num=Integer.parseInt(request.getParameter("hot_main_num"));
		int hot_room_num=Integer.parseInt(request.getParameter("hot_room_num"));
		
		
		
		String hot_checkin_date = request.getParameter("hot_checkin_date"); 
		String hot_checkout_date = request.getParameter("hot_checkout_date"); 
		
		
		// Sat Jan 01 00:00:00 KST 2022 라고 뜨는 Date를 yyyy-MM-dd 값으로 변환		
		java.util.Date formatterin = new SimpleDateFormat("yyyy-MM-dd").parse(datein);
		java.util.Date formatterout = new SimpleDateFormat("yyyy-MM-dd").parse(dateout);	
		
		// java.util형식에 Date를 java.sql Date로 변환으로 형 변환.
		Date hot_checkin_date = new Date(formatterin.getTime());
		Date hot_checkout_date = new Date(formatterout.getTime());	
		
		Hotel_YoyakuService hotel_YoyakuService = new Hotel_YoyakuService();
	
		Hotel_room_DTO yoyakuDate =new Hotel_room_DTO();		 
		yoyakuDate.setHot_room_num(hot_room_num);
		yoyakuDate.setHot_checkin_date(hot_checkin_date);
		yoyakuDate.setHot_checkout_date(hot_checkout_date);
		hotel_YoyakuService.yoyakuDate(yoyakuDate);
		
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
		
		ActionForward forward= new ActionForward();
		
//		request.setAttribute("mainList", mainList);
		
	   
		forward.setPath("../hotel/hotelYoyakuForm.ho?");
   		return forward;
	
   		
   		
   		
	 }

}
*/