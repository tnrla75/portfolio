package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.FlightTicketBean;
import vo.FlightSeatBean;

public class FlightSeatBModel {

	static FlightSeatBModel model = new FlightSeatBModel();

	public static FlightSeatBModel instance(){
		return model;
	}
	// 서비스에 해당
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<FlightTicketBean> ticket1(String ticketNum1){

		List<FlightTicketBean> list = null;
		//DB연결
		System.out.println(ticketNum1);
		SqlSession sqlSession = factory.openSession();
		//select은 가져오니까 종류가 다양함 , 여러개 가져올경우 메소드를 다른걸 가져옴 while > list 
		list = sqlSession.selectList("ticketNum1", ticketNum1);

		System.out.println("시트 db 연결 끝1"+list);
		// 나머지(insert, update, delete)는 수행만 하기때문에 커밋이 추가되야함 , sqlSession.commit(); 		
		// DB닫음
		sqlSession.close();		
		return list;
	}
	public List<FlightTicketBean> ticket2(String ticketNum2){
		List<FlightTicketBean> list = null;
		//DB연결
		System.out.println(ticketNum2);
		SqlSession sqlSession = factory.openSession();
		//select은 가져오니까 종류가 다양함 , 여러개 가져올경우 메소드를 다른걸 가져옴 while > list 
		list = sqlSession.selectList("ticketNum2", ticketNum2);
		System.out.println("시트 db 연결 끝2"+list);
		// 나머지(insert, update, delete)는 수행만 하기때문에 커밋이 추가되야함 , sqlSession.commit(); 		
		// DB닫음
		sqlSession.close();		
		return list;
	}
	public List<FlightSeatBean> seat1(String ticketNum1){
		List<FlightSeatBean> list = null;
		System.out.println(ticketNum1);
		//DB연결
		SqlSession sqlSession = factory.openSession();
		//select은 가져오니까 종류가 다양함 , 여러개 가져올경우 메소드를 다른걸 가져옴 while > list 
		list = sqlSession.selectList("seat1", ticketNum1);
		System.out.println("db 가져온 내용 : "+list);
		// 나머지(insert, update, delete)는 수행만 하기때문에 커밋이 추가되야함 , sqlSession.commit(); 		
		// DB닫음
		sqlSession.close();		
		return list;
	}

}
