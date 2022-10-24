package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.FlightReserveListBean;

public class Mypage_ticketModel {
	static Mypage_ticketModel model = new Mypage_ticketModel();

	public static Mypage_ticketModel instance(){
		return model;
	}
	// 서비스에 해당
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<FlightReserveListBean> mypage_flightreserve(String mb_id){
		List<FlightReserveListBean> list1 = null;
		SqlSession sqlSession = factory.openSession();
		list1 = sqlSession.selectList("ticketOrderSelect", mb_id);
		
		// 나머지(insert, update, delete)는 수행만 하기때문에 커밋이 추가되야함 , sqlSession.commit(); 		
		// DB닫음
		sqlSession.close();		
		return list1;
	}
}
