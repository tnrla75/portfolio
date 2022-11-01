package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.IndexselectService;
import svc.Travel_tripguideService;
import svc.TravellocalService;
import vo.ActionForward;
import vo.Travellocal;

public class IndexselectAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		ArrayList<Travellocal> travellocal=new ArrayList<Travellocal>();
		travellocal=IndexselectService.indextravel_select();
		request.setAttribute("travellocal", travellocal);
		forward.setPath("index.jsp");
		return forward;
		
	}
}
