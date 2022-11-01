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
	// �꽌鍮꾩뒪�뿉 �빐�떦
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<FlightReserveListBean> mypage_flightreserve(String mb_id){
		List<FlightReserveListBean> list1 = null;
		SqlSession sqlSession = factory.openSession();
		list1 = sqlSession.selectList("ticketOrderSelect", mb_id);
		
		sqlSession.close();		
		return list1;
	}
}
