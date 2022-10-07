package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MypageModel;
import vo.Member_info;

public class Mypage_infoUpImpl implements MypageCommandInter {
	static Mypage_infoUpImpl impl = new Mypage_infoUpImpl();
	
	
	public static Mypage_infoUpImpl instance(){
		return impl;
	}
	
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member_info member = null;
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		member = new Member_info();
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		String mb_name = request.getParameter("mb_name");
		String mb_email = request.getParameter("mb_email");
		String mb_address = request.getParameter("mb_address");
		String mb_detailaddress = request.getParameter("mb_detailaddress");
		String mb_phonenum1 = request.getParameter("mb_phonenum1");
		String mb_phonenum2 = request.getParameter("mb_phonenum2");
		String mb_gender = request.getParameter("mb_gender");


		String mb_phonenum = mb_phonenum1+mb_phonenum2;

		System.out.println(mb_id+"/"+mb_pw+"/"+mb_name+"/"+mb_phonenum1);
		member.setMb_id(mb_id);
		member.setMb_pw(mb_pw);
		member.setMb_address(mb_address);
		member.setMb_detailaddress(mb_detailaddress);
		member.setMb_phonenum(mb_phonenum);
		member.setMb_gender(mb_gender);
		
		MypageModel model = MypageModel.instance();
		model.updateMember(member);

		//controller
		return ("/overlap/info.mypage?command=info&mb_id="+mb_id);
	}
}
