package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ItemModel;
import vo.Item;

public class ItemwishImpl implements ItemCommandInter{
	static ItemwishImpl impl = new ItemwishImpl();
		
	public static ItemwishImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) {
		Item item = null;
		
		item = new Item();
		
		HttpSession session = request.getSession();
		String itemCode=request.getParameter("itemCode");
		String mb_id=(String)session.getAttribute("mb_id");
	
		System.out.println(itemCode+"/"+mb_id);
		
		item.setItemCode(itemCode);
		item.setMb_id(mb_id);


		ItemModel model = ItemModel.instance();
		int insertWish = model.insertWish(item);
		request.setAttribute("itemWish", item);
		//controller
		return "/shopping/itemDetail.shop?itemCode="+itemCode;
	}
}
