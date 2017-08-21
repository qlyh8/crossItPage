<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*, java.net.*, java.text.*, java.io.*, org.slf4j.*,org.apache.ibatis.session.*"%>
<%@page import="org.apache.commons.lang3.*, org.apache.commons.lang3.math.*, org.apache.commons.lang3.time.*"%>
<%@page import="crossit.gandhi.util.*, crossit.gandhi.dao.*"%>

<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	
	request.setCharacterEncoding("UTF-8"); 
		
  	Logger logger = LoggerFactory.getLogger(getClass());
  
  	
  	/****************************************************************************************/
  	String msg = "";
	String scriptContent = "";	
	int rtn = 0;
	boolean result = false;
	
	//파일설정
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
	
	FileUploadUtil fileUpload = new FileUploadUtil(request, FileUploadPath, allowFileExt);
	
	fileUpload.upload("photo");
	
	String ORG_FILE_NM = fileUpload.getOrgFileNm();
	String SAVE_FILE_NM = fileUpload.getSaveFileNm();
	String FILE_PATH = fileUpload.getFilePath();
	System.out.println("ORG_FILE_NM = " + ORG_FILE_NM + " SAVE_FILE_NM = " + SAVE_FILE_NM + " FILE_PATH = " + FILE_PATH);
	
/*	fileUpload.upload("UPLOAD_FILE1");
      String ORG_FILE_NM1 = fileUpload.getOrgFileNm();
	  String SAVE_FILE_NM1 = fileUpload.getSaveFileNm();
	  String FILE_PATH1 = fileUpload.getFilePath();
	  fileUpload.upload("UPLOAD_FILE2");
	  fileUpload.upload("UPLOAD_FILE3");
	*/
	
	/* 학생 or 직장인 */
	String type1 = "";
	String type2 = "";
	type1 = fileUpload.getValue("s_type");
	type2 = fileUpload.getValue("w_type");
	if (type1 == null) {
		type1 = "";
	} else if (type2 == null) {
		type2 = "";
	}
	System.out.println("$type1 = " + type1 + " $type2 = " + type2);

	
	/* 값 초기화 */
	String idcheck = null;
	String id = null;
	String pw1 = null;
	String pw2 = null;
	String name = null;
	String birth = null;
	String gender = null;
	String phone = null;
	String address = null;
	String part = null;
	String motive = null;
	String letmein = null;
	String lastword = null;
	String univ = null;
	String major = null;
	String enter = null;
	String stat = null;
	String place = null;
	String leave = null;
	String overtime = null;
	String wendwork = null;
	

	/* 아이디 중복 체크 */
	if (type1.equals("student")) {
		idcheck = fileUpload.getValue("s_event_idcheck");
		System.out.println("$event_idcheck = " + idcheck);
	} else if (type2.equals("worker")) {
		idcheck = fileUpload.getValue("w_event_idcheck");
		System.out.println("$event_idcheck = " + idcheck);
	}

	if (!idcheck.equals("OK")) {

		msg = "아이디 중복체크를 해주세요.";
		scriptContent = "history.back();";
	}

	id = fileUpload.getValue("id");
	pw1 = fileUpload.getValue("password1");
	pw2 = fileUpload.getValue("password2");
	//name = fileUpload.getValue("name");
	name = fileUpload.getValue2("name");
	birth = fileUpload.getValue("birth");
	//gender = fileUpload.getValue("gender");
	gender = fileUpload.getValue2("gender");
	
	univ = fileUpload.getValue("univ");
	major = fileUpload.getValue("major");
	enter = fileUpload.getValue("enter");
	stat = fileUpload.getValue("stat");
	
	place = fileUpload.getValue("place");
	leave = fileUpload.getValue("leave");
	overtime = fileUpload.getValue("overtime");
	wendwork = fileUpload.getValue("wendwork");
	
	phone = fileUpload.getValue("phone");
	address = fileUpload.getValue("address");
	//part = fileUpload.getValue("part");
	part = fileUpload.getValue2("part");
	
	letmein = fileUpload.getValue("letmein");
	motive = fileUpload.getValue("motive");
	lastword = fileUpload.getValue("lastword"); 

	if (type1.equals("student")) {
		place = "no_data";
		leave = "no_data";
		overtime = "no_data";
		wendwork = "no_data";
	}

	if (type2.equals("worker")) {
		univ = "no_data";
		major = "no_data";
		enter = "no_data";
		stat = "no_data";
	}

	System.out.println("$id = " + id);
	System.out.println("$pw1 = " + pw1 + " $pw2 = " + pw2);
	System.out.println("$name = " + name + " $birth = " + birth + " $gender = " + gender);
	System.out.println("$phone = " + phone + " $address = " + address + " $part = " + part);
	System.out.println("$univ = " + univ + " $major = " + major + " $enter = " + enter + " $stat = " + stat);
	System.out.println("$place = " + place + " $leave = " + leave + " $overtime = " + overtime + " $wendwork = "
			+ wendwork);
	
	//입력한 값 확인
/*	if (pw1.equals("") || pw2.equals("") || name.equals("") || birth.equals("") || gender.equals("")
			|| phone.equals("") || address.equals("") || part.equals("") || motive.equals("")
			|| letmein.equals("") || lastword.equals("") || univ.equals("") || major.equals("")
			|| enter.equals("") || stat.equals("") || leave.equals("")
			|| overtime.equals("") || wendwork.equals("") || ORG_FILE_NM.trim().equals("")) {

		out.println("<script>alert('정보를 모두 입력해주세요.'); history.back();	</script>");
		return;
	}*/

	//비밀번호 확인
	if (!pw1.equals(pw2)) {
		out.println("<script>alert('비밀번호가 맞지 않습니다.'); history.back();	</script>");
		return;
	}
	
	try {
		Ci_UserDao userDao = new Ci_UserDao();
		Ci_AttendanceDao attendanceDao = new Ci_AttendanceDao();

		HashMap<String, Object> hMap = new HashMap<String, Object>();
		HashMap<String, Object> atHMap = new HashMap<String, Object>();
		
		hMap.put("USER_ID", id);
		hMap.put("USER_PW", pw1);
		hMap.put("USER_NAME", name);
		hMap.put("USER_BIRTH", birth);
		hMap.put("USER_GENDER", gender);
		hMap.put("USER_PHONE", phone);
		hMap.put("USER_ADDR", address);
		hMap.put("USER_PART", part);
		hMap.put("USER_LETMEIN", letmein);
		hMap.put("USER_MOTIVE", motive);
		hMap.put("USER_LASTWORD", lastword);
		hMap.put("USER_UNIV", univ);	
		hMap.put("USER_MAJOR", major);
		hMap.put("USER_ENTER", enter);
		hMap.put("USER_STAT", stat);
		hMap.put("USER_PLACE", place);
		hMap.put("USER_LEAVE", leave);
		hMap.put("USER_OVERTIME", overtime);
		hMap.put("USER_WENDWORK", wendwork);
		hMap.put("ORG_FILE_NM", "");
		hMap.put("SAVE_FILE_NM", "");
		hMap.put("FILE_PATH", "");
		

		if (!ORG_FILE_NM.trim().equals("")) {
			hMap.put("ORG_FILE_NM", ORG_FILE_NM);
			hMap.put("SAVE_FILE_NM", SAVE_FILE_NM);
			hMap.put("FILE_PATH", FILE_PATH);
		}

		rtn = userDao.insertUser(hMap);
		System.out.println("rtn: " + rtn);
		if (rtn == 1) {
			msg = "회원가입 되었습니다. \\n승인을 기다려주세요.";
			scriptContent = "location.href='/index.jsp';";
		}

		hMap.clear();
		
		//생성된 유저 번호를 출결에 삽입
		int seq=0;
		hMap.put("USER_ID", id);
		seq = userDao.selectOne(hMap);
		
		if(seq == 0){
			System.out.println("fail to get user seq.");
		}
		else{
			atHMap.put("AT_SEQ", seq);
			attendanceDao.insert(atHMap);
		}
		
		result = true;

	} catch (Exception e) {

		e.printStackTrace();
		msg = "An error occurred during processing";
		scriptContent = "history.back();";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	<%=scriptContent%>
	window.location.href="/index.jsp";
</script>
