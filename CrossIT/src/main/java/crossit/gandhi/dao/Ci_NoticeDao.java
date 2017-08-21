package crossit.gandhi.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Ci_NoticeDao {
	private transient final Logger logger = LoggerFactory.getLogger(getClass());
	
	private SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSession();
	
 
	//Insert	
	public int insert(HashMap<String,Object> hMap) throws Exception{
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			result = session.insert("crossit.gandhi.dao.Ci_NoticeDao.insert", hMap);
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
	
	
	public  Integer selectCnt() throws  Exception{   

		SqlSession session = sqlSessionFactory.openSession();
		Integer result = null;
		try {
			result = (Integer)session.selectOne("crossit.gandhi.dao.Ci_NoticeDao.selectCnt") ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	
			throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	} 
	
	
	public int increseCnt(HashMap<String,Object> hMap) throws Exception{ 
		int cnt = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			cnt = (Integer) session.update("crossit.gandhi.dao.Ci_NoticeDao.increseCnt", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return cnt ;
	}
	
	
	@SuppressWarnings("unchecked")
	   public  ArrayList<HashMap<String,Object>> selectList(HashMap<String,Object> hMap) throws  Exception{  
	      SqlSession session = sqlSessionFactory.openSession();
	      ArrayList<HashMap<String,Object>> result = null;
	      
	      try {
	         result = (ArrayList)session.selectList("crossit.gandhi.dao.Ci_NoticeDao.selectList", hMap) ;
	      }catch(Exception e) {
	         logger.error(e.getMessage(), e);   throw e;
	      }finally {
	         if(session != null) { try{ session.close(); }catch(Exception e){} }
	      }
	      return result ;
	   } 
	
	
	@SuppressWarnings("unchecked")
	public  HashMap<String,Object> selectOne(HashMap<String,Object> hMap) throws  Exception{  
	
		SqlSession session = sqlSessionFactory.openSession();
		HashMap<String,Object> result = null;
		try {
			result = (HashMap<String,Object>)session.selectOne("crossit.gandhi.dao.Ci_NoticeDao.selectOne", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e; 	
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	}
	
	
	public int update(HashMap<String,Object> hMap) throws  Exception{ 
		int cnt = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			cnt = (Integer) session.update("crossit.gandhi.dao.Ci_NoticeDao.update", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return cnt ;
	}
	
	
	public int delete(HashMap<String,Object> hMap) throws  Exception{ 
		int cnt = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			cnt = (Integer) session.delete("crossit.gandhi.dao.Ci_NoticeDao.delete", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return cnt ;
	} 

 
}

