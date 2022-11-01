package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ItemModel;
import vo.Item;

public class ItemMainImpl implements ItemCommandInter {
	static ItemMainImpl impl = new ItemMainImpl();
	
	
	public static ItemMainImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemModel model = ItemModel.instance();
		System.out.println("aaa");
		ArrayList<Item> list = (ArrayList<Item>) model.select_itemMain();
		request.setAttribute("itemMain", list);
		//controller
		return "/shopping/itemMain.jsp";
	}
}
