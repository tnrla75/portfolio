package controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


import vo.Item;
import vo.Member_info;
import model.ItemModel;


//action
public  class ItemBuyImpl implements ItemCommandInter{

	static ItemBuyImpl impl = new ItemBuyImpl();
	
	
	public static ItemBuyImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemModel model = ItemModel.instance();
		String itemCode = request.getParameter("itemCode");
		String mb_id = request.getParameter("mb_id");
		System.out.println(mb_id+"aaaa");
		
		Item item = (Item) model.selectItem(itemCode);
		Member_info member = (Member_info) model.selectMember(mb_id);
		request.setAttribute("item", item);
		request.setAttribute("member", member);
		//controller
		return "/shopping/itemOrder1.jsp";
	}


	
	
	/*public String insertData(HttpServletRequest request, HttpServletResponse response) {
		SawonDto sawon = null;
		
		sawon = new SawonDto();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		sawon.setId(id);
		sawon.setPw(pw);
		System.out.println(id + " "+ pw);
		System.out.println(sawon.getId() + " " + sawon.getPw());
		ItemModel model = ItemModel.instance();
		int insertSawon = model.insertSawon(sawon);
		request.setAttribute("data", insertSawon);
		//controller
		return "sang.do?command=sawon";
	}*/
}