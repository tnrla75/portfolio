package action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TravelattRe_insertService;
import vo.ActionForward;
import vo.Travelattre;

public class TravelAttRe_insertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ActionForward forward = null;
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
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('fail');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			String encodedParam = URLEncoder.encode(att, "UTF-8");
			forward.setPath("Attraction.travel?att="+encodedParam);
		}
		return forward;
	}

}
