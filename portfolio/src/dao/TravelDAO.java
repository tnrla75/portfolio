package dao;

import static db.TravelDButil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.Travelatt;
import vo.Travelattandimg;
import vo.Travelattre;
import vo.Travelimg;
import vo.Travellocal;

public class TravelDAO {
	int a,b,c;
	String d;
	DataSource ds;
	Connection con;
	private static TravelDAO TravelDAO;

	private TravelDAO() {
	}

	public static TravelDAO getInstance(){     //½Ì±ÛÅæÆÐÅÏ =°´Ã¼ÇÑ¹ø »ý¼ºÀ¸·Î °è¼Ó »ç¿ë
		if(TravelDAO == null){
			TravelDAO = new TravelDAO();
		}
		return TravelDAO;
	}

	public void setConnection(Connection con){
		  this.con = con;
	}
		
	// Áö¿ª select¹®
	public Travellocal Selecttravellocal(String local){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Travellocal travellocal = null;
		try{
			pstmt = con.prepareStatement(
					"select * from travel_local where local_name = ?"
					);
			pstmt.setString(1, local);
			rs= pstmt.executeQuery();
			if(rs.next()){
				travellocal = new Travellocal();
				travellocal.setLocal_num(rs.getInt("local_num"));
				travellocal.setLocal_name(rs.getString("local_name"));
				travellocal.setLocal_nation(rs.getString("local_nation"));
				travellocal.setLocal_content(rs.getString("local_content"));
				travellocal.setLocal_img(rs.getString("local_img"));
				b=rs.getInt("local_num");
				this.b = b;
			}else{
				travellocal= null;
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return travellocal;

	}
	
	public ArrayList<Travelattandimg> selectlocalatt(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Travelattandimg> travelimg = new ArrayList<Travelattandimg>();
		
		try{
			String board_list_sql="select*from attraction a, att_img b where a.att_num=b.att_num and a.local_num=? order by rand() limit 4;";
			Travelattandimg board = null;
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setInt(1, b);
				rs = pstmt.executeQuery();
				while(rs.next()){
					board = new Travelattandimg();
					board.setAtt_num(rs.getInt("att_num"));
					board.setAtt_name(rs.getString("att_name"));
					board.setAtt_content(rs.getString("att_content"));
					board.setAtt_adult_ticket(rs.getInt("att_adult_ticket"));
					board.setAtt_student_ticket(rs.getInt("att_student_ticket"));
					board.setAtt_address(rs.getString("att_address"));
					board.setAtt_latitude(rs.getString("att_latitude"));
					board.setAtt_longitude(rs.getString("att_longitude"));
					board.setAtt_num(rs.getInt("local_num"));
					board.setTravel_img1(rs.getString("att_img1"));
					travelimg.add(board);
				}
		
			}catch(Exception ex){
				System.out.println(ex);
			}finally{
				close(rs);
				close(pstmt);
			}
			return travelimg;			
	}
	// °ü±¤¸í¼Ò select¹® 
	public ArrayList<Travelatt> selecttravelatt(String att){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Travellocal travellocal = null;
		ArrayList<Travelatt> travelatt = new ArrayList<Travelatt>();
		
		try{
			String board_list_sql="select * from attraction where att_name= ?";
			Travelatt board = null;
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setString(1, att);
				rs = pstmt.executeQuery();
				/*rs = stmt.executeQuery("select * from attraction where att_name like '"+travelsearch+"';");*/
				if(rs.next()){
					board = new Travelatt();
					board.setAtt_num(rs.getInt("att_num"));	
					board.setAtt_name(rs.getString("att_name"));
					board.setAtt_content(rs.getString("att_content"));
					board.setAtt_adult_ticket(rs.getInt("att_adult_ticket"));
					board.setAtt_student_ticket(rs.getInt("att_student_ticket"));
					board.setAtt_address(rs.getString("att_address"));
					board.setAtt_latitude(rs.getString("att_latitude"));
					board.setAtt_longitude(rs.getString("att_longitude"));
					board.setLocal_num(rs.getInt("local_num"));
					travelatt.add(board);
					a=rs.getInt("att_num");
					c=rs.getInt("local_num");
					d=rs.getString("att_name");
					this.a = a;
					this.c = c;
					this.d = d;
				}else{
					travelatt= null;
				}

			}catch(Exception ex){
				System.out.println(ex);
			}finally{
				close(rs);
				close(pstmt);
			}
			return travelatt;			
	}
	
	public ArrayList<Travelattandimg> selectAtt_att(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Travelattandimg> travelimg = new ArrayList<Travelattandimg>();
		
		try{
			String board_list_sql="select*from attraction a, att_img b where a.local_num=? and not a.att_name=? and a.att_num=b.att_num order by rand() limit 4;";
			Travelattandimg board = null;
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setInt(1, c);
				pstmt.setString(2, d);
				rs = pstmt.executeQuery();
				while(rs.next()){
					board = new Travelattandimg();
					board.setAtt_num(rs.getInt("att_num"));
					board.setAtt_name(rs.getString("att_name"));
					board.setAtt_content(rs.getString("att_content"));
					board.setAtt_adult_ticket(rs.getInt("att_adult_ticket"));
					board.setAtt_student_ticket(rs.getInt("att_student_ticket"));
					board.setAtt_address(rs.getString("att_address"));
					board.setAtt_latitude(rs.getString("att_latitude"));
					board.setAtt_longitude(rs.getString("att_longitude"));
					board.setAtt_num(rs.getInt("local_num"));
					board.setTravel_img1(rs.getString("att_img1"));
					travelimg.add(board);
				}
		
			}catch(Exception ex){
				System.out.println(ex);
			}finally{
				close(rs);
				close(pstmt);
			}
			return travelimg;			
	}

	public Travelimg Selecttravelimg(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Travelimg travelimg = null;
		try{
			pstmt = con.prepareStatement(
					"select * from att_img where att_num = ?"
					);
			pstmt.setInt(1, a);
			rs= pstmt.executeQuery();
			if(rs.next()){
				travelimg = new Travelimg();
				travelimg.setNum(rs.getInt("att_num"));
				travelimg.setTravel_img1(rs.getString("att_img1"));
				travelimg.setTravel_img2(rs.getString("att_img2"));
				travelimg.setTravel_img3(rs.getString("att_img3"));
				travelimg.setTravel_img4(rs.getString("att_img4"));
				travelimg.setTravel_img5(rs.getString("att_img5"));
			}
		}catch(Exception ex){
			System.out.println(ex+"11");
		}finally{
			close(rs);
			close(pstmt);
		}
		return travelimg;

	}
	//°ü±¤Áö ´ñ±Û select
	public ArrayList<Travelattre> att_review(int page, int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Travelattre> travelattre = new ArrayList<Travelattre>();
		
		try{
			String board_list_sql="select * from att_review where att_num= ? order by att_reDate desc,att_reNum desc limit ?,4";
				Travelattre board = null;
				pstmt = con.prepareStatement(board_list_sql);
				int startrow=(page-1)*4; 
				pstmt.setInt(1, a);
				pstmt.setInt(2, startrow);
				rs = pstmt.executeQuery();
				while(rs.next()){
					board = new Travelattre();
					board.setAtt_num(rs.getInt("att_num"));	
					board.setAtt_reNum(rs.getInt("att_reNum"));
					board.setMb_id(rs.getString("mb_id"));
					board.setAtt_reDate(rs.getString("att_reDate"));
					board.setAtt_reContent(rs.getString("att_reContent"));
					board.setAtt_reRate(rs.getInt("att_reRate"));
					travelattre.add(board);
				}

			}catch(Exception ex){
				System.out.println(ex);
			}finally{
				close(rs);
				close(pstmt);
			}
			return travelattre;			
	}
	//°ü±¤Áö ´ñ±Û insert
	public int insertArticle(Travelattre travelattre){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int a=0;
		System.out.println(travelattre.getAtt_reContent());
		try{
			String board_list_sql="insert into att_review (att_num, mb_id,att_reDate,att_reContent,att_reRate) values (?,?,?,?,?) ";
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setInt(1, travelattre.getAtt_num());
				pstmt.setString(2, travelattre.getMb_id());
				pstmt.setString(3, travelattre.getAtt_reDate());
				pstmt.setString(4, travelattre.getAtt_reContent());
				pstmt.setInt(5, travelattre.getAtt_reRate());
				a= pstmt.executeUpdate();
				System.out.println(pstmt.toString());
			}catch(Exception ex){
				System.out.println(ex);
			}finally{
				close(pstmt);
			}
			return a;			
	}
	//°ü±¤Áö ´ñ±Û delete
	public int deleteArticle(int att_reNum){
		PreparedStatement pstmt = null;
		String board_delete_sql="delete from att_review where att_reNum=?";
		int deleteCount=0;

		try{
			pstmt=con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, att_reNum);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception ex){
		}	finally{
			close(pstmt);
		}

		return deleteCount;

	}
	// °ü±¤Áö ´ñ±ÛÆäÀÌÁöÄ«¿îÆ®  
		public int selectListattCount() {

			int listCount= 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try{
				pstmt=con.prepareStatement("select count(*) from att_review where att_num=?");
				pstmt.setInt(1, a);
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
}
