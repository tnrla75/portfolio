package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.Hotel_MainAction;
import action.Hotel_RoomAction;
import vo.ActionForward;


@WebServlet("*.ho")  // �븳踰덈컰�뿉 �궗�슜 紐삵븿. �븯�굹�쓽 �뤃�윭留� 李얠븘媛� �닔 �엳�쓬. .bo瑜� �떎瑜몄씠由꾩쑝濡� �젙�븯硫� �뿬�젮媛� 留뚮뱾 �닔�뒗 �엳�쓬.
					// ~.bo �벑�벑�� �떒�닔�삎�씠吏� 蹂듭닔�삎�쑝濡쒕뒗 �궗�슜 遺덇�
public class Hotel_Controller extends javax.servlet.http.HttpServlet 
{		// �뿬湲곌� 吏꾩젙�븳 而⑦듃濡ㅻ윭.
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length()); // substring�씠 萸먮뱶�씪...
		ActionForward forward=null;
		Action action=null;
		
		System.out.println(command+" : controller");
		
		if(command.equals("/hotel/hotelMainForm.ho")){ // �꽌釉붾┸耳��씠釉붿쓣 �뿴 ���씠諛� 吏��젙. .bo濡� �뱾�뼱�삤硫� qna_board_write.jsp濡� �씠�룞			
			action= new Hotel_MainAction();
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
				System.out.println(command+" : 1");
				forward=new ActionForward();		
				System.out.println(command+" : 2");
				forward.setPath("../overlap/login.jsp");
			}
//		else if(command.equals("/boardWriteForm.bo")){ // �꽌釉붾┸耳��씠釉붿쓣 �뿴 ���씠諛� 吏��젙. .bo濡� �뱾�뼱�삤硫� qna_board_write.jsp濡� �씠�룞
//			forward=new ActionForward_hotel();		// ~~.bo瑜쇳븯硫� 而⑦듃濡ㅻ윭瑜� 李얠븘�샂.
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
//			action = new BoardListAction();   // �뿬湲곗꽌 由ъ뒪�듃 ���옣
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
//		else if(command.equals("/boardModifyForm.bo")){  // �닔�젙 �븳 �뮘 �쐞�뿉�엳�뒗 list.bo濡� �씠�룞�븯�뒗�뜲 page媛믪씠 null媛믪엫.. �씠嫄� 議곗젙�빐�빞 �븿.
//			action = new BoardModifyFormAction();
//			try{
//				forward=action.execute(request, response);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}else if(command.equals("/boardModifyPro.bo")){
//			action = new BoardModifyProAction();
//			try{
//				forward=action.execute(request, response);  // �뿬湲곗꽌 �엯�젰�븳 �젣紐� 諛� �궡�슜 ���옣
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}else if(command.equals("/boardDeleteForm.bo")){ //
//			String nowPage = request.getParameter("page");
//			request.setAttribute("page", nowPage);
//			int board_num=Integer.parseInt(request.getParameter("board_num")); // �럹�씠吏��� �꽆踰꾨�� ���옣 �썑 
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
		
		if(forward != null){ // �쐞�뿉 forward�뒗 null 媛믪씠吏�留�, path�뿉 寃곕줈瑜� 吏��젙�빐以ъ쓬.
			
			if(forward.isRedirect()){  // isRedirect�뒗 false�엫�쑝濡� 
				response.sendRedirect(forward.getPath());  
			}else{
				RequestDispatcher dispatcher= // �뿬湲곗꽌 媛믩뱾�쓣 遺덈윭�샂.
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