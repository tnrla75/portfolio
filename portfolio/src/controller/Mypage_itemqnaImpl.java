package controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MypageModel;
import vo.Mypage_qna;
import vo.Member_info;

public class Mypage_itemqnaImpl implements MypageCommandInter {
	static Mypage_itemqnaImpl impl = new Mypage_itemqnaImpl();
	
	
	public static Mypage_itemqnaImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
		String mb_id = request.getParameter("mb_id");
		
		System.out.println(mb_id+"abc");
		ArrayList<Mypage_qna> list = (ArrayList<Mypage_qna>) model.select_itemqna(mb_id);
		System.out.println(list);
		request.setAttribute("itemqna", list);
		//controller
		return "mypage_itemqna.jsp";
	}
}
