package itemAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.ItemListService;
import vo.ActionForward;
import vo.Item;
import vo.ItemImg;
import vo.ItemReview;
import vo.PageInfo;


public class ItemListAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<Item> articleList = new ArrayList<Item>();		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}

		ItemListService itemListService = new ItemListService();
		
		request.setCharacterEncoding("utf-8");
		String category = request.getParameter("category");
		System.out.println(category);
		
		//데이터 개수 확인
		int listCount=itemListService.getListCount(category);
		articleList = itemListService.getArticleList(page,limit, category);
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
   	 
		request.setAttribute("articleList", articleList);
		ActionForward forward= new ActionForward();
   		forward.setPath("/shopping/itemSelect.jsp");
   		System.out.println(forward);
   		return forward;
	 }
 }