package crossit.gandhi.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Ci_UserDao {
	private transient final Logger logger = LoggerFactory.getLogger(getClass());
	
	private SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSession();
	
	
	@SuppressWarnings("unchecked")
	public  HashMap<String,String> login(HashMap<String,String> hMap) throws  Exception{  
	
		SqlSession session = sqlSessionFactory.openSession();
		HashMap<String,String> result = null;
		try {
			result = (HashMap<String,String>)session.selectOne("crossit.gandhi.dao.Ci_UserDao.login", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e; 	
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	} 
	
	

	//Insert	
	public int insertUser(HashMap<String,Object> hMap) throws  Exception{
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("~~~");
		try{
			result = session.insert("crossit.gandhi.dao.Ci_UserDao.insertUser", hMap);
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
	
	
	// id duplication 
	public  Integer idCnt(HashMap<String,Object> hMap) throws  Exception{   

		SqlSession session = sqlSessionFactory.openSession();
		Integer result = null;
		try {
			result = (Integer)session.selectOne("crossit.gandhi.dao.Ci_UserDao.idCnt", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	
			throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	} 
	
	
	//모든 유저 리스트 
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String,Object>> selectList() throws  Exception{  
	
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<HashMap<String,Object>> result = null;
		
		try {
			result = (ArrayList)session.selectList("crossit.gandhi.dao.Ci_UserDao.selectList") ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e; 	
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	} 
	
	
	//회원 수 조회 
	public int selectCnt() throws Exception {
		
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try {
			result = (Integer) session.selectOne("crossit.gandhi.dao.Ci_UserDao.selectCnt");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		} finally {
			if (session != null) { try { session.close(); } catch (Exception e) {} }
		}
		return result;
	}
	
	
	//select one
	public int selectOne(HashMap<String,Object> hMap) throws  Exception{  
	
		SqlSession session = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = (Integer)session.selectOne("crossit.gandhi.dao.Ci_UserDao.selectOne", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e; 	
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	} 
	
	
	//개인 유저 정보
	@SuppressWarnings("unchecked")
	public  HashMap<String,Object> selectById(HashMap<String,Object> hMap) throws  Exception{  
	
		SqlSession session = sqlSessionFactory.openSession();
		HashMap<String,Object> result = null;
		try {
			result = (HashMap<String,Object>)session.selectOne("crossit.gandhi.dao.Ci_UserDao.selectById", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e; 	
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	} 
	
	
	//update user info
	public int updateInfo(HashMap<String,Object> hMap) throws  Exception{ 
		int cnt = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			cnt = (Integer) session.update("crossit.gandhi.dao.Ci_UserDao.updateInfo", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return cnt ;
	}
	
	
	//유저 상태 변경
	public int updateStatus(HashMap<String,Object> hMap) throws Exception{ 

		int result = 0 ; 
		SqlSession session = sqlSessionFactory.openSession();

		try{
			result = (Integer) session.update("crossit.gandhi.dao.Ci_UserDao.updateStatus", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	}
	
	
	//회원 한명 삭제
	public int delete(HashMap<String,Object> hMap) throws Exception{ 
		
		int result = 0 ; 
		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			result = (Integer) session.delete("crossit.gandhi.dao.Ci_UserDao.delete", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	} 	
}

