<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/Common/include/inc_common.jsp"%>

<%  
	//등록페이지에서 전달받은 파라미터 한글 처리
	request.setCharacterEncoding("UTF-8"); 

	//문의 등록 폼에서 전달받은 파라미터 저장 (username, email, message)
	String username = request.getParameter("contact_name");
	String email = request.getParameter("contact_email");
	String message = request.getParameter("contact_message");

	HashMap<String,Object> hashMap = new HashMap<String,Object>();
	hashMap.put("CT_NAME", username);
	hashMap.put("CT_EMAIL", email);
	hashMap.put("CT_CONTENT", message);
	hashMap.put("REG_DATE", "");

	//DB에 삽입
	Ci_ContactDao ctDao = new Ci_ContactDao();
	
	try{
		ctDao.insert(hashMap);	
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
	<title>문의 등록 확인</title>
</head>
<body>
	<script>
		alert("완료되었습니다.");
		window.location.href = "/index.jsp"; 
	</script>
</body>
</html>