package model;

import java.util.ArrayList;
import java.util.List;



import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;



import mybatis.SqlMapConfig;
import vo.FlightReserveBean;
import vo.Travelatt;
import vo.Travelattandimg;



public class FlightEndModel {

	static FlightEndModel model = new FlightEndModel();

	public static FlightEndModel instance(){
		return model;
	}
	// �꽌鍮꾩뒪�뿉 �빐�떦
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<Travelattandimg> flightend_att(){
		List<Travelattandimg> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("flightend_att");
		sqlSession.close();		
		return list;
	}
	
	public void flightReserveInsert(ArrayList<FlightReserveBean> flightReserveBean){
		//DB�뿰寃�
		for(int i =0; i<flightReserveBean.size(); i++) {
			System.out.println(flightReserveBean.get(i).getSeatNum());
			System.out.println(flightReserveBean.get(i).getFlight_Rfirstname());
		}
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert("reserve", flightReserveBean);
		sqlSession.commit(); 	
		sqlSession.close();		
	}
}



