package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MypageModel;
import vo.Member_info;

public class Mypage_boardImpl implements MypageCommandInter {
	static Mypage_boardImpl impl = new Mypage_boardImpl();
	
	
	public static Mypage_boardImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
		String mb_id = request.getParameter("mb_id");
		System.out.println(mb_id);
		
		Member_info member = (Member_info) model.selectMember(mb_id);
		request.setAttribute("member", member);
		//controller
		return ("/overlap/mypage_boardPass.jsp");
	}
	
}
