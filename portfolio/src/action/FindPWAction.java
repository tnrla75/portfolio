package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import controller.MypageCommandInter;
import svc.FindIDService;
import svc.FindPWService;
import vo.Member_info;

public class FindPWAction implements CommandInter, MypageCommandInter{

	static FindPWAction impl2 = new FindPWAction();

	public static FindPWAction instance(){
		return impl2;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member_info memberinfo = null;
		memberinfo = new Member_info();
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String a = email1 + "@" + email2;
		memberinfo.setMb_email(a);
		memberinfo.setMb_name(request.getParameter("name"));
		memberinfo.setMb_id(request.getParameter("id"));
		FindPWService select = FindPWService.instance();
		Member_info list = new Member_info();
		list = select.selectpw(memberinfo);
		request.setAttribute("list", list);	
		return "../overlap/findPW_result.jsp";
	}
}
