<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.net.*, java.text.*, java.io.*, org.slf4j.*,org.apache.ibatis.session.*"%>
<%@page import="org.apache.commons.lang3.*, org.apache.commons.lang3.math.*"%>
<%@page import="crossit.gandhi.util.*, crossit.gandhi.dao.*"%>
<%
	
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	
	request.setCharacterEncoding("UTF-8"); 
		
  	Logger logger = LoggerFactory.getLogger(getClass());

  	
	/////////////////////////////////////////////////////////////////////////////
	// 세션 검사
	/////////////////////////////////////////////////////////////////////////////  
	int SESS_USER_SEQ 		= NumberUtils.toInt(String.valueOf(WebUtils.getSessionAttribute(request, "USER_SEQ"))) ;
	String SESS_ID 			= StringUtils.trimToEmpty((String)WebUtils.getSessionAttribute(request, "USER_ID")) ;
	String SESS_NAME 		= StringUtils.trimToEmpty((String)WebUtils.getSessionAttribute(request, "USER_NAME")) ;
	String SESS_KIND 		= StringUtils.trimToEmpty((String)WebUtils.getSessionAttribute(request, "USER_KIND")) ; 
	
	
	 
	System.out.println("SESS_USER_SEQ ------------>"+ SESS_USER_SEQ);
	System.out.println("SESS_ID ------------>"+ SESS_ID  );
	System.out.println("SESS_NAME ------------>"+ SESS_NAME  );
	System.out.println("SESS_KIND ------------>"+ SESS_KIND  );
	
	
	/* if( SESS_USER_SEQ==0 || SESS_ID.equals("") ){  
		out.println("<script>alert('로그아웃된 상태입니다. 로그인하신 후 사용해 주세요.'); location.href='/index.jsp'</script>");
		return; 
	}   */
	
	
/* 	String FileUploadPath = PropertiesUtil.getProperites("FileUploadPath");
	
	System.out.println("FileUploadPath ------------>"+ FileUploadPath  ); */
	
%>