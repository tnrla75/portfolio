package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Hotel_Batis_Yoyaku_InsertAction;
import action.Hotel_Batis_KanryoAcion;
import action.Hotel_Batis_MainKensakuAction;
import action.Hotel_QnaAction;
import controller.CommandInter;



public class Hotel_batis_Controller extends HttpServlet{

	@Override
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String command = request.getParameter("command");
		CommandInter inter = null;
		String viewName = "";
		
		System.out.println(command+" : 컨트롤 command");
		
		try { // insert
			if(command.equals("yoyakuInsert")) {	
				String hot_room_num=request.getParameter("hot_room_num");		
				String hot_main_num=request.getParameter("hot_main_num");
				String hot_name=request.getParameter("hot_name");
				String hot_address=request.getParameter("hot_address");
				String hot_room_name=request.getParameter("hot_room_name");
				String hot_room_price=request.getParameter("hot_room_price");
				String mb_firstname=request.getParameter("mb_firstname");
				String mb_lastname=request.getParameter("mb_lastname");
				String mb_phonenum=request.getParameter("mb_phonenum");
				String mb_email=request.getParameter("mb_email");
				String mb_birth=request.getParameter("mb_birth");
				String mb_gender=request.getParameter("mb_gender");
				String hot_checkin_date=request.getParameter("hot_checkin_date");
				String hot_checkout_date=request.getParameter("hot_checkout_date");
				String hot_checkin_time=request.getParameter("hot_checkin_time");
				String hot_checkout_time=request.getParameter("hot_checkout_time");
				inter = Hotel_Batis_Yoyaku_InsertAction.instance();  //컨트롤러를 데리고 가것다~ 
				
				
				viewName = inter.showData(request, response);
				
			
//				viewName = "view/"+viewName;  // view라는 폴더 안에 주소를 넣어둠 (안넣어도 상관 없음).
				request.getRequestDispatcher(viewName).forward(request, response);
			}else
				
				// 예약 select
			if(command.equals("kanryoList")) {
				
				String hot_room_num=request.getParameter("hot_room_num");		
				String hot_main_num=request.getParameter("hot_main_num");
				String hot_room_price=request.getParameter("hot_room_price");
				
				System.out.println(hot_room_num+" : 완료컨트롤 hot_room_num");
				System.out.println(hot_main_num+" : 완료컨트롤 hot_main_num");
				System.out.println(hot_room_price+" : 완료컨트롤 hot_room_price");
				System.out.println(command+" : 완료컨트롤 들어옴");
				inter = Hotel_Batis_KanryoAcion.instance();  //컨트롤러를 데리고 가것다~ 				
				viewName = inter.showData(request, response);
				
				System.out.println(command+" : 완료컨트롤 command");
//				viewName = "view/"+viewName;  // view라는 폴더 안에 주소를 넣어둠 (안넣어도 상관 없음).
				request.getRequestDispatcher(viewName).forward(request, response);
			}else 	
					// index 검색 select
				if(command.equals("kensakuList")) {
					
					String hot_nation=request.getParameter("hot_nation");		
					String hot_room_people=request.getParameter("hot_room_maxpeople");
					String hot_checkin_date=request.getParameter("hot_checkin_date");
					String hot_checkout_date=request.getParameter("hot_checkout_date");
					
					System.out.println(hot_nation+" : 완료컨트롤 hot_nation");
					System.out.println(hot_room_people+" : 완료컨트롤 hot_room_people");
					System.out.println(hot_checkin_date+" : 완료컨트롤 hot_checkin_date");
					System.out.println(hot_checkout_date+" : 완료컨트롤 hot_checkout_date");
					
					System.out.println(command+" : 완료컨트롤 들어옴");
					inter = Hotel_Batis_MainKensakuAction.instance();  //컨트롤러를 데리고 가것다~ 				
					viewName = inter.showData(request, response);
					
					System.out.println(command+" : 완료컨트롤 command");
//					viewName = "view/"+viewName;  // view라는 폴더 안에 주소를 넣어둠 (안넣어도 상관 없음).
					request.getRequestDispatcher(viewName).forward(request, response);
				}else 
				
				// 문의 게시판 select
			if(command.equals("qnaList")) {
				System.out.println(command+" : 게시판 컨트롤 들어옴");
				inter = Hotel_QnaAction.instance();  //컨트롤러를 데리고 가것다~ 				
				viewName = inter.showData(request, response);
				
				System.out.println(command+" : 게시판 컨트롤 hot_qna command");
//				viewName = "view/"+viewName;  // view라는 폴더 안에 주소를 넣어둠 (안넣어도 상관 없음).
				request.getRequestDispatcher(viewName).forward(request, response);
			}/*else 
			if(command.equals("sawon")){ // select
				inter = SawonImpl.instance();
				viewName = inter.mainData(request, response);
//				viewName = "view/"+viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}else 
			if(command.equals("sangpum")) { // delete
				inter = Insert_action.instance();  //컨트롤러를 데리고 가것다~ 
				viewName = inter.showData(request, response);
				viewName = "view/"+viewName;  // view라는 폴더 안에 주소를 넣어둠 (안넣어도 상관 없음).
				request.getRequestDispatcher(viewName).forward(request, response);
			} */else {
				viewName = "error.html";
				response.sendRedirect(viewName);
			}
		}catch (Exception e) {
			System.out.println(e+" : 컨트롤 null 값임");
			
			
		}
	}
}







