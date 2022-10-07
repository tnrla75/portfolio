package controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.TravelAttRe_deleteAction;
import action.TravelAttRe_insertAction;
import action.TravelAttRe_updateAction;
import action.TravelMateAction;
import action.TravelMate_applyAction;
import action.TravelMate_searchAction;
import action.Travel_tripguideAction;
import action.TravelattAction;
import action.TravellocalAction;
import vo.ActionForward;

@WebServlet("*.travel")    
public class TravelController extends javax.servlet.http.HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/travel/local.travel")){
			action =new TravellocalAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {	
				e.printStackTrace();
			}
		}else if(command.equals("/travel/Attraction.travel")){
			System.out.println("asldnhkfgaslkbfnas;kgbfnalskdfnl");
			String att=request.getParameter("att");
			System.out.println(att+"--88"); 
			//String text = URLDecoder.decode(att, "UTF-8") ;
			//String test = new String(att.getBytes("8859_1"), "UTF-8");
			//System.out.println(test+"--99"); 
			action  = new TravelattAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				System.out.println(e);
				e.printStackTrace();	
			}
		}else if(command.equals("/travel/Attraction_Review_Write.travel")){
			forward=new ActionForward();
			forward.setPath("../travel/travel_attraction_review.jsp");
		}else if(command.equals("/travel/Attraction_review_insert.travel")){
			action  = new TravelAttRe_insertAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}else if(command.equals("/travel/Attraction_Review_delete.travel")){
			action  = new TravelAttRe_deleteAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}else if(command.equals("/travel/Attraction_Review_updatepage.travel")){
			forward=new ActionForward();
			forward.setPath("../travel/travel_attraction_review_update.jsp");
		}else if(command.equals("/travel/Attraction_review_update.travel")){
			action  = new TravelAttRe_updateAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}else if(command.equals("/travel/TripGuide.travel")){
			action  = new Travel_tripguideAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}else if(command.equals("/travel/tripguideselect.travel")){
			forward=new ActionForward();
			forward.setPath("../travel/travel_tripguide.jsp");
		}else if(command.equals("/travel/reservationComplete.travel")){
			forward=new ActionForward();
			forward.setPath("../travel/travelAtt_reservationComplete.jsp");
		}else if(command.equals("/travel/travel_mate.travel")){
			action  = new TravelMateAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}else if(command.equals("/travel/travel_mate_search.travel")){
			action  = new TravelMate_searchAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}else if(command.equals("/travel/travel_mate_apply.travel")){
			action  = new TravelMate_applyAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
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