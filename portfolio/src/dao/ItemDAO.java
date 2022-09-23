package dao;

import static db.JdbcUtil.*;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import vo.Item;
import vo.ItemOption;
import vo.ItemReview;
import vo.Qna;
import vo.ItemImg;

public class ItemDAO {

	DataSource ds;
	Connection con;
	private static ItemDAO boardDAO;

	private ItemDAO() {
	}

	public static ItemDAO getInstance(){
		if(boardDAO == null){
			boardDAO = new ItemDAO();
		}
		return boardDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	//조회수
	public int updateReadCount(String itemCode){

		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql="update item set count = count+1 where itemCode = '"+itemCode+"'";
		
		try{
			pstmt=con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		} catch(SQLException ex){
		} finally{
			close(pstmt);
		}
			return updateCount;
		}
	
	//해당 데이터 select
	public Item selectArticle(String itemCode){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Item item = null;

		try{
			pstmt = con.prepareStatement(
					"select * from item where itemCode = ?");
			pstmt.setString(1, itemCode);
			rs= pstmt.executeQuery();

			//해당 게시글 내용
			if(rs.next()){
				item = new Item();
				item.setItemCode(rs.getString("itemCode"));
				item.setBigCategory(rs.getString("bigCategory"));
				item.setMidCategory(rs.getString("midCategory"));
				item.setSmCategory(rs.getString("smCategory"));
				item.setBrandName(rs.getString("brandName"));
				item.setItemName(rs.getString("itemName"));
				item.setItemImg(rs.getString("itemImg"));
				item.setItemDetail(rs.getString("itemDetail"));
				item.setItemWon(rs.getInt("itemWon"));
				item.setItemDollar(rs.getInt("itemDollar"));
				item.setDiscountWon(rs.getInt("discountWon"));
				item.setDiscountDollar(rs.getInt("discountDollar"));
				item.setCount(rs.getInt("count"));
			}
		}catch(Exception ex){
			System.out.println("실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return item;
	}
	
	//해당 데이터 option select
	public ItemOption optionSelectArticle(String itemCode){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItemOption itemOption = null;

		try{
			pstmt = con.prepareStatement(
					"select * from itemOption where itemCode = ?");
			pstmt.setString(1, itemCode);
			rs= pstmt.executeQuery();
			
			//해당 게시글 내용
			if(rs.next()){
				itemOption = new ItemOption();
				itemOption.setItemCode(rs.getString("itemCode"));
				itemOption.setOptionName(rs.getString("optionName"));
				itemOption.setOption1(rs.getString("option1"));
				itemOption.setOption2(rs.getString("option2"));
				itemOption.setOption3(rs.getString("option3"));
				itemOption.setOption4(rs.getString("option4"));
				itemOption.setOption5(rs.getString("option5"));
			}

			System.out.println("option select 성공");
		}catch(Exception ex){
			System.out.println("실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return itemOption;
	}
	
	//해당 데이터 이미지 select
	public ItemImg imgSelectArticle(String itemCode){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItemImg itemImg = null;

		try{
			pstmt = con.prepareStatement(
					"select * from itemImg where itemCode = ?");
			pstmt.setString(1, itemCode);
			rs= pstmt.executeQuery();
			System.out.println(pstmt);
			//해당 게시글 내용
			if(rs.next()){
				itemImg = new ItemImg();
				itemImg.setItemCode(rs.getString("itemCode"));
				itemImg.setItemImg1(rs.getString("itemImg1"));
				itemImg.setItemImg2(rs.getString("itemImg2"));
				itemImg.setItemImg3(rs.getString("itemImg3"));
				itemImg.setItemImg4(rs.getString("itemImg4"));
			}
			System.out.println("이미지 select 성공");
		}catch(Exception ex){
			System.out.println("실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return itemImg;
	}
	
	//해당 아이템 리뷰 개수 
	public ArrayList<ItemReview> totalReSelectArticleList(String itemCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from itemReview where itemCode = ?";	
		
		ArrayList<ItemReview> articleList = new ArrayList<ItemReview>();
		ItemReview review = null;
	
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,itemCode);
			System.out.println(pstmt.toString());

			rs = pstmt.executeQuery();

			while(rs.next()){
				review = new ItemReview();
				review.setReviewNo(rs.getInt("reviewNo"));
				review.setMb_id(rs.getString("mb_id"));
				review.setItemCode(rs.getString("itemCode"));
				review.setReRate(rs.getInt("reRate"));
				review.setReText(rs.getString("reText"));
				review.setRePhoto1(rs.getString("rePhoto1"));
				review.setRePhoto2(rs.getString("rePhoto2"));
				review.setRePhoto2(rs.getString("rePhoto3"));
				review.setReDate(rs.getDate("reDate"));
				articleList.add(review);
			}
			System.out.println("qna select 성공");
		}catch(Exception ex) {
			System.out.println("qna select 실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	//해당 아이템 리뷰 개수
	public int reSelectListCount(String itemCode) {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			//데이터 개수 출력
			pstmt=con.prepareStatement("select count(*) from itemReview where itemCode = ?");
			pstmt.setString(1,itemCode);
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	//해당 아이템 리뷰 select
	public ArrayList<ItemReview> reviewSelectArticleList(int page, int limit, String itemCode){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ItemReview> articleList = new ArrayList<ItemReview>();
		ItemReview review = null;
		int startrow=(page-1)*10;

		try{
			pstmt = con.prepareStatement(
					"select * from itemReview where itemCode = ? limit ?,10");
			pstmt.setString(1, itemCode);
			pstmt.setInt(2,startrow);
			System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();

			while(rs.next()){
				review = new ItemReview();
				review.setReviewNo(rs.getInt("reviewNo"));
				review.setMb_id(rs.getString("mb_id"));
				review.setItemCode(rs.getString("itemCode"));
				review.setReRate(rs.getInt("reRate"));
				review.setReText(rs.getString("reText"));
				review.setRePhoto1(rs.getString("rePhoto1"));
				review.setRePhoto2(rs.getString("rePhoto2"));
				review.setRePhoto2(rs.getString("rePhoto3"));
				review.setReDate(rs.getDate("reDate"));
				articleList.add(review);
			}
			System.out.println("리뷰 select 성공");
		}catch(Exception ex){
			System.out.println("리뷰 select 실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	//낮은 가격순 정렬
	public ArrayList<Item> lowSelectArticleList(int page,int limit, String category){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from item where bigCategory=? or midCategory=? or smCategory=? order by discountWon asc limit ?,10";
		ArrayList<Item> articleList = new ArrayList<Item>();
		Item item = null;
		int startrow=(page-1)*10; 
		
		try{			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,category);
			pstmt.setString(2,category);
			pstmt.setString(3,category);
			pstmt.setInt(4, startrow);
			System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				item = new Item();
				item.setItemCode(rs.getString("itemCode"));
				item.setBigCategory(rs.getString("bigCategory"));
				item.setMidCategory(rs.getString("midCategory"));
				item.setSmCategory(rs.getString("smCategory"));
				item.setBrandName(rs.getString("brandName"));
				item.setItemName(rs.getString("itemName"));
				item.setItemImg(rs.getString("itemImg"));
				item.setItemDetail(rs.getString("itemDetail"));
				item.setItemWon(rs.getInt("itemWon"));
				item.setItemDollar(rs.getInt("itemDollar"));
				item.setDiscountWon(rs.getInt("discountWon"));
				item.setDiscountDollar(rs.getInt("discountDollar"));
				item.setCount(rs.getInt("count"));
				articleList.add(item);
			}
			System.out.println("낮은 가격순 정렬 성공");
		}catch(Exception ex){
			System.out.println("낮은 가격순 정렬 실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	//높은 가격순 정렬
	public ArrayList<Item> highSelectArticleList(int page,int limit, String category){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from item where bigCategory=? or midCategory=? or smCategory=? order by discountWon desc limit ?,10";
		ArrayList<Item> articleList = new ArrayList<Item>();
		Item item = null;
		int startrow=(page-1)*10; 
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,category);
			pstmt.setString(2,category);
			pstmt.setString(3,category);
			pstmt.setInt(4, startrow);
			System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				item = new Item();
				item.setItemCode(rs.getString("itemCode"));
				item.setBigCategory(rs.getString("bigCategory"));
				item.setMidCategory(rs.getString("midCategory"));
				item.setSmCategory(rs.getString("smCategory"));
				item.setBrandName(rs.getString("brandName"));
				item.setItemName(rs.getString("itemName"));
				item.setItemImg(rs.getString("itemImg"));
				item.setItemDetail(rs.getString("itemDetail"));
				item.setItemWon(rs.getInt("itemWon"));
				item.setItemDollar(rs.getInt("itemDollar"));
				item.setDiscountWon(rs.getInt("discountWon"));
				item.setDiscountDollar(rs.getInt("discountDollar"));
				item.setCount(rs.getInt("count"));
				articleList.add(item);
			}
			System.out.println("높은 가격순 정렬 성공");
		}catch(Exception ex){
			System.out.println("높은 가격순 정렬 실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	//조회수순 정렬
	public ArrayList<Item> countSelectArticleList(int page,int limit, String category){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from item where bigCategory=? or midCategory=? or smCategory=? order by count desc limit ?,10 ";
		ArrayList<Item> articleList = new ArrayList<Item>();
		Item item = null;
		int startrow=(page-1)*10; 
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,category);
			pstmt.setString(2,category);
			pstmt.setString(3,category);
			pstmt.setInt(4, startrow);
			System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				item = new Item();
				item.setItemCode(rs.getString("itemCode"));
				item.setBigCategory(rs.getString("bigCategory"));
				item.setMidCategory(rs.getString("midCategory"));
				item.setSmCategory(rs.getString("smCategory"));
				item.setBrandName(rs.getString("brandName"));
				item.setItemName(rs.getString("itemName"));
				item.setItemImg(rs.getString("itemImg"));
				item.setItemDetail(rs.getString("itemDetail"));
				item.setItemWon(rs.getInt("itemWon"));
				item.setItemDollar(rs.getInt("itemDollar"));
				item.setDiscountWon(rs.getInt("discountWon"));
				item.setDiscountDollar(rs.getInt("discountDollar"));
				item.setCount(rs.getInt("count"));
				articleList.add(item);
			}
			System.out.println("조회수 정렬 성공");
		}catch(Exception ex){
			System.out.println("조회수 정렬  실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	//브랜드 또는 상품 검색
	public ArrayList<Item> searchSelectArticleList(String keyword){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(keyword);
		String sql="select * from item where brandName like '%"+keyword+"%' or itemName like '%"+keyword+"%'";
		ArrayList<Item> articleList = new ArrayList<Item>();
		Item item = null;
		System.out.println(keyword);
		System.out.println(sql);
		
		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			
			while(rs.next()){
				item = new Item();
				item.setItemCode(rs.getString("itemCode"));
				item.setBigCategory(rs.getString("bigCategory"));
				item.setMidCategory(rs.getString("midCategory"));
				item.setSmCategory(rs.getString("smCategory"));
				item.setBrandName(rs.getString("brandName"));
				item.setItemName(rs.getString("itemName"));
				item.setItemImg(rs.getString("itemImg"));
				item.setItemDetail(rs.getString("itemDetail"));
				item.setItemWon(rs.getInt("itemWon"));
				item.setItemDollar(rs.getInt("itemDollar"));
				item.setDiscountWon(rs.getInt("discountWon"));
				item.setDiscountDollar(rs.getInt("discountDollar"));
				item.setCount(rs.getInt("count"));
				articleList.add(item);
			}
			System.out.println("검색 성공");
		}catch(Exception ex){
			System.out.println("검색 실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	//문의게시판 데이터 개수
	public int qnaSelectListCount(String itemCode) {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			//데이터 개수 출력
			pstmt=con.prepareStatement("select count(*) from itemQna where itemCode = ?");
			pstmt.setString(1,itemCode);
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	//해당 아이템에 대한 문의게시판  글 개수
	public ArrayList<Qna> totalQnaSelectArticleList(String itemCode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from itemQna where itemCode = ?";	
		
		ArrayList<Qna> articleList = new ArrayList<Qna>();
		Qna qna = null;
	
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,itemCode);
			System.out.println(pstmt.toString());
					
			rs = pstmt.executeQuery();

			while(rs.next()){
				qna = new Qna();
				qna.setMb_id(rs.getString("mb_id"));
				qna.setItemCode(rs.getString("itemCode"));
				qna.setQsubject(rs.getString("qsubject"));
				qna.setQuestion(rs.getString("question"));
				qna.setQupdate(rs.getDate("qupdate"));
				qna.setQanswer(rs.getString("qanswer"));
				articleList.add(qna);
			}
			System.out.println("qna select 성공");
		}catch(Exception ex) {
			System.out.println("qna select 실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	//문의게시판 select
	public ArrayList<Qna> qnaSelectArticleList(int page,int limit, String itemCode) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from itemQna where itemCode = ? order by qnaNo desc  limit ?,10";
			
		System.out.println(sql);
		ArrayList<Qna> articleList = new ArrayList<Qna>();
		Qna qna = null;
		int startrow=(page-1)*10; 
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,itemCode);
			pstmt.setInt(2,startrow);
			System.out.println(pstmt.toString());
				
			rs = pstmt.executeQuery();

			while(rs.next()){
				qna = new Qna();
				qna.setMb_id(rs.getString("mb_id"));
				qna.setItemCode(rs.getString("itemCode"));
				qna.setQsubject(rs.getString("qsubject"));
				qna.setQuestion(rs.getString("question"));
				qna.setQupdate(rs.getDate("qupdate"));
				qna.setQanswer(rs.getString("qanswer"));
				articleList.add(qna);
			}
			System.out.println("qna select 성공");
		}catch(Exception ex) {
			System.out.println("qna select 실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	//데이터 개수
	public int selectListCount(String category) {
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try{
			//데이터 개수 출력
			pstmt=con.prepareStatement("select count(*) from item where bigCategory=? or midCategory=? or smCategory=?");
			pstmt.setString(1,category);
			pstmt.setString(2,category);
			pstmt.setString(3,category);
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	//전체 select
	public ArrayList<Item> selectArticleList(int page,int limit, String category) throws UnsupportedEncodingException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		String sql="select item.itemCode, bigCategory, midCategory, smCategory, itemName, itemImg, discountWon,"
//				+ "discountDollar, reRate from item left outer join itemReview on item.itemCode = itemReview.itemCode";
		String sql="select * from item where bigCategory=? or midCategory=? or smCategory=? limit ?,10";
		
		System.out.println(sql);
		ArrayList<Item> articleList = new ArrayList<Item>();
		Item item = null;
		int startrow=(page-1)*10; 
	
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,category);
			pstmt.setString(2,category);
			pstmt.setString(3,category);
			pstmt.setInt(4, startrow);
			System.out.println(pstmt.toString());
			
			rs = pstmt.executeQuery();

			while(rs.next()){
				item = new Item();
				item.setItemCode(rs.getString("itemCode"));
				item.setBigCategory(rs.getString("bigCategory"));
				item.setMidCategory(rs.getString("midCategory"));
				item.setSmCategory(rs.getString("smCategory"));
				item.setBrandName(rs.getString("brandName"));
				item.setItemName(rs.getString("itemName"));
				item.setItemImg(rs.getString("itemImg"));
				item.setItemDetail(rs.getString("itemDetail"));
				item.setItemWon(rs.getInt("itemWon"));
				item.setItemDollar(rs.getInt("itemDollar"));
				item.setDiscountWon(rs.getInt("discountWon"));
				item.setDiscountDollar(rs.getInt("discountDollar"));
				item.setCount(rs.getInt("count"));
//				item.setReRate(rs.getInt("reRate"));
				articleList.add(item);
			}
			System.out.println("전체 select 성공");
		}catch(Exception ex) {
			System.out.println("select 실패");
		}finally{
			close(rs);
			close(pstmt);
		}
		System.out.println(articleList.size());
		return articleList;
	}


	//게시글 번호 update 및 답글 insert
//	public int insertReplyArticle(BoardBean article){
//
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		//게시글 마지막 번호
//		String board_max_sql="select max(board_num) from board";
//		String sql="";
//		int num=0;
//		int insertCount=0;
//		int re_ref=article.getBOARD_RE_REF();
//		int re_lev=article.getBOARD_RE_LEV();
//		int re_seq=article.getBOARD_RE_SEQ();
//
//		try{
//			pstmt=con.prepareStatement(board_max_sql);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next())num =rs.getInt(1)+1;
//			else num=1;
//			
//			//답변 작성시 글번호는 게시글 마지막 번호+1
//			sql="update board set BOARD_RE_SEQ=BOARD_RE_SEQ+1 where BOARD_RE_REF=? ";
//			sql+="and BOARD_RE_SEQ>?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1,re_ref);
//			pstmt.setInt(2,re_seq);
//			int updateCount=pstmt.executeUpdate();
//
//			//답글 insert
//			if(updateCount > 0){
//				commit(con);
//			}
//
//			re_seq = re_seq + 1;
//			re_lev = re_lev+1;
//			sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
//			sql+="BOARD_CONTENT, BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,";
//			sql+="BOARD_READCOUNT,BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			pstmt.setString(2, article.getBOARD_NAME());
//			pstmt.setString(3, article.getBOARD_PASS());
//			pstmt.setString(4, article.getBOARD_SUBJECT());
//			pstmt.setString(5, article.getBOARD_CONTENT());
//			pstmt.setString(6, ""); //���忡�� ������ ���ε����� ����.
//			pstmt.setInt(7, re_ref);
//			pstmt.setInt(8, re_lev);
//			pstmt.setInt(9, re_seq);
//			pstmt.setInt(10, 0);
//			insertCount = pstmt.executeUpdate();
//			System.out.println("insert");
//		}catch(SQLException ex){
//		}finally{
//			close(rs);
//			close(pstmt);
//		}
//
//		return insertCount;

//	}
//
//	//update문
//	public int updateArticle(BoardBean article){
//
//		int updateCount = 0;
//		PreparedStatement pstmt = null;
//		
//		//해당 글의 제목, 내용 update 실행
//		String sql="update board set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";
//
//		try{
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, article.getBOARD_SUBJECT());
//			pstmt.setString(2, article.getBOARD_CONTENT());
//			pstmt.setInt(3, article.getBOARD_NUM());
//			updateCount = pstmt.executeUpdate();
//		}catch(Exception ex){
//		}finally{
//			close(pstmt);
//		}
//
//		return updateCount;
//
//	}
//
//	public int deleteArticle(int board_num){
//
//		PreparedStatement pstmt = null;
//		String board_delete_sql="delete from board where BOARD_num=?";
//		int deleteCount=0;
//
//		try{
//			pstmt=con.prepareStatement(board_delete_sql);
//			pstmt.setInt(1, board_num);
//			deleteCount=pstmt.executeUpdate();
//		}catch(Exception ex){
//		}	finally{
//			close(pstmt);
//		}
//
//		return deleteCount;
//
//	}
//
//	
//	
//	//로그인
//	public boolean login(String id, String pw) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		String sql="select * from login where id=?";
//		boolean login = false;
//		
//		try{
//			pstmt=con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			rs=pstmt.executeQuery();
//			rs.next();
//			
//			//입력받은 id와  pw가 테이블 속 정보와 일치하는지 확인
//			if(id.equals(rs.getString("id")) && pw.equals(rs.getString("pw"))){
//				login = true;
//				System.out.println("로그인 성공");
//			}
//		}catch(SQLException ex){
//			System.out.println("실패");
//		}
//		finally{
//			close(pstmt);
//		}
//		return login;
//	}
//
//	//비밀번호 체크
//	public boolean isArticleBoardWriter(int board_num,String pass){
//
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String board_sql="select * from board where BOARD_NUM=?";
//		boolean isWriter = false;
//
//		try{
//			pstmt=con.prepareStatement(board_sql);
//			pstmt.setInt(1, board_num);
//			rs=pstmt.executeQuery();
//			rs.next();
//
//			//입력받은 pass가 해당 게시글의 board_pass와 같은지 확인
//			if(pass.equals(rs.getString("BOARD_PASS"))){
//				isWriter = true;
//			}
//		}catch(SQLException ex){
//		}
//		finally{
//			close(pstmt);
//		}
//
//		return isWriter;
//
//	}

}
