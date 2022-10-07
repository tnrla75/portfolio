package controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Item;
import vo.ItemOrder;
import vo.Member_info;
import model.ItemModel;


//action
public class ItemOrderImpl implements ItemCommandInter{

	static ItemOrderImpl impl = new ItemOrderImpl();
	
	
	public static ItemOrderImpl instance(){
		return impl;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) {
		ItemOrder itemOrder = null;
		
		itemOrder = new ItemOrder();
		
		HttpSession session = request.getSession();
		String itemCode = (String)session.getAttribute("itemCode");
		String mb_id = (String)session.getAttribute("mb_id");
		String option = (String)session.getAttribute("option");
		String item_count = (String)session.getAttribute("count");
		String order_no = (String)session.getAttribute("order_no");
		
		int count = Integer.parseInt(item_count);
		System.out.println(order_no+"/"+itemCode+"/"+mb_id + "/"+ option+"/"+count);
		
		itemOrder.setItemCode(itemCode);
		itemOrder.setMb_id(mb_id);
		itemOrder.setOption(option);
		itemOrder.setCount(count);
		itemOrder.setOrder_no(order_no);
		
		ItemModel model = ItemModel.instance();
		int insertOrder = model.insertOrder(itemOrder);
		request.setAttribute("itemOrder", itemOrder);
		//controller
		return "/shopping/itemOrder2.jsp";
	}
}