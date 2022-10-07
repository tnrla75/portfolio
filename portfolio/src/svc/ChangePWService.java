package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.Member_info;

public class ChangePWService {
	static ChangePWService change = new ChangePWService();

	public static ChangePWService instance(){
		return change;
	}
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();

	public void updatePW(Member_info member_info){
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("changepw", member_info);
		sqlSession.commit();
		sqlSession.close();
	
	}
}
