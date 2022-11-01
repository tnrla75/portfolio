package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MypageModel;


public class Mypage_travelmateApplydeleteImpl implements MypageCommandInter {
	static Mypage_travelmateApplydeleteImpl impl = new Mypage_travelmateApplydeleteImpl();
	
	
	public static Mypage_travelmateApplydeleteImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
		String applynum = request.getParameter("applynum");
		String mb_id = request.getParameter("mb_id");
		 model.travelmateApplydelete(applynum);

		//controller
		return "mypage_mateapply.mypage?command=travel_mateApply&mb_id="+ mb_id;
	}
}
