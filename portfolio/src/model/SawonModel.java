package model;

import java.util.List;



import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;



import mybatis.SqlMapConfig;
import vo.Hotel_yoyaku_DTO;

	// �꽌鍮꾩뒪 媛숈� �뒓�굦

public class SawonModel {

	static SawonModel model = new SawonModel();

	public static SawonModel instance(){
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<Hotel_yoyaku_DTO> selectSawon(){
		List<Hotel_yoyaku_DTO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("yoyaku");
		// insert,delete,update�뒗 �쟻�슜�쓣 �빐�빞 �븯湲� �븣臾몄뿉 而ㅻ컠�씠 瑗� �븘�슂
//		SqlSession.commit("selSa");
		
		sqlSession.close();
		return list;
	}
}



