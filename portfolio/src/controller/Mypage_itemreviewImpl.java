package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MypageModel;
import vo.Mypage_review;

public class Mypage_itemreviewImpl implements MypageCommandInter {
	static Mypage_itemreviewImpl impl = new Mypage_itemreviewImpl();
	
	
	public static Mypage_itemreviewImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("들어왔어?");
		MypageModel model = MypageModel.instance();
		String mb_id = request.getParameter("mb_id");
		
		System.out.println(mb_id+"=review");
		ArrayList<Mypage_review> list = (ArrayList<Mypage_review>) model.select_itemreview(mb_id);
		System.out.println(list);
		request.setAttribute("itemreview", list);
		//controller
		return "/overlap/mypage_itemReview.jsp";
	}
}
