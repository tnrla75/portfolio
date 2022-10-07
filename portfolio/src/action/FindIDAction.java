package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import controller.MypageCommandInter;
import vo.Member_info;
import svc.FindIDService;;

public class FindIDAction implements CommandInter, MypageCommandInter{

	static FindIDAction impl = new FindIDAction();

	public static FindIDAction instance(){
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String b = null;
		Member_info memberinfo = null;
		memberinfo = new Member_info();
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String a = email1 + "@" + email2;
		memberinfo.setMb_email(a);
		memberinfo.setMb_name(request.getParameter("name"));
		FindIDService select = FindIDService.instance();
		Member_info list = new Member_info();
		list = select.selectid(memberinfo);
		request.setAttribute("list", list);	
		
		return "../overlap/findID_result.jsp";
	}
}