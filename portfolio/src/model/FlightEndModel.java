package model;

import java.util.ArrayList;
import java.util.List;



import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;



import mybatis.SqlMapConfig;
import vo.FlightReserveBean;
import vo.Travelatt;



public class FlightEndModel {

	static FlightEndModel model = new FlightEndModel();

	public static FlightEndModel instance(){
		return model;
	}
	// 서비스에 해당
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<Travelatt> flightend_att(){
		List<Travelatt> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("flightend_att");
		// 나머지(insert, update, delete)는 수행만 하기때문에 커밋이 추가되야함 , sqlSession.commit(); 		
		// DB닫음
		sqlSession.close();		
		return list;
	}
	
	public void flightReserveInsert(ArrayList<FlightReserveBean> flightReserveBean){
		//DB연결
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("reserve", flightReserveBean);
		sqlSession.commit(); 	
		sqlSession.close();		
		System.out.println("예약 모델 끝");
	}
}



