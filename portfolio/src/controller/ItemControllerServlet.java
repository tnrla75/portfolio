package controller;
import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;



public class ItemControllerServlet extends HttpServlet{

	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		ItemCommandInter inter = null;
		String viewName = "";

		System.out.println(command);
		try {
			if(command.equals("buy")){
				inter = ItemBuyImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("order")) {
				inter = ItemOrderImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("ticket")) {
				inter = ItemOrder_ticketImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("buyList")) {
				inter = ItemBuyListImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("orderList")) {
				inter = ItemOrderListImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("cart")) {
				inter = ItemCartImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("cartList")) {
				inter = ItemCartListImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("itemMain")) {
				inter = ItemMainImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("itemWish")) {
				inter = ItemwishImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("itemWish_del")) {
				inter = Itemwish_delImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}/*else {
				viewName = "error.html";
				response.sendRedirect(viewName);
			}*/
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}



