package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ItemModel;
import vo.ItemOrder;

public class ItemBuyListImpl implements ItemCommandInter {
	static ItemBuyListImpl impl = new ItemBuyListImpl();
	
	
	public static ItemBuyListImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) {
		ItemOrder itemOrder = null;
		
		itemOrder = new ItemOrder();
		HttpSession session = request.getSession();
		System.out.println("aaaaa");
		/*ArrayList<String> item = (ArrayList<String>) session.getAttribute("item");*/
		String mb_id = (String)session.getAttribute("mb_id");
		String [] itemCode=request.getParameterValues("itemCode");
		String [] count_arr = request.getParameterValues("count");
		String [] option = request.getParameterValues("option");
		
		String order_no="";
		for (int i=0; i<8; i++) {
			order_no += (int)(Math.random()*10)+1;	
		}
		System.out.println(order_no);
		for (int i=0; i<itemCode.length; i++) {
			int count = Integer.parseInt(count_arr[i]);
			itemOrder.setOrder_no(order_no);
			itemOrder.setMb_id(mb_id);
			itemOrder.setItemCode(itemCode[i]);
			itemOrder.setCount(count);
			itemOrder.setOption(option[i]);	

			ItemModel model = ItemModel.instance();
			int insertOrder = model.insertOrder(itemOrder);
			request.setAttribute("order_no", order_no);
		}
		
		
//		//controller
		return "/shopping/itemOrder2.jsp";
	}
}
