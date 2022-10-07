package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Insert_Model;
import model.SawonModel;

import vo.Hotel_yoyaku_DTO;


	public class Insert_action implements CommandInter{

		static Insert_action insert = new Insert_action();
		
		public static Insert_action instance(){
			return  insert;
		}
	
		
		@Override
		public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			
			HttpSession session=request.getSession();
			String mb_id=(String)session.getAttribute("mb_id");
			
			String main_num=request.getParameter("hot_main_num");
			String room_num=request.getParameter("hot_room_num");
			
			int hot_main_num =Integer.parseInt(main_num); 
			int hot_room_num =Integer.parseInt(room_num); 
			
			Hotel_yoyaku_DTO list=new Hotel_yoyaku_DTO();
			
			list.setMb_id(mb_id);;
			list.setHot_main_num(hot_main_num);
			list.setHot_room_num(hot_room_num);
			
			System.out.println(mb_id+" : insert �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_main_num+" : main_num �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_room_num+" : room_num �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(list+" : list �뿊�뀡 諛뷀떚�뒪 ");
			Insert_Model model = Insert_Model.instance();
			model.insertYoyaku(list);
//			List<String> a = new ArrayList<String>();
//			java.util.Collections.sort(a);
			return "../hotel/hotel_batis_kanryo.jsp";
		}
}

