package crossit.gandhi.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Ci_AttendanceDao {
	private transient final Logger logger = LoggerFactory.getLogger(getClass());
	
	private SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSession();
	
 
	//리스트 삽입
	public int insert(HashMap<String,Object> hMap) throws Exception{
		
		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try{
			result = session.insert("crossit.gandhi.dao.Ci_AttendanceDao.insert", hMap);
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
	
	
	//칼럼 추가
	public int addColumn() throws Exception{

		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try{
			result = session.insert("crossit.gandhi.dao.Ci_AttendanceDao.addColumn");
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
			result = (ArrayList)session.selectList("crossit.gandhi.dao.Ci_AttendanceDao.selectList", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);   throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	} 
	
	
	//전체 칼럼을 가지는 리스트 전체 선택
	@SuppressWarnings("unchecked")
	public ArrayList<HashMap<String,Object>> selectAllList(HashMap<String,Object> hMap) throws Exception{  

		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<HashMap<String,Object>> result = null;

		try {
			result = (ArrayList)session.selectList("crossit.gandhi.dao.Ci_AttendanceDao.selectAllList", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);   throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	} 

	
	//한 유저에 대한 리스트
	@SuppressWarnings("unchecked")
	public HashMap<String,Object> selectByUser(HashMap<String,Object> hMap) throws Exception{  

		SqlSession session = sqlSessionFactory.openSession();
		HashMap<String,Object> result = null;
		try {
			result = (HashMap<String,Object>)session.selectOne("crossit.gandhi.dao.Ci_AttendanceDao.selectByUser", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e; 	
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	}
		
		
	//리스트 총 갯수
	public Integer selectTotal(HashMap<String,Object> hMap) throws Exception{   

		SqlSession session = sqlSessionFactory.openSession();
		Integer result = null;
		
		try {
			result = (Integer)session.selectOne("crossit.gandhi.dao.Ci_AttendanceDao.selectTotal", hMap) ;
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	
			throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;  
	} 
	
	
	//한 개 리스트 변경
	public int update(HashMap<String,Object> hMap) throws Exception{ 
		
		int result = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			result = (Integer) session.update("crossit.gandhi.dao.Ci_AttendanceDao.update", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	}
	
	
	//한 개 리스트 변경 - 날짜 칼럼
	public int updateDate(HashMap<String,Object> hMap) throws Exception{ 

		int result = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();

		try{
			result = (Integer) session.update("crossit.gandhi.dao.Ci_AttendanceDao.updateDate", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	}
	
	
	//칼럼명 변경
	public int changeColumn(HashMap<String,Object> hMap) throws Exception{

		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try{
			result = (Integer)session.update("crossit.gandhi.dao.Ci_AttendanceDao.changeColumn", hMap);
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
	
	
	//칼럼명 변경2
	public int changeColumn2(HashMap<String,Object> hMap) throws Exception{

		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();

		try{
			result = (Integer)session.update("crossit.gandhi.dao.Ci_AttendanceDao.changeColumn2", hMap);
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
		
		
	//리스트 한 개 삭제
	public int delete(HashMap<String,Object> hMap) throws Exception{ 
		
		int result = 0 ; 

		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			result = (Integer) session.delete("crossit.gandhi.dao.Ci_AttendanceDao.delete", hMap);
			session.commit();
		}catch(Exception e) {
			logger.error(e.getMessage(), e);	throw e;
		}finally {
			if(session != null) { try{ session.close(); }catch(Exception e){} }
		}
		return result ;
	} 
}
