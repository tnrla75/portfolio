package model;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.SqlMapConfig;
import vo.Item;
import vo.Member_info;
import vo.Mypage_qna;
import vo.ItemOrder;
import vo.ItemCart;
import vo.FlightReserveListBean;

public class ItemModel {

	static ItemModel model = new ItemModel();
	

	public static ItemModel instance(){
		return model;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	//itemMain select
	public List<Item> select_itemMain(){
		List<Item> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("itemMain");
		sqlSession.close();
		return list;
	}
	
	//item select(구매창)
	public Item selectItem(String itemCode){
		//type은 무조건 list
		Item article = null;
		SqlSession sqlSession = factory.openSession();
		
		//datamapper id(select문 사용)
		article = (Item) sqlSession.selectOne("item", itemCode);
		sqlSession.close();
		return article;
	}
	
	public Member_info selectMember(String mb_id) {
		Member_info member = null;
		SqlSession sqlSession = factory.openSession();
		member = (Member_info)sqlSession.selectOne("member", mb_id);
		sqlSession.close();
		return member;
	}
	
	//상품 구매 리스트
	public List<String> selectOrder(String [] itemArr){
		//List<vo.Item> list = null;	
		SqlSession sqlSession = factory.openSession();
				
		List<String> itemArr1 =  new ArrayList<>(Arrays.asList(itemArr));
		System.out.println(itemArr1.get(0));
		List<String >list = sqlSession.selectList("itemOrderList", itemArr1);
		
		sqlSession.close();
		return list;	
	}
	
	//상품 주문 리스트
	public List<String> selectBuyList(String [] itemArr){
		SqlSession sqlSession = factory.openSession();				
		List<String> itemArr1 =  new ArrayList<>(Arrays.asList(itemArr));
		System.out.println(itemArr1.get(0));
		List<String >list = sqlSession.selectList("itemOrderList", itemArr1);
		
		sqlSession.close();
		return list;	
	}
	
	//상품 구매
	public int insertOrder(ItemOrder itemOrder) {
		int insert = 0;
		SqlSession sqlSession = factory.openSession();
			
		//datamapper id(select문 사용)
		sqlSession.insert("itemOrder", itemOrder);
		sqlSession.commit();
		sqlSession.close();
		return insert;
	}
	
	public List<FlightReserveListBean> select_airTicket(String mb_id) {
		List<FlightReserveListBean> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("ticketOrderSelect", mb_id);
		sqlSession.close();
		return list;
	}
	
	public List<FlightReserveListBean> select_ticketInfo(String flight_Ticket_Num) {
		List<FlightReserveListBean> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("ticketInfo", flight_Ticket_Num);
		sqlSession.close();
		return list;
	}
	
	
	//장바구니 담기
	public int insertCart (ItemCart itemCart) {
		int insert = 0;
		SqlSession sqlSession = factory.openSession();
		
		//datamapper id(select문 사용)
		sqlSession.insert("itemCart", itemCart);
		sqlSession.commit();
		sqlSession.close();
		return insert;
	}
	
	//장바구니 리스트
	public List<ItemCart> selectCart(String mb_id){
		List<ItemCart> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("itemCartList", mb_id);
		sqlSession.close();
		return list;
	}
	
	//wish
	public int insertWish(Item item) {
		int insert = 0;
		SqlSession sqlSession = factory.openSession();
		
		//datamapper id(select문 사용)
		sqlSession.insert("itemWish", item);
		sqlSession.commit();
		sqlSession.close();
		return insert;
	}
	
	//wish_del
	public int delWish(Item item) {
		int delete = 0;
		SqlSession sqlSession = factory.openSession();
		
		//datamapper id(select문 사용)
		sqlSession.delete("itemWish_del", item);
		System.out.println("찜 삭제");
		sqlSession.commit();
		sqlSession.close();
		return delete;
	}
	
	//wish_select
	public List<Item> selectWish(String mb_id){
		List<Item> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("itemWishList", mb_id);
		sqlSession.close();
		return list;
	}
}



