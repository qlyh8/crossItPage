<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="org.apache.commons.lang3.*, org.apache.commons.lang3.math.*"%>

<%@ include file="/Common/include/inc_common.jsp"%>
<%
	request.setCharacterEncoding("UTF-8"); 

	String[] allowFileExt = new String[]{"doc","docx","hwp","pdf","zip","jpg","txt","ppt","pptx","xls","xlsx"};
	String FileUploadPath = PropertiesUtil.getProperites("FileUploadPath") + "/JOIN";
	
	File saveDir = new File(FileUploadPath);
	
	if( !saveDir.exists() ){ 	
		saveDir.mkdirs();
	    System.out.println("FileUploadPath - created the directory.");	
	} 
	else {
		System.out.println("FileUploadPath 디렉토리를 생성에 실패했습니다..");	
	}
	
	FileUploadUtil fu = new FileUploadUtil(request, FileUploadPath, allowFileExt);
	
	fu.upload("UPLOAD_FILE");
	
	String ORG_FILE_NM = fu.getOrgFileNm();
	String SAVE_FILE_NM = fu.getSaveFileNm();
	String FILE_PATH = fu.getFilePath();
	
	String ORDER = fu.getValue("order");
	
	String USER_ID = fu.getValue("id");
	String USER_BIRTH = fu.getValue("birth");
	String USER_PHONE = fu.getValue("phone");
	String USER_ADDR = fu.getValue2("address");
	String USER_PART = fu.getValue2("part");
	
	String USER_UNIV = fu.getValue2("univ");
	String USER_MAJOR = fu.getValue2("major");
	String USER_ENTER = fu.getValue2("enter");
	String USER_STAT = fu.getValue2("stat");
	
	String USER_PLACE = fu.getValue2("place");
	String USER_LEAVE = fu.getValue2("leave");
	String USER_OVERTIME = fu.getValue2("overtime");
	String USER_WENDWORK = fu.getValue2("wendwork");
	
	if(USER_UNIV.isEmpty() && USER_MAJOR.isEmpty() && USER_ENTER.isEmpty() && USER_STAT.isEmpty()){
		USER_UNIV = "no_data";
		USER_MAJOR = "no_data";
		USER_ENTER = "no_data";
		USER_STAT = "no_data";
	}
	else if(USER_PLACE.isEmpty() && USER_LEAVE.isEmpty() && USER_OVERTIME.isEmpty() && USER_WENDWORK.isEmpty()){
		USER_PLACE = "no_data";
		USER_LEAVE = "no_data";
		USER_OVERTIME = "no_data";
		USER_WENDWORK = "no_data";
	}
	
	System.out.println("order="+ORDER);
	System.out.println("id="+USER_ID+" birth="+USER_BIRTH+" phone="+USER_PHONE+" address="+USER_ADDR+" part="+USER_PART);
	System.out.println("univ="+USER_UNIV+" major="+USER_MAJOR+" enter="+USER_ENTER+" stat="+USER_STAT);
	System.out.println("place="+USER_PLACE+" leave="+USER_LEAVE+" overtime="+USER_OVERTIME+" wendwork="+USER_WENDWORK);
	
	boolean result = false;
	String msg = "";
	
	try {
		
		HashMap<String,Object> hMap = new HashMap<String,Object>();
		
		if( ORDER.equals("MODIFY") ) {
	
			if (SESS_ID != null) {

				Ci_UserDao userDao = new Ci_UserDao();

				hMap.put("USER_SEQ", SESS_USER_SEQ);

				hMap.put("USER_ID", SESS_ID);
				hMap.put("USER_BIRTH", USER_BIRTH);
				hMap.put("USER_PHONE", USER_PHONE);
				hMap.put("USER_ADDR", USER_ADDR);
				hMap.put("USER_PART", USER_PART);

				hMap.put("USER_UNIV", USER_UNIV);
				hMap.put("USER_MAJOR", USER_MAJOR);
				hMap.put("USER_ENTER", USER_ENTER);
				hMap.put("USER_STAT", USER_STAT);

				hMap.put("USER_PLACE", USER_PLACE);
				hMap.put("USER_LEAVE", USER_LEAVE);
				hMap.put("USER_OVERTIME", USER_OVERTIME);
				hMap.put("USER_WENDWORK", USER_WENDWORK);

				//	hMap.put("ORG_FILE_NM", "");
				//	hMap.put("SAVE_FILE_NM", "");
				//	hMap.put("FILE_PATH", "");

				//	if( !ORG_FILE_NM.trim().equals("") ) {
				//		hMap.put("ORG_FILE_NM", ORG_FILE_NM);
				//		hMap.put("SAVE_FILE_NM", SAVE_FILE_NM);
				//		hMap.put("FILE_PATH", FILE_PATH);
				//	}

				int rtn = userDao.updateInfo(hMap);

				System.out.println("rtn: " + rtn);
				hMap.clear();

				result = true;
				msg = "수정되었습니다.";
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		msg = "An error occurred during processing";
	}
%>


<body onLoad="goList()">
<form id="listFrm" name="listFrm"  action="userInfo.jsp" method="post">
</form>
</body>

<script type="text/javascript">
function goList() {	
	alert("<%=msg%>");
	document.listFrm.submit();
}
</script>
