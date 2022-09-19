package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import itemAction.Action;
import itemAction.CountOrderAction;
import itemAction.HighPriceAction;
import itemAction.ItemDetailAction;
import itemAction.ItemListAction;
import itemAction.ItemSearchAction;
import itemAction.LowPriceAction;
import vo.ActionForward;


//서블릿에서 .bo라고 끝난다면 controller로 찾아옴
//하나의 controller에 한개만 지정 가능
@WebServlet("*.shop")

public class ItemFrontController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action = null;
		System.out.println(command);
		
		if (command.equals("/shopping/itemList.shop")){
			action = new ItemListAction();
			
			try {
				forward=action.execute(request, response);
				System.out.println("전송");
			} catch (Exception e) {
				System.out.println("실패");
				e.printStackTrace();
			}
		} else if (command.equals("/shopping/itemDetail.shop")) {
			action = new ItemDetailAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/shopping/item_lowPrice.shop")) {
			action = new LowPriceAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/shopping/item_highPrice.shop")) {
			action = new HighPriceAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/shopping/item_countOrder.shop")) {
			action = new CountOrderAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/shopping/search.shop")) {
			action = new ItemSearchAction();
			try {
				forward=action.execute(request, response);
				System.out.println("성공");
			} catch (Exception e) {
				System.out.println("실패");
				e.printStackTrace();
			}
		}
	
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}