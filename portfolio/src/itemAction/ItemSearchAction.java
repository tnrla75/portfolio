package itemAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemSearchService;
import vo.ActionForward;
import vo.Item;
import vo.PageInfo;

public class ItemSearchAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		ArrayList<Item> articleList = new ArrayList<Item>();		
		ItemSearchService itemSearchService = new ItemSearchService();
		
		int listCount = itemSearchService.getListCount(keyword);
		articleList = itemSearchService.getArticleList(page,limit, keyword);
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
		request.setAttribute("keyword", keyword);
		ActionForward forward= new ActionForward();
   		forward.setPath("/shopping/itemSearch.jsp");
   		return forward;
   		
	 }
}
