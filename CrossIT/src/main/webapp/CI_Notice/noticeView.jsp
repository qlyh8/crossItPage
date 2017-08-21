<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>

<%

    int nowpage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
	int NOTI_SEQ = NumberUtils.toInt(request.getParameter("NOTI_SEQ"));
	
	Ci_NoticeDao noticeDao = new Ci_NoticeDao();
	
	HashMap<String,Object> hMap = new HashMap<String,Object>();	
	hMap.put("NOTI_SEQ", NOTI_SEQ);
	
	noticeDao.increseCnt(hMap); 	
	
	HashMap<String,Object> noticeInfo = noticeDao.selectOne(hMap); 
	
	String Content = StringUtils.replace(StringUtils.trimToEmpty(String.valueOf(noticeInfo.get("CONTENT"))), "\r\n", "<br/>"); 
	
	String NOTI_TITLE = String.valueOf(noticeInfo.get("NOTI_TITLE"));
	String NOTI_CONTENT = String.valueOf(noticeInfo.get("NOTI_CONTENT"));
	String REG_DATE = String.valueOf(noticeInfo.get("REG_DATE"));
	String NOTI_ORG_FILE_NM = String.valueOf(noticeInfo.get("NOTI_ORG_FILE_NM"));
	String NOTI_SAVE_FILE_NM = String.valueOf(noticeInfo.get("NOTI_SAVE_FILE_NM"));
	String NOTI_FILE_PATH = String.valueOf(noticeInfo.get("NOTI_FILE_PATH"));
	String USER_NAME = String.valueOf(noticeInfo.get("USER_NAME"));
%>

<%@ include file="/Common/include/inc_header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/noticeView.css">
<script type="text/javascript">

function goList(){
	$("#frm").attr("method", "get");
	$("#frm").attr("action", "noticeList.jsp");

	$("#frm").submit();
}

function modify(seq){
	
	$("#frm").attr("method", "post");
	$("#frm").attr("action", "noticeModify.jsp?NOTI_SEQ="+seq);

	$("#frm").submit();
}


function downFile(seq)
{
	location.href='/Common/include/download.jsp?seq=' +seq;
}

</script>

</head>
<body>
	
	<!-- Top Menu -->
	<%@ include file="/Common/include/inc_top.jsp"%>


	<div class="notice_container">
		
			
      
		<form name="frm" id="frm">
          <input type="hidden" name="order" id="order" >
          <input type="hidden" name="NOTI_SEQ" id="NOTI_SEQ" >
	      
	      <h2 style="padding-top:30px;"> 공지 상세내용</h2><br>
			
			<div>
				<span style="color:white;">작성자 : <strong><%=USER_NAME %></strong></span>
			</div>
			
			<table class="table table-bordered">
				<tr>
 					<th>제목</th>
					<td colspan="3" class="size"><%=NOTI_TITLE %></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><%=NOTI_CONTENT%></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<%
						if (!NOTI_ORG_FILE_NM.equals("null")) {
					%>
					<td colspan="3" class="size">
						<a href="javascript: downFile('<%=NOTI_SEQ%>')"><%=NOTI_ORG_FILE_NM%></a>
					</td>
					<%
                         } else {
                    %>
					<td colspan="3" class="size">없음</td>
					<%
                         }
                    %>
				</tr>
				<tr>
                    <th>등록일</th>
                    <td colspan="3" class="size"><%=REG_DATE %></td>
				</tr>
 			</table>
               
                
             <div>
           		  <input type="button" class="btn1" style="border:1px solid #4683b6;" value=" 목록 " onclick="javascript:goList()">
           		  <%
					if(SESS_KIND.equals("A") || (SESS_NAME.equals(USER_NAME))){
           		  %>
                  <input type="button" class="btn2" style="border:1px solid #4683b6;" value=" 수정 " onclick="javascript:modify('<%=NOTI_SEQ%>')">
                  <%
           		  }
                  %>
             </div>
         </form>
      	
	</div>
	


	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
		
		