package action;

import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TravelattRe_updateService;
import vo.ActionForward;
import vo.Travelattre;

public class TravelAttRe_updateAction implements Action {
	public vo.ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("UTF-8");
		ActionForward forward=null;
		Travelattre travelattre=null;
		travelattre = new Travelattre();
		travelattre.setAtt_reNum(Integer.parseInt(request.getParameter("re_num")));
		travelattre.setAtt_reRate(Integer.parseInt(request.getParameter("rate")));
		travelattre.setAtt_reContent(request.getParameter("att_content"));
		String att=request.getParameter("att_name");
		TravelattRe_updateService travelattRe_updateService = new TravelattRe_updateService();
		boolean isWriteSuccess= travelattRe_updateService.registArticle(travelattre);
		System.out.println(isWriteSuccess);
		
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			System.out.println(att+"---2"); 
			//String test = new String(att .getBytes("8859_1"), "UTF-8");
			String text = URLDecoder.decode(att, "UTF-8") ;
			//System.out.println(text+"--44");
			forward.setPath("Attraction.travel?att="+text);
		}

		
		return forward;
		
	}
}
