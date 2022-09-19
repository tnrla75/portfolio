package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TravelAttRe_deleteService;
import vo.ActionForward;

public class TravelAttRe_deleteAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		int att_reNum=Integer.parseInt(request.getParameter("renum"));
		String att=request.getParameter("att");
		TravelAttRe_deleteService redelete = new TravelAttRe_deleteService();
		boolean isArticleWriter= redelete.removeArticle(att_reNum);
		
		if(!isArticleWriter){
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
			forward.setPath("Attraction.travel?att="+att);
		}
		return forward;
	}

}
