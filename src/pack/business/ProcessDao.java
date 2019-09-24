package pack.business;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class ProcessDao {
	private static ProcessDao dao = new ProcessDao();

	public static ProcessDao getInstance() { // Singleton Pattern
		return dao;
	}

	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); // Datasql안에 있는 id를 사용하기 위해

	public List selectdatajikwon() throws SQLException {
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("selectDatajikwon");
		
		sqlSession.close();
		
		return list;
	}
	
	public List selectgruopby() throws SQLException{
		SqlSession sqlSession = factory.openSession();
		List list = sqlSession.selectList("selectGroupby");
		sqlSession.close();
		
		return list;
	}
}