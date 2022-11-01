package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MypageModel;
import vo.Mypage_travelmateapply;


public class Mypage_travelmateApplyupdateImpl implements MypageCommandInter {
	static Mypage_travelmateApplyupdateImpl impl = new Mypage_travelmateApplyupdateImpl();
	
	
	public static Mypage_travelmateApplyupdateImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
		String status = request.getParameter("status");
		String mb_id = request.getParameter("mb_id");
		int applynum = Integer.parseInt(request.getParameter("applynum"));
		
		Mypage_travelmateapply updatestatus = new Mypage_travelmateapply();
		updatestatus.setMb_id(mb_id);
		updatestatus.setApply_num(applynum);
		updatestatus.setStatus(status);
		 model.travelmateApplyupdate(updatestatus);

		//controller
		return "mypage_mateapply.mypage?command=travel_mateApply&mb_id="+ mb_id;
	}
}
