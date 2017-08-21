<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>

<% 
 	request.setCharacterEncoding("UTF-8"); 
	
	//contactList.jsp와 contactView.jsp 중 하나의 파라미터값 가져옴
	String where = request.getParameter("where");
	
	//contactList.jsp에서 삭제
	if(where.equals("List")){
		
		//request 파라미터로 받은 선택된 문의 가져옴 
		String[] checkArr = request.getParameterValues("portfolio-check");
		
		
		//선택된 것이 없음
		if(checkArr == null){
			%>
			<script type="text/javascript">
				alert("선택된 포트폴리오가 없습니다.");
				window.location.href = "portfolioList.jsp";
			</script>
			<%
		}
		else {
			for(String value : checkArr){
				//int로 변환
				int pfSeq = Integer.parseInt(value);
				//전체 삭제 시, 테이블 최상단 제외
				if(pfSeq != -1){
					//리스트 삭제
					HashMap<String,Object> hashMap = new HashMap<String,Object>();
					hashMap.put("PF_SEQ",pfSeq);
					
					Ci_PortfolioDao pfDao = new Ci_PortfolioDao();
					
					try{
						pfDao.delete(hashMap);		
					} 
					catch(Exception e){
						logger.error(e.getMessage(), e);  
						throw e;
					}		
				}			
			}
		}		
	}
	else { //contactView.jsp에서 삭제
		
		//request 파라미터로 ctSeq 받음
		int pfSeq = Integer.parseInt(request.getParameter("pfSeq"));

		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put("PF_SEQ",pfSeq);

		//받은 ctSeq으로 해당 리스트를 삭제
		Ci_PortfolioDao pfDao = new Ci_PortfolioDao();
		
		try{
			pfDao.delete(hashMap);	
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
	<title>포트폴리오 삭제</title>
</head>
<body>
	<script type="text/javascript">
		alert("삭제되었습니다.");
		window.location.href = "portfolioList.jsp";
	</script>
</body>
</html>