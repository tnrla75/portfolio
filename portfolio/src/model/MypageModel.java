package model;

import static db.TravelDButil.close;
import static db.TravelDButil.getConnection;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import travel_package.MateController;
import vo.Member_info;
import vo.ItemQna;
import vo.Item;
import vo.ItemOrder;
import vo.Mypage_qna;
import vo.Mypage_review;
import vo.Mypage_travelmateapply;
import vo.Mypage_travelreview;
import vo.Travel_makeroute;
import vo.Travel_selectroute;
import vo.Travelatt_reservation;
import vo.Mypage_ReviewPage;

public class MypageModel {
	static MypageModel model = new MypageModel();
	
	public static MypageModel instance(){
		return model;
	}
	
	private static SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//info select
		public Member_info selectMember(String mb_id) {
			Member_info member = null;
			SqlSession sqlSession = factory.openSession();
			member = (Member_info)sqlSession.selectOne("member", mb_id);
			sqlSession.close();
			return member;
		}
		
		//info_update
		public void updateMember(Member_info member) {
			System.out.println("aaa");
			SqlSession sqlSession = factory.openSession();
			sqlSession.update("update", member);
			//insert, delete, update �떆 commit 遺숈쓬
			sqlSession.commit();
			sqlSession.close();
			
		}
		
		//boardpass_update
		public int updatePass(Member_info member) {
			int update = 0;
			SqlSession sqlSession = factory.openSession();
			sqlSession.update("board_update", member);
			//insert, delete, update �떆 commit 遺숈쓬
			sqlSession.commit();
			sqlSession.close();
			return update;
		}
		
		//item_qna select
		public List<Mypage_qna> select_itemqna(String mb_id){
			List<Mypage_qna> list = null;
			System.out.println(mb_id+"aa");
			SqlSession sqlSession = factory.openSession();
			list = sqlSession.selectList("item_qna", mb_id);
			System.out.println(list);
			sqlSession.close();
			return list;
		}

		//item_review select
		public List<Mypage_review> select_itemreview(String mb_id){
			List<Mypage_review> list = null;
			System.out.println(mb_id+"review");
			SqlSession sqlSession = factory.openSession();
			list = sqlSession.selectList("item_review", mb_id);
			System.out.println(list);
			sqlSession.close();
			return list;
		}
		
		//item_wish select
		public List<Item> select_itemwish(String mb_id){
			List<Item> list = null;
			SqlSession sqlSession = factory.openSession();
			list = sqlSession.selectList("item_wishList", mb_id);
			sqlSession.close();
			return list;
		}
		
		public List<Item> select_item(){
			List<Item> list = null;
			SqlSession sqlSession = factory.openSession();
			list = sqlSession.selectList("item");
			sqlSession.close();
			return list;
		}
		
		//order list select
		public List<ItemOrder> selectOrder(String mb_id){
			List<ItemOrder> list = null;
			SqlSession sqlSession = factory.openSession();
			list = sqlSession.selectList("item_orderList", mb_id);
			sqlSession.close();
			return list;
		}

		
		
		
		
		
	//travel review select
	public List<Mypage_travelreview> select_travelreview(Mypage_ReviewPage reviewpage){
		List<Mypage_travelreview> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("travel_review", reviewpage);
		sqlSession.close();
		return list;
	}
	//mypapge mate apply 1
		public List<Mypage_travelmateapply> select_travelapply1(Mypage_ReviewPage reviewpage){
			List<Mypage_travelmateapply> list = null;
			SqlSession sqlSession = factory.openSession();
			list = sqlSession.selectList("travelmate_apply1", reviewpage);
			sqlSession.close();
			return list;
		}
	//mypapge mate apply 2
	public List<Mypage_travelmateapply> select_travelapply2(Mypage_ReviewPage reviewpage){
		List<Mypage_travelmateapply> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("travelmate_apply2", reviewpage);
		sqlSession.close();
		return list;
	}
	// mypage mate apply delete
	public void travelmateApplydelete(String applynum){
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("mateApplyDelete", applynum);
		sqlSession.commit();
		sqlSession.close();
	}
	// mypage mate apply status update
	public void travelmateApplyupdate(Mypage_travelmateapply updatestatus){
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("mateApplyUpdate", updatestatus);
		sqlSession.commit();
		sqlSession.close();
	}
	
	//travel paging
	public static int getListCount(String mb_id) throws Exception{													//페이징
		int listCount= 0;
		SqlSession sqlSession = factory.openSession();
		listCount = sqlSession.selectOne("travel_review_page", mb_id);
		sqlSession.close();
		return listCount;
	}
	//travel attraction reservation
	public List<Travelatt_reservation> travel_reserveation(String mb_id){
		List<Travelatt_reservation> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("mypage_reservation", mb_id);
		sqlSession.close();
		return list;
	}
 
	public List<Travel_selectroute> travel_makeroute(String mb_id){
		List<Travel_selectroute> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("mypage_myroute", mb_id);
		sqlSession.close();
		return list;
	}
	
}
