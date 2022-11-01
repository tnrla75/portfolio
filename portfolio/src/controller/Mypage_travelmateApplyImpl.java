package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MypageModel;
import vo.PageInfo;
import vo.Mypage_ReviewPage;
import vo.Mypage_travelmateapply;

public class Mypage_travelmateApplyImpl implements MypageCommandInter {
	static Mypage_travelmateApplyImpl impl = new Mypage_travelmateApplyImpl();
	
	
	public static Mypage_travelmateApplyImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
		String mb_id = request.getParameter("mb_id");
		

		Mypage_ReviewPage reviewpage = new Mypage_ReviewPage();
		reviewpage.setMb_id(mb_id);
		ArrayList<Mypage_travelmateapply> list2 = (ArrayList<Mypage_travelmateapply>) model.select_travelapply2(reviewpage);
		ArrayList<Mypage_travelmateapply> list1 = (ArrayList<Mypage_travelmateapply>) model.select_travelapply1(reviewpage);
		
	
		request.setAttribute("travelmate_apply2", list2);
		request.setAttribute("travelmate_apply1", list1);
		//controller
		return "/overlap/mypage_travelApply.jsp";
	}
}
