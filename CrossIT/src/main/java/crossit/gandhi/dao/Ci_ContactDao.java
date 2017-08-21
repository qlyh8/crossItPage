package crossit.gandhi.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Ci_ContactDao {
	private transient final Logger logger = LoggerFactory.getLogger(getClass());
	
	private SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSession();
	
 
	//리스트 삽입
	public int insert(HashMap<String,Object> hMap) throws Exception{
		
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try{
			result = session.insert("crossit.gandhi.dao.Ci_ContactDao.insert", hMap);
			session.commit();
		}
		catch(Exception e){
			logger.error(e.getMessage(), e);  
			throw e;
		}
		finally{
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result;
	}
	
	
	//리스트 전체 선택
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String,Object>> selectList(HashMap<String,Object> hMap) throws Exception{  
		
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<HashMap<String,Object>> result = null;

		try {
			result = (ArrayList)session.selectList("crossit.gandhi.dao.Ci_ContactDao.selectList", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);   throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	} 
	
	
	//리스트 한 개 선택
	@SuppressWarnings("unchecked")
	public HashMap<String,Object> selectOne(HashMap<String,Object> hMap) throws Exception{  
	
		SqlSession session = sqlSessionFactory.openSession();
		HashMap<String,Object> result = null;
		try {
			result = (HashMap<String,Object>)session.selectOne("crossit.gandhi.dao.Ci_ContactDao.selectOne", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e; 	
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	}
	
	
	//리스트 총 갯수
	public Integer selectTotal() throws Exception{   

		SqlSession session = sqlSessionFactory.openSession();
		Integer result = null;
		
		try {
			result = (Integer)session.selectOne("crossit.gandhi.dao.Ci_ContactDao.selectTotal") ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	
			throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	} 
	
	
	//문의 상태 변경
	public int updateCnt(HashMap<String,Object> hMap) throws Exception{ 
		
		int result = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			result = (Integer) session.update("crossit.gandhi.dao.Ci_ContactDao.updateCnt", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	}
	
	
	//조회수 변경
	public int updateStatus(HashMap<String,Object> hMap) throws Exception{ 

		int result = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();

		try{
			result = (Integer) session.update("crossit.gandhi.dao.Ci_ContactDao.updateStatus", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	}
		
		
	//리스트 한 개 삭제
	public int delete(HashMap<String,Object> hMap) throws Exception{ 
		
		int result = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			result = (Integer) session.delete("crossit.gandhi.dao.Ci_ContactDao.delete", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	} 
}
