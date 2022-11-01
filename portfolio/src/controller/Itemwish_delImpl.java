package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ItemModel;
import vo.Item;

public class Itemwish_delImpl implements ItemCommandInter{
	static Itemwish_delImpl impl = new Itemwish_delImpl();
	
	public static Itemwish_delImpl instance(){
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
		int delWish = model.delWish(item);
		request.setAttribute("itemWish_del", item);
		//controller
		return "/shopping/itemDetail.shop?itemCode="+itemCode;
	}
}
