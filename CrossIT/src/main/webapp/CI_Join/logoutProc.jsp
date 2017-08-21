<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>
<%
 	request.setCharacterEncoding("UTF-8"); 

	WebUtils.sessionAllRemove(request);
	%>
	
	<script type="text/javascript">
	alert("로그아웃 되었습니다.");
	window.location.href="/index.jsp";
	</script>
	
	<%
 %> 