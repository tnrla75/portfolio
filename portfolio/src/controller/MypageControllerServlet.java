package controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ChangePWAction;
import action.FindIDAction;
import action.FindPWAction;


public class MypageControllerServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String command = request.getParameter("command");
		MypageCommandInter inter = null;
		String viewName = "";
		System.out.println(command);
		try {
			if(command.equals("info")) {
				inter = Mypage_infoImpl.instance();
				viewName = inter.showData(request, response);
				System.out.println(viewName);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("IDresult")) {
				inter = FindIDAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("PWresult")) {
				inter = FindPWAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("PWchange")) {
				inter = ChangePWAction.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("update")) {
				inter = Mypage_infoUpImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("board")) {
				inter = Mypage_boardImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("board_update")) {
				inter = Mypage_boardUpImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("item_qna")) {
				inter = Mypage_itemqnaImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("item_Review")) {
				inter = Mypage_itemreviewImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("item_wish")) {
				inter = Mypage_itemwishImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("cart")) {
				inter = Mypage_itemwish_cartImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("itemWish_del")) {
				inter = Mypage_itemwish_delImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("item_orderList")) {
				inter = Mypage_itemOrderImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			} else if(command.equals("travel_Review")) {
				inter = Mypage_travelreviewImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("travel_mateApply")) {
				inter = Mypage_travelmateApplyImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("applycheck")) {
				inter = Mypage_travelmateApplyupdateImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("cancel")) {
				inter = Mypage_travelmateApplydeleteImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("travel_reserveList")) {
				inter = Mypage_travelReservation.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("myroute")) {
				inter = Mypage_travelMyrouteImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else if(command.equals("ticketOrder")) {
				inter = Mypage_ticketImpl.instance();
				viewName = inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}