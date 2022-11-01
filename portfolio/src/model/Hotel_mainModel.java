package model;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.Hotel_DAO;

import java.util.concurrent.ConcurrentSkipListMap;
import java.util.TreeMap;
import mybatis.SqlMapConfig;
import vo.Hotel_main_DTO;
import vo.Hotel_qna_DTO;
import vo.Hotel_room_DTO;
import vo.Hotel_yoyaku_DTO;

	// �꽌鍮꾩뒪 媛숈� �뒓�굦

public class Hotel_mainModel {
	
	static Hotel_mainModel model = new Hotel_mainModel();

	public static Hotel_mainModel instance(){
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
		// 硫붿씤 移댁슫�꽣 
		public static int getListCount() throws Exception{
			int listCount = 0;
			Connection con = getConnection();
			Hotel_DAO hotel_DAO = Hotel_DAO.getInstance();
			hotel_DAO.setConnection(con);
			listCount = hotel_DAO.mainListCount();
			close(con);
			return listCount;
			
		}
	
	
	// index�뿉�꽌 寃��깋�븳 硫붿씤 select
			public List<Hotel_main_DTO> kensakuSelect(Hotel_main_DTO hotel_main_DTO){
				System.out.println(">>>>>>>>>>>寃��깋 紐⑤뜽 select �뱾�뼱�샂");
								
				
				List<Hotel_main_DTO> kensakuList = null;
				
				
				SqlSession sqlSession = factory.openSession();
				
				kensakuList = sqlSession.selectList("kensakuList",hotel_main_DTO);
				
				// insert,delete,update�뒗 �쟻�슜�쓣 �빐�빞 �븯湲� �븣臾몄뿉 而ㅻ컠�씠 瑗� �븘�슂
//				SqlSession.commit("selSa");
				System.out.println(kensakuList+" : 紐⑤뜽 kensakuList �궗�씠利�");
				
				System.out.println(hotel_main_DTO.getHot_nation()+" : 紐⑤뜽 吏��뿭");
				System.out.println(hotel_main_DTO.getHot_room_maxpeople()+" : 紐⑤뜽 �씤�썝�닔");
				System.out.println(hotel_main_DTO.getHot_checkin_date()+" : 紐⑤뜽 泥댄겕�씤");
				System.out.println(hotel_main_DTO.getHot_checkout_date()+" : 紐⑤뜽 泥댄겕�븘�썐");
				System.out.println(hotel_main_DTO.getStartrow()+" : 紐⑤뜽 �럹�씠吏�");
				sqlSession.close();
				return kensakuList;
			}

	// index�뿉�꽌 寃��깋 �썑 �샇�뀛 媛�寃� 
			public TreeMap<Integer, Hotel_room_DTO> kensakuPrice(){
				System.out.println(">>>>>>>>>>>寃��깋 紐⑤뜽 媛�寃� �뱾�뼱�샂");
				TreeMap<Integer, Hotel_room_DTO>kensakuPrice = new TreeMap<Integer, Hotel_room_DTO>();
				List<Hotel_room_DTO> result = null;
							
				SqlSession sqlSession = factory.openSession();
				result = sqlSession.selectList("kensakuPrice");
				
				for(int i=0;i<result.size();i++) {
					
				kensakuPrice.put(Integer.valueOf(result.get(i).getHot_main_num()) , result.get(i));
				}
				// insert,delete,update�뒗 �쟻�슜�쓣 �빐�빞 �븯湲� �븣臾몄뿉 而ㅻ컠�씠 瑗� �븘�슂
//				SqlSession.commit("selSa");
				System.out.println(kensakuPrice.size()+" : 寃��깋 �듃由щ㏊ select �궗�씠利�");
				System.out.println(kensakuPrice+" : 寃��깋 �듃由щ㏊ select");
							
				sqlSession.close();
				return kensakuPrice;
			}
						
	// �삁�빟遺�遺�	
	public Hotel_yoyaku_DTO insertYoyaku(Hotel_yoyaku_DTO yoyakuList){
		
		SqlSession sqlinsert = factory.openSession();
		System.out.println(">>>>>>>>>>>>>>>> �삁�빟 insert 紐⑤뜽 �뱾�뼱�샂");
		System.out.println(yoyakuList.getHot_room_num()+" : �삁�빟 insert 紐⑤뜽 getHot_room_num");
		System.out.println(yoyakuList.getHot_main_num()+" : �삁�빟 insert 紐⑤뜽 getHot_room_num");
		System.out.println(yoyakuList.getHot_room_price()+" : �삁�빟 insert 紐⑤뜽 getHot_room_num");
		System.out.println(yoyakuList.getMb_gender()+" : �삁�빟 insert 紐⑤뜽 getMb_gender");
		System.out.println(yoyakuList.getHot_checkin_time()+" : �삁�빟 insert 紐⑤뜽 getHot_checkin_time");
		System.out.println(yoyakuList.getHot_checkout_time()+" : �삁�빟 insert 紐⑤뜽 getHot_checkout_time");
		
		sqlinsert.insert("yoyakuList",yoyakuList);
		
		System.out.println(sqlinsert+" : �꽌鍮꾩뒪 �삁�빟遺�遺� sqlinsert");
	
		// insert,delete,update�뒗 �쟻�슜�쓣 �빐�빞 �븯湲� �븣臾몄뿉 而ㅻ컠�씠 瑗� �븘�슂
		sqlinsert.commit();
		sqlinsert.close();
		return yoyakuList;
	}
	
	
	// �삁�빟�셿猷뚮�遺�
		public List<Hotel_yoyaku_DTO> kanryoSelect(){
			List<Hotel_yoyaku_DTO> kanryoList = null;
			System.out.println(">>>>>>>>>>>>>>>> �삁�빟 �셿猷� 紐⑤뜽 �뱾�뼱�샂");
			SqlSession sqlSession = factory.openSession();
			kanryoList = sqlSession.selectList("kanryoList");
			// insert,delete,update�뒗 �쟻�슜�쓣 �빐�빞 �븯湲� �븣臾몄뿉 而ㅻ컠�씠 瑗� �븘�슂
//			SqlSession.commit("selSa");
			System.out.println(kanryoList+" : 紐⑤뜽 kanryoList");
			
			sqlSession.close();
			return kanryoList;
		}
	
	// Q&A 臾몄쓽遺�遺�
	public List<Hotel_qna_DTO> qnaSelect(){
		List<Hotel_qna_DTO> qnaList = null;
		SqlSession sqlSession = factory.openSession();
		qnaList = sqlSession.selectList("qnaList");
		System.out.println(qnaList+" : 諛뷀떚�뒪 �꽌鍮꾩뒪 Q&A");
		// insert,delete,update�뒗 �쟻�슜�쓣 �빐�빞 �븯湲� �븣臾몄뿉 而ㅻ컠�씠 瑗� �븘�슂
//		SqlSession.commit("selSa");
		
		sqlSession.close();
		return qnaList;
	}
	
}



