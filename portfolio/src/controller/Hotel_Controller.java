package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.Hotel_MainAction;
import action.Hotel_NationAction;
import action.Hotel_StarAction;
import action.Hotel_RoomAction;
import action.Hotel_YoyakuAction;
import vo.ActionForward;


@WebServlet("*.ho")  // 한번밖에 사용 못함. 하나의 폴러만 찾아갈 수 있음. .bo를 다른이름으로 정하면 여려개 만들 수는 있음.
					// ~.bo 등등은 단수형이지 복수형으로는 사용 불가
public class Hotel_Controller extends javax.servlet.http.HttpServlet 
{		// 여기가 진정한 컨트롤러.
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length()); // substring이 뭐드라...
		ActionForward forward=null;
		Action action=null;
		
		System.out.println(command+" : controller");
		
		if(command.equals("/hotel/hotelMainForm.ho")){ // 서블릿케이블을 열 타이밍 지정. .bo로 들어오면 qna_board_write.jsp로 이동		
			System.out.println("2");
			action= new Hotel_MainAction();
			
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/hotel/hotelMainStarForm.ho")){ // 호텔 필터 성급 컨트롤		
			action= new Hotel_StarAction();
			
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/hotel/hotelMainNationForm.ho")){ // 호텔 필터 지역 컨트롤		
			action= new Hotel_NationAction();
			
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else
		if(command.equals("/hotel/hotelRoomForm.ho")) {			
			action= new Hotel_RoomAction();		
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else
			if(command.equals("/reviewForm.ho")) {				
				forward=new ActionForward();						
				forward.setPath("../overlap/login.jsp");
		}else
			if(command.equals("/hotel/hotelYoyakuForm.ho")) {			
				action=new Hotel_YoyakuAction();		
				try {
					forward=action.execute(request, response );
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
//		else if(command.equals("/boardWriteForm.bo")){ // 서블릿케이블을 열 타이밍 지정. .bo로 들어오면 qna_board_write.jsp로 이동
//			forward=new ActionForward_hotel();		// ~~.bo를하면 컨트롤러를 찾아옴.
//			forward.setPath("/qna_board_write.jsp");
//		}else if(command.equals("/boardWritePro.bo")){
//			action  = new BoardWriteProAction();
//			try {
//				forward=action.execute(request, response );
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		else if(command.equals("/boardList.bo")){
//			action = new BoardListAction();   // 여기서 리스트 저장
//			try{
//				forward=action.execute(request, response);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}									
//		else if(command.equals("/boardDetail.bo")){
//			action = new BoardDetailAction();
//			try{
//				forward=action.execute(request, response);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}									
//		else if(command.equals("/boardReplyForm.bo")){
//			action = new BoardReplyFormAction();
//			try{
//				forward=action.execute(request, response);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}
//		else if(command.equals("/boardReplyPro.bo")){
//			action = new BoardReplyProAction();
//			try{
//				forward=action.execute(request, response);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}
//		else if(command.equals("/boardModifyForm.bo")){  // 수정 한 뒤 위에있는 list.bo로 이동하는데 page값이 null값임.. 이걸 조정해야 함.
//			action = new BoardModifyFormAction();
//			try{
//				forward=action.execute(request, response);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}else if(command.equals("/boardModifyPro.bo")){
//			action = new BoardModifyProAction();
//			try{
//				forward=action.execute(request, response);  // 여기서 입력한 제목 및 내용 저장
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}else if(command.equals("/boardDeleteForm.bo")){ //
//			String nowPage = request.getParameter("page");
//			request.setAttribute("page", nowPage);
//			int board_num=Integer.parseInt(request.getParameter("board_num")); // 페이지와 넘버를 저장 후 
//			request.setAttribute("board_num",board_num);
//			forward=new ActionForward_hotel();
//			forward.setPath("/qna_board_delete.jsp");
//		}
//		else if(command.equals("/boardDeletePro.bo")){
//			action = new BoardDeleteProAction();
//			try{
//				forward=action.execute(request, response);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}
		
		if(forward != null){ // 위에 forward는 null 값이지만, path에 결로를 지정해줬음.
			
			if(forward.isRedirect()){  // isRedirect는 false임으로 
				response.sendRedirect(forward.getPath());  
			}else{
				RequestDispatcher dispatcher= // 여기서 값들을 불러옴.
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