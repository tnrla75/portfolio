package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import controller.MypageCommandInter;
import svc.ChangePWService;
import vo.Member_info;

public class ChangePWAction implements CommandInter, MypageCommandInter{

	static ChangePWAction impl = new ChangePWAction();

	public static ChangePWAction instance(){
		return impl;
	}

	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member_info memberinfo = null;
		memberinfo = new Member_info();
		String id = request.getParameter("id");
		memberinfo.setMb_pw(request.getParameter("pw"));
		memberinfo.setMb_id(id);
		ChangePWService update = ChangePWService.instance();
		request.setAttribute("id", id);	
		update.updatePW(memberinfo);
		return "../overlap/changePW_result.jsp";
	}
}