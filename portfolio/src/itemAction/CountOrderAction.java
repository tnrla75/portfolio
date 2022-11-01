package itemAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

import svc.CountOrderService;
import vo.ActionForward;
import vo.Item;
import vo.PageInfo;

public class CountOrderAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<Item> articleList=new ArrayList<Item>();	
		int page=1;
		int limit=16;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		CountOrderService countOrderService = new CountOrderService();
		
		request.setCharacterEncoding("utf-8");
		
//		HttpSession session = request.getSession();
//		String category = (String)session.getAttribute("category");
		
		String category = request.getParameter("category");
		System.out.println(category);
		
		int listCount=countOrderService.getListCount(category);
		articleList = countOrderService.getArticleList(page, limit, category);
		int maxPage=(int)((double)listCount/limit+0.95);
   		int startPage = (((int) ((double)page / 16 + 1)) - 1) * 16 + 1;
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
		ActionForward forward = new ActionForward();
   		forward.setPath("/shopping/itemSelect.jsp");
   		System.out.println(forward);
   		return forward;
   		
	 }
}
