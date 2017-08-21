<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, org.slf4j.* "%>
<%@ page import="org.apache.commons.lang3.*, org.apache.commons.lang3.math.*"%>
<%@ page import="crossit.gandhi.util.*, crossit.gandhi.dao.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>아이디 중복확인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/Common/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="/Common/bootstrap/css/custom.css">
	<link rel="stylesheet" type="text/css" href="css/signup.css">
	<script type="text/javascript" src="/Common/js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="/Common/js/jquery-ui-1.8.16.custom.min.js"></script>
	<script type="text/javascript" src="/Common/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<%  
	request.setCharacterEncoding("UTF-8");

	String id, form_name = null;
	id = request.getParameter("id"); 					//id
	form_name = request.getParameter("form_name"); 		//form 이름 (s_frm or w_frm)
	if(id == null || form_name == null){
		id = "";
		form_name = "";
	}
	System.out.println("form_name:" + form_name + " id:" + id);
	
	Ci_UserDao userDao = new Ci_UserDao();
	HashMap<String, Object> hMap = new HashMap<String, Object>();
	hMap.put("USER_ID", id); 

	int idCnt = userDao.idCnt(hMap);							//중복 검사

	if (idCnt == 0) {
	%>	
	
	<h4 align="center" style="color:white"><%=id%>는 가능한 아이디입니다.</h4><br><br>
	<script type="text/javascript">
		opener.document.<%=form_name%>.id.value = "<%=id%>"; 
	</script>
	<input class="form-control" type="button" value="확인" onclick="javascript:opener=self;self.close();"/>
	
	<%
	}
	else {
	%>
	
	<h4 align="center" style="color:white">존재하는 아이디입니다.</h4><br>
	<form method="post" action="checkId.jsp?form_name=<%=form_name%>">
		<input class="form-control" type="text" name="id" placeholder="아이디 입력"><br>
		<input class="form-control" type="submit" value="중복확인" />
	</form>	
	
	<%
	}
%>
</body>
</html>