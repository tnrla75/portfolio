package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ItemModel;
import vo.Item;
import vo.ItemOrder;
import vo.Member_info;

public class ItemOrderListImpl implements ItemCommandInter{

	static ItemOrderListImpl impl = new ItemOrderListImpl();
	
	
	public static ItemOrderListImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ItemModel model = ItemModel.instance();
		
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		String select = request.getParameter("itemCode");
		String [] count = request.getParameterValues("count");
		session.setAttribute("count",count);

		String [] itemarr = select.split("/");
		
		for (int i=0; i<count.length; i++) {
			System.out.println(count[i]);
		}
		
	    List<String> item =  model.selectOrder(itemarr);
		Member_info member = (Member_info) model.selectMember(mb_id);
		request.setAttribute("item", item);
		request.setAttribute("count", count);
		request.setAttribute("member", member);
		//controller
		return "/shopping/itemOrderList.jsp";
	}
}