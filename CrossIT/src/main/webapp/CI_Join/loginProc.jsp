<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*, java.net.*, java.io.*, org.slf4j.*, java.text.*"%>
<%@page import="org.apache.commons.lang3.*, org.apache.commons.lang3.math.*, org.apache.commons.lang3.time.*"%>
<%@page import="crossit.gandhi.util.*, crossit.gandhi.dao.*"%> 
<%
 	request.setCharacterEncoding("UTF-8"); 
 	
 	Logger logger = LoggerFactory.getLogger(getClass());
 	//현재날짜
 	Date toDay = new Date();
 	SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddkkmm");
 	StringBuffer dateResult = new StringBuffer();

 	dateFormat.format(toDay, dateResult, new FieldPosition(1));
 	String todayDate = dateResult.toString();
 	int nowDate = Integer.parseInt(todayDate);	
 	 
 	String ALERT_LOGIN_WRONGIDPW = "로그인 아이디가 없거나 패스워드가 다릅니다.";
 	String ALERT_LOGIN_INPUTIDPW = "아이디와 패스워드를 입력해 주세요.";
 	String USER_IP = request.getRemoteAddr() ;
 	
 	
 	//파라미터 처리
 	String ID = StringUtils.trimToEmpty(request.getParameter("id"));
 	String PW = StringUtils.trimToEmpty(request.getParameter("pw"));  
 	System.out.println(ID);
 	System.out.println(PW);
 	
 	
 	if(ID.equals("") || PW.equals("")){
 		out.println("<script>alert('"+ALERT_LOGIN_INPUTIDPW+"');history.back();</script>");
 		return ;
 	}
 		
 	HashMap<String,String> hashMap = new HashMap<String,String>();
 	hashMap.put("USER_ID",ID);
 	hashMap.put("USER_PW",PW);
 	
 	Ci_UserDao userDao = new Ci_UserDao();

 	HashMap<String,String> hMap = userDao.login(hashMap);
 	
 	if(hMap == null){
 		out.println("<script>alert('"+ALERT_LOGIN_WRONGIDPW+"');history.back();</script>");
 		return ;
 	}

 	if(StringUtils.trimToEmpty((String)(hMap.get("USER_ID"))).isEmpty() ){
 		out.println("<script>alert('"+ALERT_LOGIN_WRONGIDPW+"');history.back();</script>");
 		return; 
 	}
 	else{   
 		
 		String kind = StringUtils.trimToEmpty(hMap.get("USER_KIND"));
 		
 		//세션에 로그인 정보 넣기
 		WebUtils.setSessionAttribute(request,  "USER_SEQ"   , StringUtils.trimToEmpty(String.valueOf(hMap.get("USER_SEQ"))));
 		WebUtils.setSessionAttribute(request,  "USER_NAME"   , StringUtils.trimToEmpty(String.valueOf(hMap.get("USER_NAME"))));		
 		WebUtils.setSessionAttribute(request,  "USER_ID"    , ID); 
 		WebUtils.setSessionAttribute(request,  "USER_KIND"    , kind );

 		System.out.println("Login :: " + nowDate + " -- " + StringUtils.trimToEmpty(String.valueOf(hMap.get("USER_SEQ"))) + " -- " + ID ) ;
 		
 		//회원 구분(관리자:A, 일반유저:U, 비회원:N)
 		if( kind.equals("U") )
 	out.println("<script>this.location.href='/index.jsp';</script>");
 		else 
 	out.println("<script>this.location.href='/index.jsp';</script>");
 	}
 %> 