package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MypageModel;
import vo.Item;

public class Mypage_itemImpl implements MypageCommandInter {
	static Mypage_itemImpl impl = new Mypage_itemImpl();
	
	
	public static Mypage_itemImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
		ArrayList<Item> list = (ArrayList<Item>) model.select_item();
		request.setAttribute("item", list);
		//controller
		return "mypage_itemqna.jsp";
	}
}
