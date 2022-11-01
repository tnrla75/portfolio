package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ItemModel;
import vo.ItemCart;
import vo.Mypage_qna;

public class ItemCartListImpl implements ItemCommandInter {
	static ItemCartListImpl impl = new ItemCartListImpl();
	
	
	public static ItemCartListImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemModel model = ItemModel.instance();
			
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		System.out.println(mb_id+"aaaa");
		
		ArrayList<ItemCart> list = (ArrayList<ItemCart>) model.selectCart(mb_id);
		request.setAttribute("itemCart", list);
		//controller
		return "/shopping/itemCartList.jsp";
	}
}