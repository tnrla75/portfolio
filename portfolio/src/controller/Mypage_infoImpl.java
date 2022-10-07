package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MypageModel;
import vo.Member_info;

public class Mypage_infoImpl implements MypageCommandInter {
	static Mypage_infoImpl impl = new Mypage_infoImpl();
	
	
	public static Mypage_infoImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
		String mb_id = request.getParameter("mb_id");
		
		Member_info member = (Member_info) model.selectMember(mb_id);
		request.setAttribute("member", member);
		//controller
		return "../overlap/mypage_info.jsp";
	}
}
