package action;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import model.Hotel_mainModel;
import vo.Hotel_main_DTO;
import vo.Hotel_room_DTO;
import vo.PageInfo;



public class Hotel_Batis_MainKensakuAction implements CommandInter {
static Hotel_Batis_MainKensakuAction mainKensakuList = new Hotel_Batis_MainKensakuAction();
	
	public static Hotel_Batis_MainKensakuAction instance(){
		return mainKensakuList;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Hotel_mainModel model = Hotel_mainModel.instance();
		TreeMap<Integer, Hotel_room_DTO> kensakuPrice = (TreeMap<Integer, Hotel_room_DTO>) model.kensakuPrice();
		Hotel_main_DTO hotel_main_DTO = new Hotel_main_DTO();
		
	 	int page=1;
		int limit=4;
	 	
		System.out.println(">>>>>>>>>>>>�셿猷� �뿊�뀡 �뱶�윭�샂 1");
		int startrow=(page-1)*4;  

		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		// getParamer濡� 諛쏆븘�삤湲�.
		
		String hot_nation=request.getParameter("hot_nation");			
		String room_maxpeople=request.getParameter("hot_room_maxpeople");		      
		int hot_room_maxpeople =Integer.parseInt(room_maxpeople);	
		
		
		System.out.println(">>>>>>>>>>>>寃��깋 �뿊�뀡 �뱶�윭�샂 2");
		
		
		// String
		String datein=request.getParameter("hot_checkin_date");
		String dateout=request.getParameter("hot_checkout_date");
		
		// Sat Jan 01 00:00:00 KST 2022 �씪怨� �쑉�뒗 Date瑜� yyyy-MM-dd 媛믪쑝濡� 蹂��솚		
		java.util.Date formatterin = new SimpleDateFormat("yyyy-MM-dd").parse(datein);
		java.util.Date formatterout = new SimpleDateFormat("yyyy-MM-dd").parse(dateout);	
		
		// java.util�삎�떇�뿉 Date瑜� java.sql Date濡� 蹂��솚�쑝濡� �삎 蹂��솚.
		Date hot_checkin_date = new Date(formatterin.getTime());
		Date hot_checkout_date = new Date(formatterout.getTime());		
		
		// 媛믩뱾�쓣 DTO�뿉 ���옣
		hotel_main_DTO.setHot_checkin_date(hot_checkin_date);
		hotel_main_DTO.setHot_checkout_date(hot_checkout_date);
		hotel_main_DTO.setHot_room_maxpeople(hot_room_maxpeople);
		hotel_main_DTO.setHot_nation(hot_nation);
		hotel_main_DTO.setStartrow(startrow);
		
		System.out.println(hot_nation+" : �뿊�뀡 諛뷀떚�뒪 硫붿씤 hot_nation");
		System.out.println(hot_room_maxpeople+" : �뿊�뀡 諛뷀떚�뒪 硫붿씤 hot_room_people");
		System.out.println(hot_checkin_date+" �뿊�뀡 諛뷀떚�뒪 硫붿씤 �궇吏� �솗�씤 hot_checkin_date ");
		System.out.println(hot_checkout_date+" : �뿊�뀡 諛뷀떚�뒪 硫붿씤 hot_checkout_date");
		
		List<Hotel_main_DTO> kensakuList =(List<Hotel_main_DTO>)model.kensakuSelect(hotel_main_DTO);
		int listCount=Hotel_mainModel.getListCount();
   		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / limit + 0.9)) - 1) * limit + 1;  
   	    int endPage = startPage+limit-1;
		if (endPage> maxPage) endPage= maxPage;
		
   	    PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);   	    
		
	
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("main_roomList", kensakuPrice);
		request.setAttribute("mainList", kensakuList);
		
		System.out.println(pageInfo+" �뿊�뀡 諛뷀떚�뒪 �럹�씠吏� pageInfo");
		System.out.println(kensakuPrice+" : �뿊�뀡 諛뷀떚�뒪 硫붿씤 kensakuPrice");
		System.out.println(kensakuList+" : �뿊�뀡 諛뷀떚�뒪 硫붿씤 kensaku");
		
		
//		List<String> a = new ArrayList<String>();
//		java.util.Collections.sort(a);
		return "../hotel/hotel_main.jsp";
	}
}
