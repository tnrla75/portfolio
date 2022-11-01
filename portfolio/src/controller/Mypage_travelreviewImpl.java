package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MypageModel;
import svc.TravelMateService;
import vo.Mypage_review;
import vo.Mypage_travelreview;
import vo.PageInfo;
import vo.Mypage_ReviewPage;

public class Mypage_travelreviewImpl implements MypageCommandInter {
	static Mypage_travelreviewImpl impl = new Mypage_travelreviewImpl();
	
	
	public static Mypage_travelreviewImpl instance(){
		return impl;
	}
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MypageModel model = MypageModel.instance();
		String mb_id = request.getParameter("mb_id");
		
		int page=1;
		int limit=5;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		int startrow=(page-1)*5;
		Mypage_ReviewPage reviewpage = new Mypage_ReviewPage();
		reviewpage.setLimit(limit);
		reviewpage.setMb_id(mb_id);
		reviewpage.setPage(startrow);
		ArrayList<Mypage_travelreview> list = (ArrayList<Mypage_travelreview>) model.select_travelreview(reviewpage);

		int listCount= model.getListCount(mb_id);
		int maxPage=(int)((double)listCount/limit+0.95);                                   
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;                   
   	    int endPage = startPage+5-1;                                                   
   		if (endPage> maxPage) endPage= maxPage;
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		System.out.println(pageInfo+"--222");
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("travelreview", list);
		//controller
		return "/overlap/mypage_travelReview.jsp";
	}
}
