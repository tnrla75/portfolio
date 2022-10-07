package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.Member_info;

public class FindIDService {

	static FindIDService model = new FindIDService();

	public static FindIDService instance(){
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	
	public Member_info selectid(Member_info memberinfo){
		Member_info list = null;
		SqlSession sqlSession = factory.openSession();
		list = (Member_info) sqlSession.selectOne("findid", memberinfo);
		sqlSession.close();
		return list;
	}
}


