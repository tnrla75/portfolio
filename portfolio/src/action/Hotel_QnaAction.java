package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandInter;
import model.Hotel_mainModel;
import vo.Hotel_qna_DTO;


public class Hotel_QnaAction implements CommandInter {
static Hotel_QnaAction qna = new Hotel_QnaAction();
	
	public static Hotel_QnaAction instance(){
		return qna;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Hotel_mainModel qna = Hotel_mainModel.instance();
		ArrayList<Hotel_qna_DTO> qnaList = (ArrayList<Hotel_qna_DTO>) qna.qnaSelect();
		
		System.out.println(qnaList+" : 諛뷀떚�뒪�뿊�뀡 Q&A");
		
		request.setAttribute("qnaList", qnaList);
//		List<String> a = new ArrayList<String>();
//		java.util.Collections.sort(a);
		return "../hotel/hotel_qna_01.jsp";
	}
}
