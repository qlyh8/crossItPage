<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="org.apache.commons.lang3.*, org.apache.commons.lang3.math.*"%>

<%@ include file="/Common/include/inc_common.jsp"%>
<%	


	String[] allowFileExt = new String[]{"doc","docx","hwp","pdf","zip","jpg","txt","ppt","pptx","xls","xlsx"};
	String FileUploadPath = PropertiesUtil.getProperites("FileUploadPath") + "/NOTICE";
	
	File saveDir = new File(FileUploadPath); // cutewebi가 폴더명
	
	if( !saveDir.exists() ){ 	
		saveDir.mkdirs();
	    System.out.println("FileUploadPath - created the directory.");	
	} 
	else {
		System.out.println("FileUploadPath 디렉토리를 생성에 실패했습니다..");	
	}
	
	FileUploadUtil fu = new FileUploadUtil(request, FileUploadPath, allowFileExt);
	
	fu.upload("UPLOAD_FILE");
	
	String NOTI_ORG_FILE_NM = fu.getOrgFileNm();
	String NOTI_SAVE_FILE_NM = fu.getSaveFileNm();
	String NOTI_FILE_PATH = fu.getFilePath();
	
/*	fu.upload("UPLOAD_FILE1");
      String NOTI_ORG_FILE_NM1 = fu.getOrgFileNm();
	  String NOTI_SAVE_FILE_NM1 = fu.getSaveFileNm();
	  String NOTI_FILE_PATH1 = fu.getFilePath();
	fu.upload("UPLOAD_FILE2");
	fu.upload("UPLOAD_FILE3");
	*/
 
	int nowpage = NumberUtils.toInt(String.valueOf(fu.getValue("nowpage")), 1); 

	String ORDER = fu.getValue("order");
	String NOTI_TITLE = fu.getValue2("noti_title");
	String NOTI_CONTENT = fu.getValue2("noti_content");
	
	
	
	
	boolean result = false;
	String msg = "";
	
	try {
		
		HashMap<String,Object> hMap = new HashMap<String,Object>();
		
		if( ORDER.equals("REGIST") ) {
			
			System.out.println("nowpage = "+nowpage);
			System.out.println("ORDER = "+ORDER);
			System.out.println("NOTI_TITLE = "+NOTI_TITLE);
			System.out.println("NOTI_CONTENT = "+NOTI_CONTENT);
			
			Ci_NoticeDao noticeDao = new Ci_NoticeDao();
			
			HashMap<String,Object> noticeMap = new HashMap<String,Object>();

			noticeMap.put("NOTI_TITLE", NOTI_TITLE);
			noticeMap.put("NOTI_CONTENT", NOTI_CONTENT);
			noticeMap.put("REG_USER_SEQ", SESS_USER_SEQ);
			
			
			noticeMap.put("FILE_PATH", 	"");
			noticeMap.put("ORG_FILE_NM", "");
			noticeMap.put("SAVE_FILE_NM", "");
			
			if( !NOTI_ORG_FILE_NM.trim().equals("") ) {
				noticeMap.put("NOTI_ORG_FILE_NM", NOTI_ORG_FILE_NM);
				noticeMap.put("NOTI_SAVE_FILE_NM", NOTI_SAVE_FILE_NM);
				noticeMap.put("NOTI_FILE_PATH", NOTI_FILE_PATH);
			}
			
						
			int rtn = noticeDao.insert(noticeMap);
			
			System.out.println("rtn: "+rtn);
			
			hMap.clear();
						
			result = true;
			msg = "글이 등록되었습니다.";		
		}
		else if( ORDER.equals("MODIFY") ) {
			
			System.out.println("2nowpage = "+nowpage);
			System.out.println("2ORDER = "+ORDER);
			System.out.println("2NOTI_TITLE = "+NOTI_TITLE);
			System.out.println("2NOTI_CONTENT = "+NOTI_CONTENT);
			
			int NOTI_SEQ = NumberUtils.toInt(String.valueOf(fu.getValue("NOTI_SEQ")), 0);
			System.out.println("NOTI_SEQ = "+NOTI_SEQ);
			
			if( NOTI_SEQ != 0){
				
				Ci_NoticeDao noticeDao = new Ci_NoticeDao();
				
				HashMap<String,Object> noticeMap = new HashMap<String,Object>();
							
				noticeMap.put("NOTI_SEQ", NOTI_SEQ);
				noticeMap.put("NOTI_TITLE", NOTI_TITLE);
				noticeMap.put("NOTI_CONTENT", NOTI_CONTENT);
				noticeMap.put("USER_SEQ", SESS_USER_SEQ);
				
				noticeMap.put("NOTI_ORG_FILE_NM", "");
				noticeMap.put("NOTI_SAVE_FILE_NM", "");
				noticeMap.put("NOTI_FILE_PATH", "");
				
				if( !NOTI_ORG_FILE_NM.trim().equals("") ) {
					noticeMap.put("NOTI_ORG_FILE_NM", NOTI_ORG_FILE_NM);
					noticeMap.put("NOTI_SAVE_FILE_NM", NOTI_SAVE_FILE_NM);
					noticeMap.put("NOTI_FILE_PATH", NOTI_FILE_PATH);
				}
				 
									
	
				int rtn = noticeDao.update(noticeMap);			
				
				System.out.println("rtn: "+rtn);
				noticeMap.clear();
				
				result = true;
				msg = "글이 수정되었습니다.";
			}					
		}else if( ORDER.equals("DELETE") ) {
			 
            int NOTI_SEQ = NumberUtils.toInt(String.valueOf(fu.getValue("NOTI_SEQ")), 0);
			
			if( NOTI_SEQ != 0){
				
				Ci_NoticeDao noticeDao = new Ci_NoticeDao();
				
				HashMap<String,Object> noticeMap = new HashMap<String,Object>();
							
				noticeMap.put("NOTI_SEQ", NOTI_SEQ);
	
				int rtn =noticeDao.delete(noticeMap);			
				
				System.out.println("rtn: "+rtn);
				noticeMap.clear();
				
				result = true;
				msg = "글이 삭제되었습니다.";
			}
		}
	}
	catch(Exception e) {
		e.printStackTrace();
		msg = "An error occurred during processing";
	}
	
	
%>


<body onLoad="goList()">
<form id="listFrm" name="listFrm"  action="noticeList.jsp" method="post">
	<input type="hidden" id="nowpage" name="nowpage" value="<%=nowpage%>">	
</form>
</body>

<script type="text/javascript">
function goList() {	
	alert("<%=msg%>");
	document.listFrm.submit();
}
</script>
