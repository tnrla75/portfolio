package action;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import svc.TravelattService;
import vo.ActionForward;
import vo.Travelatt;
import vo.Travelattandimg;
import vo.Travelattre;
import vo.Travelimg;
import vo.Travellocal;
import vo.PageInfo;


public class TravelattAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		Travelimg travelimg = null;
		ArrayList<Travelatt> travelatt=new ArrayList<Travelatt>();
		TravelattService travelattservice = new TravelattService();
		ArrayList<Travelattandimg> travelattimg = new ArrayList<Travelattandimg>();
		ActionForward forward= new ActionForward();
		ArrayList<Travelattre> travelattre=new ArrayList<Travelattre>();
		//att글 select
		String att=request.getParameter("att");
		travelatt=travelattservice.attselect(att);
		travelattimg=travelattservice.attselect_att();
		request.setAttribute("travelatt", travelatt);
		request.setAttribute("travelattimg", travelattimg);
		if(travelatt==null) {	
	   		response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('일치하는 값이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else{
			forward.setPath("../travel/travelAtt.jsp");
		}
		//이미지 select
				travelimg =travelattservice.imgselect();
				String a =travelimg.getTravel_img1();
				
				String filename="";	
				filename=a;
				request.setAttribute("filename", filename);	
		// 페이지 
		int page=1;
		int limit=4;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		int listCount=travelattservice.getListCount();
		int maxPage=(int)((double)listCount/limit+0.95);                                    // ??? 페이지 ????
   		int startPage = (((int) ((double)page / 4 + 0.9)) - 1) * 4 + 1;                   // 페이지 최고 10까지? ???? 10이후 하나씩 증가????
   	    int endPage = startPage+10-1;                                                        // 10-1 ???
   		if (endPage> maxPage) endPage= maxPage;
   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		//댓글 select
		travelattre=travelattservice.review(page,limit);
		request.setAttribute("travelattre", travelattre);
		return forward; 
	}
}
