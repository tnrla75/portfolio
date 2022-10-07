package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MypageModel;
import vo.Member_info;

public class Mypage_boardUpImpl implements MypageCommandInter {
	static Mypage_boardUpImpl impl = new Mypage_boardUpImpl();
	
	
	public static Mypage_boardUpImpl instance(){
		return impl;
	}
	
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member_info member = null;
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		member = new Member_info();
		
		String mb_id = request.getParameter("mb_id");		
		String mb_passnum = request.getParameter("mb_passnum");
		String mb_exdate = request.getParameter("mb_exdate");
		
		System.out.println(mb_id+"/"+mb_passnum+"/"+mb_exdate+"aaa");

		member.setMb_passnum(mb_passnum);
		member.setMb_exdate(mb_exdate);
		
		MypageModel model = MypageModel.instance();
		int updateMember = model.updatePass(member);
		request.setAttribute("board_update", updateMember);
		
		//controller
		return ("/overlap/boardpass.mypage?command=board&mb_id="+mb_id);
		
	}
}