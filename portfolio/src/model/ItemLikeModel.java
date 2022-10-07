package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

public class ItemLikeModel {
	static ItemLikeModel model = new ItemLikeModel();
	
	public static ItemLikeModel instance() {
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public int insertLike(ItemLike like) {
		int insert = 0;
		SqlSession sqlSession = factory.openSession();
		
		sqlSession.insert("insert", like);
		//insert, delete, update 시 commit 붙음
		//executeUpdate() 
		//오라클에도 기본적으로 commmit이 들어감
		sqlSession.commit();
		sqlSession.close();
		return insert;
	}
}

