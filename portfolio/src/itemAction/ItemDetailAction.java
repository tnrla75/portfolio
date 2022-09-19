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
		ArrayList<ItemReview> articleList = new ArrayList<ItemReview>();	
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
		articleList = itemDetailService.getArticleList(itemCode);
		totalQnaArticleList = itemDetailService.totalQnaGetArticleList(itemCode);
		
		//데이터 개수 확인
		int listCount=itemDetailService.getListCount();
		qnaArticleList = itemDetailService.qnaGetArticleList(page,limit, itemCode);
		int maxPage=(int)((double)listCount/limit+0.95); 
		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage+10-1;

		if (endPage> maxPage) endPage= maxPage;
	   	    
	   	PageInfo pageInfo = new PageInfo();
	   	pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
			
		// select된 정보
		ActionForward forward = new ActionForward();
	   	request.setAttribute("article", article);
	   	request.setAttribute("qnaArticleList", qnaArticleList);
	   	request.setAttribute("totalQnaArticleList", totalQnaArticleList);
	   	request.setAttribute("opArticle", opArticle);
	   	request.setAttribute("imgArticle", imgArticle);
		request.setAttribute("articleList", articleList);
   		forward.setPath("/shopping/itemDetail.jsp");
   		return forward;

	 }
	 
}
