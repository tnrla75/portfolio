package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Travel_tripguideService;
import vo.ActionForward;
import vo.Hotel_main_DTO;
import vo.Travellocal;

public class Travel_tripguideAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		ArrayList<Travellocal> travellocal=new ArrayList<Travellocal>();
		ArrayList<Hotel_main_DTO> hotel=new ArrayList<Hotel_main_DTO>();
		travellocal=Travel_tripguideService.tripguide_select();
		hotel=Travel_tripguideService.tripguide_hotel_select();
		request.setAttribute("travellocal", travellocal);
		request.setAttribute("hotel", hotel);
		forward.setPath("tripguideselect.travel");
		return forward;
		
	}
}
