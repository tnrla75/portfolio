package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MypageModel;
import vo.Item;

public class Mypage_itemwishImpl implements MypageCommandInter {
	static Mypage_itemwishImpl impl = new Mypage_itemwishImpl();
	
	public static Mypage_itemwishImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
			
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		System.out.println(mb_id+"aaaa");
		
		ArrayList<Item> list = (ArrayList<Item>) model.select_itemwish(mb_id);
		request.setAttribute("itemWish", list);
		//controller
		return "/overlap/mypage_itemwish.jsp";
	}
}