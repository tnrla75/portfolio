package svc;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlMapConfig;
import vo.Travelmap;

public class Travel_writerouteService {
	static Travel_writerouteService route = new Travel_writerouteService();
	
	public static Travel_writerouteService instance(){
		return route;
	}
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<Travelmap> writeroute(String local){
		List<Travelmap> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("mapselect", local);
		sqlSession.close();
		return list;
	}
}

