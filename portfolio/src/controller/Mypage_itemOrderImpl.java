package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MypageModel;
import vo.ItemOrder;

public class Mypage_itemOrderImpl implements MypageCommandInter {
	static Mypage_itemOrderImpl impl = new Mypage_itemOrderImpl();
	
	public static Mypage_itemOrderImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
			
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		System.out.println(mb_id+"bbb");
		
		ArrayList<ItemOrder> list = (ArrayList<ItemOrder>) model.selectOrder(mb_id);
		request.setAttribute("item_orderList", list);
		//controller
		return "/overlap/mypage_order.jsp";
	}
}