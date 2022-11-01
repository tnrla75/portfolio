package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ItemModel;
import vo.Item;

public class Itemwish_selImpl  implements ItemCommandInter {
	static Itemwish_selImpl impl = new Itemwish_selImpl();
	
	
	public static Itemwish_selImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemModel model = ItemModel.instance();
			
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		String itemCode = request.getParameter("itemCode");
		System.out.println(mb_id+"aaaa");
		
		ArrayList<Item> list = (ArrayList<Item>) model.selectWish(mb_id);
		request.setAttribute("itemCart", list);
		//controller
		return "/shopping/itemDetail.shop?itemCode="+itemCode;
	}

}
