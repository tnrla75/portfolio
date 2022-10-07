package controller;
import java.io.IOException;



import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import controller.Insert_action;



public class Hotel_batis_Controller extends HttpServlet{

	@Override
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		CommandInter inter = null;
		String viewName = "";
		
		String hot_room_num=request.getParameter("hot_room_num");
		System.out.println(hot_room_num+" : 而⑦듃濡� hot_room_num");
		System.out.println(command+" : 而⑦듃濡� command");
		
		try { // insert
			if(command.equals("yoyaku")) {
				inter = Insert_action.instance();  //而⑦듃濡ㅻ윭瑜� �뜲由ш퀬 媛�寃껊떎~ 
				System.out.println(hot_room_num+" : 而⑦듃濡� hot_room_num");
				viewName = inter.showData(request, response);
				System.out.println(command+" : 而⑦듃濡� command");
//				viewName = "view/"+viewName;  // view�씪�뒗 �뤃�뜑 �븞�뿉 二쇱냼瑜� �꽔�뼱�몺 (�븞�꽔�뼱�룄 �긽愿� �뾾�쓬).
				request.getRequestDispatcher(viewName).forward(request, response);
			} /*else if(command.equals("sangpum")) { // delete
				inter = Insert_action.instance();  //而⑦듃濡ㅻ윭瑜� �뜲由ш퀬 媛�寃껊떎~ 
				viewName = inter.showData(request, response);
				viewName = "view/"+viewName;  // view�씪�뒗 �뤃�뜑 �븞�뿉 二쇱냼瑜� �꽔�뼱�몺 (�븞�꽔�뼱�룄 �긽愿� �뾾�쓬).
				request.getRequestDispatcher(viewName).forward(request, response);
			} */else {
				viewName = "error.html";
				response.sendRedirect(viewName);
			}
		}catch (Exception e) {
			System.out.println(e+" : �뿬湲� null ??");
			
			
		}
	}
}







