<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>

<%

    int nowpage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
	int NOTI_SEQ = NumberUtils.toInt(request.getParameter("NOTI_SEQ"), 0);
	
	Ci_NoticeDao noticeDao = new Ci_NoticeDao();
	
	HashMap<String,Object> hMap = new HashMap<String,Object>();	
	hMap.put("NOTI_SEQ", NOTI_SEQ);
	
	//noticeDao.increseCnt(hMap); 	
	
	HashMap<String,Object> noticeInfo = noticeDao.selectOne(hMap); 
	
	String Content = StringUtils.replace(StringUtils.trimToEmpty(String.valueOf(noticeInfo.get("CONTENT"))), "\r\n", "<br/>"); 
	
	String NOTI_TITLE = String.valueOf(noticeInfo.get("NOTI_TITLE"));
	String NOTI_CONTENT = String.valueOf(noticeInfo.get("NOTI_CONTENT"));
	String REG_DATE = String.valueOf(noticeInfo.get("REG_DATE"));
	String NOTI_ORG_FILE_NM = String.valueOf(noticeInfo.get("NOTI_ORG_FILE_NM"));
	String NOTI_SAVE_FILE_NM = String.valueOf(noticeInfo.get("NOTI_SAVE_FILE_NM"));
	String NOTI_FILE_PATH = String.valueOf(noticeInfo.get("NOTI_FILE_PATH"));
	String USER_NAME = String.valueOf(noticeInfo.get("USER_NAME"));
	 
	if(NOTI_ORG_FILE_NM.equals("null")){
		NOTI_ORG_FILE_NM = "없음";
	}
	
%>

<%@ include file="/Common/include/inc_header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/noticeWrite.css">
<script type="text/javascript">

function goList(){
	$("#frm").attr("method", "get");
	$("#frm").attr("action", "noticeList.jsp");

	$("#frm").submit();
}

function modify(seq){
	$("#order").val("MODIFY");
	$("#frm").attr("method", "post");
	$("#frm").attr("action", "noticeProc.jsp?NOTI_SEQ="+seq);

	$("#frm").submit();
}

function deleteNoti(seq){
	$("#order").val("DELETE");
	$("#frm").attr("method", "post");
	$("#frm").attr("action", "noticeProc.jsp?NOTI_SEQ="+seq);

	$("#frm").submit();
}

function downFile(seq)
{
	location.href='/Common/include/download.jsp?seq=' +seq;
}

</script>

</head>
<body>
<!-- <div id="container"> -->


		<!-- Top Menu -->
		<%@ include file="/Common/include/inc_top.jsp"%>
<section id="hire">
		<div class = "form">
		
			<h1> 공지 수정</h1>
 	
 			<form name="frm" id="frm" class="login-form" enctype="multipart/form-data" >
				<input type="hidden" name="nowpage" id="nowpage" value="<%=nowpage%>">
         		 <input type="hidden" name="order" id="order" >
	     
            	<input type="text" name="noti_title" id="noti_title" placeholder="제목" value="<%=NOTI_TITLE %>"/>
 				<textarea name="noti_content" id="noti_content" class="textarea" placeholder="내용"><%=NOTI_CONTENT %></textarea>
           
            	<input type="file" name="UPLOAD_FILE" id="UPLOAD_FILE" placeholder="<%=NOTI_ORG_FILE_NM%>">
           
				<div class="button_grid">
					<input type="button" value=" 수정 " style="padding:0;" class="button_grid_left button_padding_zero" onclick="javascript:modify('<%=NOTI_SEQ%>')" style="margin-left:45%;" />
					<input type="button" value=" 삭제 " style="padding:0;" onclick="javascript:deleteNoti('<%=NOTI_SEQ%>')">
					<input type="button" value=" 목록 " style="padding:0;" class="button_grid_right button_padding_zero" onclick="javascript:goList()" />
				</div>
          </form>
          
        </div>
    </section>


		<!-- footer -->
		<%@ include file="/Common/include/inc_footer.jsp"%>
		
		