package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.Member_info;

public class FindPWService {
	static FindPWService find = new FindPWService();

	public static FindPWService instance(){
		return find;
	}
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public Member_info selectpw(Member_info memberinfo){
		Member_info list = null;
		SqlSession sqlSession = factory.openSession();
		list = (Member_info) sqlSession.selectOne("findpw", memberinfo);
		sqlSession.close();
		return list;
	}
}