<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>

<%  
	request.setCharacterEncoding("UTF-8"); 

	//request 파라미터로 ctSeq 받음
	int ctSeq = Integer.parseInt(request.getParameter("ctSeq"));

	HashMap<String,Object> hashMap = new HashMap<String,Object>();
	hashMap.put("CT_SEQ",ctSeq);

	//받은 ctSeq으로 해당 리스트를 가져옴	
	Ci_ContactDao ctDao = new Ci_ContactDao();
	HashMap<String,Object> hMap = ctDao.selectOne(hashMap);
	
	//'답장완료'와 '답장미완료'버튼 구별
	String complete = request.getParameter("complete");

	//'답장완료'
	if(complete.equals("Yes")){
		hMap.put("CT_STATUS", "완료");
	} 
	else { //'답장미완료'	
		hMap.put("CT_STATUS", "미완료");
	}
		
	try{
		ctDao.updateStatus(hMap);		
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
	<title>문의 수정</title>
</head>
<body>
	<script type="text/javascript">
		alert("완료되었습니다.");
		window.location.href = "contactList.jsp";
	</script>
</body>
</html>
