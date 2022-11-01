package action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.TravelMate_applyService;
import vo.ActionForward;
import vo.TravelMate_apply;

public class TravelMate_applyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ActionForward forward= new ActionForward();
		TravelMate_apply travelmate_apply= new TravelMate_apply();
		TravelMate_applyService tmas = new TravelMate_applyService();
		
		String pnNum =request.getParameter("pnNum");
		int member =Integer.parseInt(request.getParameter("travelmateMember"));
		int mate_num =Integer.parseInt(request.getParameter("mate_num"));
		String mb_id =request.getParameter("mb_id");
		
		travelmate_apply.setApply_pnNum(pnNum);
		travelmate_apply.setApply_member(member);
		travelmate_apply.setMb_id(mb_id);
		travelmate_apply.setMate_num(mate_num);
		
		tmas.mateapply(travelmate_apply);
		forward.setPath("../travel/travel_mateapplyComplete.jsp");
		return forward;
	}

}
