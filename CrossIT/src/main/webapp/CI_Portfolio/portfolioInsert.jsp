 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/Common/include/inc_common.jsp"%>

<%  
	//등록페이지에서 전달받은 파라미터 한글 처리
	request.setCharacterEncoding("UTF-8"); 

	//문의 등록 폼에서 전달받은 파라미터 저장 (username, email, message)
	String username = request.getParameter("portfolio_name");
	String period = request.getParameter("portfolio_period");
	String link = request.getParameter("portfolio_link");

	HashMap<String,Object> hashMap = new HashMap<String,Object>();
	hashMap.put("PF_NAME", username);
	hashMap.put("PF_PERIOD", period);
	hashMap.put("PF_LINK", link);
	hashMap.put("REG_DATE", "");

	//DB에 삽입
	Ci_PortfolioDao pfDao = new Ci_PortfolioDao();
	
	try{
		pfDao.insert(hashMap);	
	} 
	catch(Exception e){
		logger.error(e.getMessage(), e);  
		throw e;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>포트폴리오 등록 확인</title>
</head>
<body>
	<script>
		alert("완료되었습니다.");
		window.location.href = "/CI_Portfolio/portfolioList.jsp"; 
	</script>
</body>
</html>