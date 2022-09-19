package itemAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.ItemOptionService;
import vo.ActionForward;
import vo.ItemOption;

public class ItemOptionAction {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		String itemCode = request.getParameter("itemCode");
		System.out.println(itemCode);
		
		ItemOptionService itemOptionService = new ItemOptionService();

		//ItemOptionService의 getArticle 메소드 호출
		ItemOption opArticle = itemOptionService.getArticle(itemCode);
		
		//ItemOptionService를 통해 select된 option
		ActionForward forward = new ActionForward();
	   	request.setAttribute("opArticle", opArticle);
   		forward.setPath("/shopping/itemDetail.jsp");
   		return forward;

	 }
	 
}
