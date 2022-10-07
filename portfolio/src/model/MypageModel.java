package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.Member_info;
import vo.ItemQna;
import vo.Item;
import vo.Mypage_qna;
import vo.Mypage_review;

public class MypageModel {
	static MypageModel model = new MypageModel();
	
	public static MypageModel instance(){
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	//留덉씠�럹�씠吏� 媛쒖씤�젙蹂�
	public Member_info selectMember(String mb_id) {
		Member_info member = null;
		SqlSession sqlSession = factory.openSession();
		member = (Member_info)sqlSession.selectOne("member", mb_id);
		sqlSession.close();
		return member;
	}
	
	//留덉씠�럹�씠吏� 媛쒖씤�젙蹂� �닔�젙
	public void updateMember(Member_info member) {
		System.out.println("aaa");
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("update", member);
		//insert, delete, update �떆 commit 遺숈쓬
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	//留덉씠�럹�씠吏� �뿬沅뚯젙蹂� �닔�젙
	public int updatePass(Member_info member) {
		int update = 0;
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("board_update", member);
		//insert, delete, update �떆 commit 遺숈쓬
		sqlSession.commit();
		sqlSession.close();
		return update;
	}
	
	//留덉씠�럹�씠吏� 臾몄쓽�궗�빆
	public List<Mypage_qna> select_itemqna(String mb_id){
		List<Mypage_qna> list = null;
		System.out.println(mb_id+"aa");
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("item_qna", mb_id);
		System.out.println(list);
		sqlSession.close();
		return list;
	}

	//留덉씠�럹�씠吏� 由щ럭
	public List<Mypage_review> select_itemreview(String mb_id){
		List<Mypage_review> list = null;
		System.out.println(mb_id+"review");
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("item_review", mb_id);
		System.out.println(list);
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
	
}
