<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>
<%@ include file="/Common/include/inc_header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8"); 

	int term = Integer.parseInt(request.getParameter("term")); 	//기수

	Ci_DateDao DateDao = new Ci_DateDao();

	HashMap<String, Object> dtHashMap = new HashMap<String, Object>();
	dtHashMap.put("DT_TERM", term);

	//받은 term값으로 날짜 리스트를 가져옴	
	ArrayList<HashMap<String, Object>> dateList = DateDao.selectList(dtHashMap);
	
	int total = DateDao.selectTotal(dtHashMap);					//날짜 총 개수
%>

	<link rel="stylesheet" type="text/css" href="css/attendance.css">
	<script type="text/javascript" src="js/attendanceEvent.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
</head>
<body>
	<h2>삭제할 날짜를 선택하세요.</h2>
	
	<form id="frm-date-delete" name="frm-date-delete" method="post">
	
		<ul class="pop-ul">
			<li class="pop-li">
			 <input type="checkbox" id="chboxDate" name="date-check" value="-1"/>
			 날짜
			</li>
		<%
		for(int i=0 ; i<total ; i++){
		%>
			<li class="pop-li">
			 <input type="checkbox" id="chboxDate<%=dateList.get(i).get("DT_SEQ")%>" name="date-check" value="<%=dateList.get(i).get("DT_SEQ")%>"/>
			 <%=dateList.get(i).get("DT_DATE") %>
			</li>
		<%
		}
		%>
		</ul>
	</form><br><br>
	
	
	<input type="button" id="pop-date-delete-btn" name="pop-date-delete-btn" value="삭제" onClick="date_delete(<%=term%>, 'delete');"/>
</body>
</html>