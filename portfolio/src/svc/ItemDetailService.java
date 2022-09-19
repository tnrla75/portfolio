package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.Item;
import vo.ItemImg;
import vo.ItemOption;
import vo.ItemReview;
import vo.Qna;

public class ItemDetailService {
	public Item getArticle(String itemCode) throws Exception{
		// TODO Auto-generated method stub
		
		Item article = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//update문 실행(조회수 update)
		int updateCount = itemDAO.updateReadCount(itemCode);
		
		if(updateCount > 0){
			commit(con);
		} else{
			rollback(con);
		}
		
		//select문 실행(게시글 정보)
		article = itemDAO.selectArticle(itemCode);
		close(con);
		return article;
	}
	
	public ItemOption optionGetArticle(String itemCode) throws Exception{
		// TODO Auto-generated method stub
		
		ItemOption article = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//해당 아이템에 대한 옵션 select
		article = itemDAO.optionSelectArticle(itemCode);
		close(con);
		return article;
	}
	
	public ItemImg imgGetArticle(String itemCode) throws Exception {
		
		ItemImg article = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//해당 아이템에 대한 이미지 select
		article = itemDAO.imgSelectArticle(itemCode);
		close(con);
		return article;
	}
	
	public ArrayList<ItemReview> getArticleList(String itemCode) throws Exception{
		
		ArrayList<ItemReview> articleList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//모든 데이터 select
		articleList = itemDAO.reviewSelectArticleList(itemCode);
		close(con);
		return articleList;
	}
	
	//qna 데이터 개수
	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//데이터 개수 확인
		listCount = itemDAO.qnaSelectListCount();
		close(con);
		return listCount;
	}
	
	public ArrayList<Qna> qnaGetArticleList(int page, int limit, String itemCode) throws Exception{
		ArrayList<Qna> articleList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//데이터 10개 초과시 페이지 생성
		articleList = itemDAO.qnaSelectArticleList(page, limit, itemCode);
		close(con);
		return articleList;
	}

	public ArrayList<Qna> totalQnaGetArticleList(String itemCode) throws Exception {
		ArrayList<Qna> articleList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		articleList = itemDAO.totalQnaSelectArticleList(itemCode);
		close(con);
		return articleList;
	}

}