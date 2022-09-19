package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TravelattService;
import svc.TravellocalService;
import vo.ActionForward;
import vo.Travelatt;
import vo.Travelattandimg;
import vo.Travelimg;
import vo.Travellocal;

public class TravellocalAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("aa");
		request.setCharacterEncoding("UTF-8");
	ArrayList<Travelattandimg> travelimg=new ArrayList<Travelattandimg>();
	Travellocal travellocal = null;
	String local=request.getParameter("local");
	ActionForward forward= new ActionForward();
	travellocal=TravellocalService.localselect(local);
	travelimg=TravellocalService.Local_att();
	request.setAttribute("travelocal", travellocal);
	request.setAttribute("travelimg", travelimg);
	
	
	if(travellocal==null) {	
		System.out.println("sdklfjsdlkfjsdlkf");
   		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('일치하는 값이 없습니다.');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
	}else{
		forward.setPath("../travel/travellocal.jsp");
	}
	return forward; 
	}
}
	
