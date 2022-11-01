package svc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.MypageModel;
import mybatis.SqlMapConfig;
import vo.Travel_makeroute;
import vo.Travelatt_reservation;

public class Travel_insertRouteService {
	
	static Travel_insertRouteService insertroute = new Travel_insertRouteService();
	
	public static Travel_insertRouteService instance(){
		return insertroute;
	}
	
	private static SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public void insertroute (Travel_makeroute makeroute){
		
		System.out.println(makeroute.getRoute1_1()+"==123123");
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("makeroute", makeroute);
		sqlSession.commit();
		sqlSession.close();
	}
}
