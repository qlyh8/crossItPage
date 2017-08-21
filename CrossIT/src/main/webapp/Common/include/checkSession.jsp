<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, org.slf4j.* "%>
<%@ page import="org.apache.commons.lang3.*, org.apache.commons.lang3.math.*"%>
<%@ page import="crossit.gandhi.util.*, crossit.gandhi.dao.*"%>
<%

	response.setDateHeader("Expires",0);
	response.setHeader("Cache-Control","no-cache");
		
	int SESS_USER_SEQ 		= NumberUtils.toInt(String.valueOf(WebUtils.getSessionAttribute(request, "USER_SEQ"))) ;
	String SESS_ID 			= StringUtils.trimToEmpty((String)WebUtils.getSessionAttribute(request, "USER_ID")) ;

	if( SESS_USER_SEQ==0 || SESS_ID.equals("") ){  
		out.print("F");
		return;
	}
	
	 out.print("T");
		
%>