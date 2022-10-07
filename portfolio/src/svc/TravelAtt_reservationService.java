package svc;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.Travelatt_reservation;

public class TravelAtt_reservationService {
	static TravelAtt_reservationService input = new TravelAtt_reservationService();
	
	public static TravelAtt_reservationService instance(){
		return input;
	}
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public void insertRES(Travelatt_reservation trvaelatt_reservation){
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("insert",trvaelatt_reservation);
		sqlSession.commit();
		sqlSession.close();
	}
}

