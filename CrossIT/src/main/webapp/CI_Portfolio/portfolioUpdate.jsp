<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>

<%  
	request.setCharacterEncoding("UTF-8"); 

	//request 파라미터로 ctSeq 받음
	int pfSeq = Integer.parseInt(request.getParameter("pfSeq"));

	HashMap<String,Object> hashMap = new HashMap<String,Object>();
	hashMap.put("PF_SEQ",pfSeq);

	//받은 ctSeq으로 해당 리스트를 가져옴	
	Ci_PortfolioDao pfDao = new Ci_PortfolioDao();
	HashMap<String,Object> hMap = pfDao.selectOne(hashMap);
	
	//'답장완료'와 '답장미완료'버튼 구별
	//String complete = request.getParameter("complete");

	//'답장완료'
	//if(complete.equals("Yes")){
	//	hMap.put("CT_STATUS", "완료");
	//} 
	//else { //'답장미완료'	
	//	hMap.put("CT_STATUS", "미완료");
	//}
		
	try{
		pfDao.update(hMap);		
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
	<title>포트폴리오 수정</title>
</head>
<body>
	<script type="text/javascript">
		alert("완료되었습니다.");
		window.location.href = "portfolioList.jsp";
	</script>
</body>
</html>
