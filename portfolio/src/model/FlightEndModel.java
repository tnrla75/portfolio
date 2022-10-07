package model;

import java.util.List;



import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;



import mybatis.SqlMapConfig;
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
		//DB연결
		System.out.println("서비스 연결 ");
		SqlSession sqlSession = factory.openSession();
		//select은 가져오니까 종류가 다양함 , 여러개 가져올경우 메소드를 다른걸 가져옴 while > list 
		list = sqlSession.selectList("flightend_att"); 
		// 나머지(insert, update, delete)는 수행만 하기때문에 커밋이 추가되야함 , sqlSession.commit(); 		
		// DB닫음
		sqlSession.close();		
		System.out.println("리스트 닫기 완료");
		return list;
	}
}



