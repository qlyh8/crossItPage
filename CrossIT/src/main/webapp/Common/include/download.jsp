<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="/Common/include/inc_common.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	int NOTI_SEQ = NumberUtils.toInt(request.getParameter("seq"), 0);
	
	String FileUploadPath = PropertiesUtil.getProperites("FileUploadPath") + "/NOTICE";

	Ci_NoticeDao noticeDao = new Ci_NoticeDao();

	HashMap<String, Object> hMap = new HashMap<String, Object>();
	hMap.put("NOTI_SEQ", NOTI_SEQ);

	HashMap<String, Object> noticeInfo = noticeDao.selectOne(hMap);


	String NOTI_ORG_FILE_NM = String.valueOf( noticeInfo.get("NOTI_ORG_FILE_NM"));
	String NOTI_SAVE_FILE_NM = String.valueOf( noticeInfo.get("NOTI_SAVE_FILE_NM"));
	String NOTI_FILE_PATH = String.valueOf( noticeInfo.get("NOTI_FILE_PATH"));
	
	System.out.println("NOTI_ORG_FILE_NM = "+ NOTI_ORG_FILE_NM);
	System.out.println("NOTI_SAVE_FILE_NM = "+ NOTI_SAVE_FILE_NM);
	System.out.println("NOTI_FILE_PATH = "+ NOTI_FILE_PATH);

	out.clear();
	DownUtil downutil = new DownUtil();
	downutil.download(request, response, FileUploadPath, NOTI_SAVE_FILE_NM, NOTI_ORG_FILE_NM);

	 
%>