package action;


import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandInter;
import model.Hotel_mainModel;
import vo.Hotel_yoyaku_DTO;


	public class Hotel_Batis_Yoyaku_InsertAction implements CommandInter{

		static Hotel_Batis_Yoyaku_InsertAction insert = new Hotel_Batis_Yoyaku_InsertAction();
		
		public static Hotel_Batis_Yoyaku_InsertAction instance(){
			return  insert;
		}
	
		@Override
		public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			
			HttpSession session=request.getSession();
			String mb_id=(String)session.getAttribute("mb_id");
			
			
			String main_num=request.getParameter("hot_main_num");
			String room_num=request.getParameter("hot_room_num");
			String room_price=request.getParameter("hot_room_price");
			
			String mb_firstname=request.getParameter("mb_firstname");
			String mb_lastname=request.getParameter("mb_lastname");
			String hot_checkin_date=request.getParameter("hot_checkin_date");
			String hot_checkout_date=request.getParameter("hot_checkout_date");
			String hot_checkin_time=request.getParameter("hot_checkin_time");
			String hot_checkout_time=request.getParameter("hot_checkout_time");
			
			String hot_name=request.getParameter("hot_name");
			String hot_address=request.getParameter("hot_address");
			String hot_room_name=request.getParameter("hot_room_name");		
			
			String mb_phonenum=request.getParameter("mb_phonenum");
			String mb_email=request.getParameter("mb_email");
			String mb_birth=request.getParameter("mb_birth");
			String mb_gender=request.getParameter("mb_gender");
			
			
			
			// date 媛� �삎蹂��솚 ( date濡� 媛� �꽔�쓣 寃쎌슦留� �궗�슜 )
		/*	// Sat Jan 01 00:00:00 KST 2022 �씪怨� �쑉�뒗 Date瑜� yyyy-MM-dd 媛믪쑝濡� 蹂��솚		
			java.util.Date formatterin = new SimpleDateFormat("yyyy-MM-dd").parse(datein);
			java.util.Date formatterout = new SimpleDateFormat("yyyy-MM-dd").parse(dateout);	
			
			// java.util�삎�떇�뿉 Date瑜� java.sql Date濡� 蹂��솚�쑝濡� �삎 蹂��솚.
			Date hot_checkin_date = new Date(formatterin.getTime());
			Date hot_checkout_date = new Date(formatterout.getTime());	
			*/
			
			int hot_main_num =Integer.parseInt(main_num); 
			int hot_room_num =Integer.parseInt(room_num);
			int hot_room_price =Integer.parseInt(room_price);
			
			Hotel_yoyaku_DTO yoyakuList= new Hotel_yoyaku_DTO();
			Hotel_mainModel model = Hotel_mainModel.instance();
			
			yoyakuList.setMb_id(mb_id);
			yoyakuList.setHot_room_num(hot_room_num);
			yoyakuList.setHot_main_num(hot_main_num);
			yoyakuList.setHot_room_price(hot_room_price);
			yoyakuList.setHot_room_amount(1);
			yoyakuList.setHot_name(hot_name);
			yoyakuList.setHot_address(hot_address);
			yoyakuList.setHot_room_name(hot_room_name);
			yoyakuList.setMb_firstname(mb_firstname);
			yoyakuList.setMb_lastname(mb_lastname);
			yoyakuList.setMb_phonenum(mb_phonenum);
			yoyakuList.setMb_email(mb_email);
			yoyakuList.setMb_birth(mb_birth);
			yoyakuList.setMb_gender(mb_gender);
			yoyakuList.setHot_checkin_date(hot_checkin_date);
			yoyakuList.setHot_checkout_date(hot_checkout_date);
			yoyakuList.setHot_checkin_time(hot_checkin_time);
			yoyakuList.setHot_checkout_time(hot_checkout_time);
			
			
			System.out.println(mb_id+" : mb_id �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_main_num+" : main_num �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_room_num+" : room_num �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_room_price+" : hot_room_price �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_name+" : hot_name �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_address+" : hot_address �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_room_name+" : hot_room_name �뿊�뀡 諛뷀떚�뒪 ");
			
			System.out.println(mb_firstname+" : mb_firstname �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(mb_lastname+" : mb_lastname �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(mb_phonenum+" : mb_phonenum �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(mb_email+" : mb_email �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(mb_birth+" : mb_birth �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(mb_gender+" : mb_gender �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_checkin_date+" : hot_checkin_date �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(hot_checkout_date+" : hot_checkout_date �뿊�뀡 諛뷀떚�뒪 ");
			System.out.println(yoyakuList+" : yoyakuList �뿊�뀡 諛뷀떚�뒪 ");
			
			
			model.insertYoyaku(yoyakuList);
			
//			List<String> a = new ArrayList<String>();
//			java.util.Collections.sort(a);
			return "kanryoList.hot?command=kanryoList";
		}
}

