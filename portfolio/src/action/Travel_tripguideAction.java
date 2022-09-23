package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.Travel_tripguideService;
import svc.TravellocalService;
import vo.ActionForward;
import vo.Travellocal;

public class Travel_tripguideAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		ArrayList<Travellocal> travellocal=new ArrayList<Travellocal>();
		travellocal=Travel_tripguideService.tripguide_select();
		request.setAttribute("travellocal", travellocal);
		System.out.println(travellocal+"--2");
		forward.setPath("tripguideselect.travel");
		return forward;
		
	}
}
