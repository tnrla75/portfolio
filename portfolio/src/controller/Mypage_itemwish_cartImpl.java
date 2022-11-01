package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ItemModel;
import vo.ItemCart;

public class Mypage_itemwish_cartImpl implements MypageCommandInter{
	static Mypage_itemwish_cartImpl impl = new Mypage_itemwish_cartImpl();
	
	
	public static Mypage_itemwish_cartImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) {
		ItemCart itemCart = null;
		
		itemCart = new ItemCart();
		
		HttpSession session = request.getSession();
		String itemCode=request.getParameter("itemCode");
		String mb_id=request.getParameter("mb_id");
		String item_count = request.getParameter("count");
		String itemOption = request.getParameter("option");

		int count = Integer.parseInt(item_count);
		System.out.println(itemCode+"/"+mb_id +"/"+count+"/"+itemOption);
		
		itemCart.setItemCode(itemCode);
		itemCart.setMb_id(mb_id);
		itemCart.setItemCount(count);
		itemCart.setItemOption(itemOption);

		ItemModel model = ItemModel.instance();
		System.out.println(model);
		int insertCart = model.insertCart(itemCart);
		request.setAttribute("itemCart", itemCart);
		//controller
		return "mypage_itemWish.mypage?command=item_wish";
	}
}
