<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>

<% 
 	request.setCharacterEncoding("UTF-8"); 
	
	//joinList.jsp와 joinView.jsp 중 하나의 파라미터값 가져옴
	String where = request.getParameter("where");
	
	//joinList.jsp에서 수정
	if(where.equals("List")){
		
		//request 파라미터로 받은 선택된 리스트 가져옴 
		String[] checkArr = request.getParameterValues("join-check");
		
		//선택된 것이 없음
		if(checkArr == null){
			%>
			<script type="text/javascript">
				alert("선택된 리스트가 없습니다.");
				window.location.href = "joinList.jsp";
			</script>
<%
		}
		else {
			for(String value : checkArr){
				//int로 변환
				int urSeq = Integer.parseInt(value);
				//전체 수정 시, 테이블 최상단 제외
				if(urSeq != -1){
					
					//리스트 수정
					HashMap<String,Object> hashMap = new HashMap<String,Object>();
					hashMap.put("USER_SEQ", urSeq);
					
					Ci_UserDao urDao = new Ci_UserDao();
					
					HashMap<String,Object> hMap = urDao.selectById(hashMap);
					
					hMap.put("USER_STATUS", 'Y');
					hMap.put("USER_KIND", 'U');
					hMap.put("USER_TERM", 1);
					
					try{
						urDao.updateStatus(hMap);		
					} 
					catch(Exception e){
						logger.error(e.getMessage(), e);  
						throw e;
					}
				}			
			}
		}		
	}
	else { //joinView.jsp에서 수정
		
		//request 파라미터로 urSeq 받음
		int urSeq = Integer.parseInt(request.getParameter("USER_SEQ"));

		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put("USER_SEQ",urSeq);

		//받은 urSeq으로 해당 리스트를 수정
		Ci_UserDao urDao = new Ci_UserDao();
		
		HashMap<String,Object> hMap = urDao.selectById(hashMap);
		
		hMap.put("USER_STATUS", 'Y');
		hMap.put("USER_KIND", 'U');
		hMap.put("USER_TERM", 1);
		
		try{
			urDao.updateStatus(hMap);		
		} 
		catch(Exception e){
			logger.error(e.getMessage(), e);  
			throw e;
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 승인</title>
</head>
<body>
	<script type="text/javascript">
		alert("완료되었습니다.");
		window.location.href = "joinList.jsp";
	</script>
</body>
</html>