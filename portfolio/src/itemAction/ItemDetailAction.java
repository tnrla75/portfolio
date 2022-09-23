package itemAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.ItemDetailService;
import vo.ActionForward;
import vo.Item;
import vo.ItemImg;
import vo.Qna;
import vo.ItemOption;
import vo.ItemReview;
import vo.PageInfo;

public class ItemDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		String itemCode = request.getParameter("itemCode");
		System.out.println(itemCode);
		
		ItemDetailService itemDetailService = new ItemDetailService();
		ArrayList<ItemReview> reArticleList = new ArrayList<ItemReview>();
		ArrayList<ItemReview> totalReArticleList = new ArrayList<ItemReview>();
		ArrayList<Qna> qnaArticleList = new ArrayList<Qna>();
		ArrayList<Qna> totalQnaArticleList = new ArrayList<Qna>();
		int page=1;
		int limit=10;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		//ItemDetailService의 getArticle 메소드 호출
		Item article = itemDetailService.getArticle(itemCode);
		ItemOption opArticle = itemDetailService.optionGetArticle(itemCode);
		ItemImg imgArticle = itemDetailService.imgGetArticle(itemCode);
		totalReArticleList = itemDetailService.totalReGetArticleList(itemCode);
		totalQnaArticleList = itemDetailService.totalQnaGetArticleList(itemCode);
		
		//review 데이터 개수 확인
		int listCount_re = itemDetailService.reGetListCount(itemCode);
		reArticleList = itemDetailService.reGetArticleList(page,limit, itemCode);
		int max_page_re = (int)((double)listCount_re/limit+0.95); 
		int startPage_re = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage_re = startPage_re+10-1;

		if (endPage_re> max_page_re) endPage_re= max_page_re;
		
		PageInfo re_pageInfo = new PageInfo();
		re_pageInfo.setEndPage(endPage_re);
		re_pageInfo.setListCount(listCount_re);
		re_pageInfo.setMaxPage(max_page_re);
		re_pageInfo.setPage(page);
		re_pageInfo.setStartPage(startPage_re);	
		request.setAttribute("re_pageInfo", re_pageInfo);
		
		//qna 데이터 개수 확인
		int listCount=itemDetailService.getListCount(itemCode);
		qnaArticleList = itemDetailService.qnaGetArticleList(page,limit, itemCode);
		int maxPage=(int)((double)listCount/limit+0.95); 
		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage+10-1;

		if (endPage> maxPage) endPage= maxPage;
	   	    
	   	PageInfo qna_pageInfo = new PageInfo();
	   	qna_pageInfo.setEndPage(endPage);
	   	qna_pageInfo.setListCount(listCount);
	   	qna_pageInfo.setMaxPage(maxPage);
	   	qna_pageInfo.setPage(page);
	   	qna_pageInfo.setStartPage(startPage);	
		request.setAttribute("qna_pageInfo", qna_pageInfo);
			
		// select된 정보
		ActionForward forward = new ActionForward();
	   	request.setAttribute("article", article);
	   	request.setAttribute("qnaArticleList", qnaArticleList);
	   	request.setAttribute("totalQnaArticleList", totalQnaArticleList);
	   	request.setAttribute("reArticleList", reArticleList);
		request.setAttribute("totalReArticleList", totalReArticleList);
	   	request.setAttribute("opArticle", opArticle);
	   	request.setAttribute("imgArticle", imgArticle);
		
   		forward.setPath("/shopping/itemDetail.jsp");
   		return forward;

	 }
	 
}
