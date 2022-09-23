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
	
	//조회수
	public Item getArticle(String itemCode) throws Exception{
		// TODO Auto-generated method stub
		Item article = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		int updateCount = itemDAO.updateReadCount(itemCode);
		
		if(updateCount > 0){
			commit(con);
		} else{
			rollback(con);
		}

		article = itemDAO.selectArticle(itemCode);
		close(con);
		return article;
	}
	
	//아이템 옵션
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
	
	//아이템 이미지
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
	
	//해당 아이템 리뷰 개수
	public int reGetListCount(String itemCode) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//데이터 개수 확인
		listCount = itemDAO.reSelectListCount(itemCode);
		close(con);
		return listCount;
	}
	
	//리뷰 해당 아이템에 대한 글 개수
	public ArrayList<ItemReview> totalReGetArticleList(String itemCode) throws Exception {
		ArrayList<ItemReview> articleList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		articleList = itemDAO.totalReSelectArticleList(itemCode);
		close(con);
		return articleList;
	}
		
	//아이템 리뷰
	public ArrayList<ItemReview> reGetArticleList(int page, int limit, String itemCode) throws Exception{
		
		ArrayList<ItemReview> articleList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//모든 데이터 select
		articleList = itemDAO.reviewSelectArticleList(page, limit, itemCode);
		close(con);
		return articleList;
	}
	
	//qna 데이터  개수
	public int getListCount(String itemCode) throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		//데이터 개수 확인
		listCount = itemDAO.qnaSelectListCount(itemCode);
		close(con);
		return listCount;
	}
	
	//qna
	public ArrayList<Qna> qnaGetArticleList(int page, int limit, String itemCode) throws Exception{
		ArrayList<Qna> articleList = null;
		Connection con = getConnection();
		ItemDAO itemDAO = ItemDAO.getInstance();
		itemDAO.setConnection(con);
		
		articleList = itemDAO.qnaSelectArticleList(page, limit, itemCode);
		close(con);
		return articleList;
	}

	//qna 해당 아이템에 대한 글 개수
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