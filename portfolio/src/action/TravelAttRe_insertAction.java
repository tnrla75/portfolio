package action;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TravelattRe_insertService;
import vo.ActionForward;
import vo.Travelattre;

public class TravelAttRe_insertAction<ActionForward> implements Action {

	public vo.ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		ActionForward forward=null;
		Travelattre travelattre=null;
		travelattre = new Travelattre();
		travelattre.setAtt_num(Integer.parseInt(request.getParameter("att_num")));
		travelattre.setAtt_reRate(Integer.parseInt(request.getParameter("rate")));
		travelattre.setMb_id(request.getParameter("att_reid"));
		travelattre.setAtt_reContent(request.getParameter("att_content"));
		travelattre.setAtt_reDate(request.getParameter("writedate"));
		String att=request.getParameter("att_name");
		TravelattRe_insertService travelattRe_insertService = new TravelattRe_insertService();
		boolean isWriteSuccess= travelattRe_insertService.registArticle(travelattre);
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = (ActionForward) new vo.ActionForward();
			((vo.ActionForward) forward).setRedirect(true);
			System.out.println(att+"---2"); 
			//String test = new String(att .getBytes("8859_1"), "UTF-8");
			String text = URLDecoder.decode(att, "UTF-8") ;
			//System.out.println(text+"--44");
			((vo.ActionForward) forward).setPath("Attraction.travel?att="+text);
		}

		return (vo.ActionForward) forward;
	}
}
