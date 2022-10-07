package model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;

import vo.Hotel_yoyaku_DTO;

public class Insert_Model {
	
	static Insert_Model model = new Insert_Model();

	public static Insert_Model instance(){
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public Hotel_yoyaku_DTO insertYoyaku(Hotel_yoyaku_DTO list){
		
		SqlSession sqlinsert = factory.openSession();
		sqlinsert.insert("yoyaku",list);
		
		System.out.println(list+"�꽌鍮꾩뒪 遺�遺�");
		// insert,delete,update�뒗 �쟻�슜�쓣 �빐�빞 �븯湲� �븣臾몄뿉 而ㅻ컠�씠 瑗� �븘�슂
		sqlinsert.commit();
		sqlinsert.close();
		return list;
	}
}
