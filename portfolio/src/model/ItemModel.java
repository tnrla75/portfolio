package model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.Item;
import vo.Member_info;
import vo.ItemOrder;


public class ItemModel {

	static ItemModel model = new ItemModel();
	

	public static ItemModel instance(){
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	//item select
	public Item selectItem(String itemCode){
		//type은 무조건 list
		Item article = null;
		SqlSession sqlSession = factory.openSession();
		
		//datamapper id(select문 사용)
		article = (Item) sqlSession.selectOne("item", itemCode);
		sqlSession.close();
		return article;
	}
	
	public Member_info selectMember(String mb_id) {
		Member_info member = null;
		SqlSession sqlSession = factory.openSession();
		member = (Member_info)sqlSession.selectOne("member", mb_id);
		sqlSession.close();
		return member;
	}
	
	//상품 구매
	public int insertOrder(ItemOrder itemOrder) {
		int insert = 0;
		SqlSession sqlSession = factory.openSession();
		
		//datamapper id(select문 사용)
		sqlSession.insert("itemOrder", itemOrder);
		sqlSession.commit();
		sqlSession.close();
		return insert;
	}
}



