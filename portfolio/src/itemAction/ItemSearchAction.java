package itemAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemSearchService;
import vo.ActionForward;
import vo.Item;

public class ItemSearchAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		ArrayList<Item> articleList=new ArrayList<Item>();		
		ItemSearchService itemSearchService = new ItemSearchService();
		
		articleList = itemSearchService.getArticleList(keyword);
		
		request.setAttribute("articleList", articleList);
		ActionForward forward= new ActionForward();
   		forward.setPath("/shopping/itemSelect.jsp");
   		return forward;
   		
	 }
}
