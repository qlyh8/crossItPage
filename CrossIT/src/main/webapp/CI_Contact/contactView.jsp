<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>


<%  
	request.setCharacterEncoding("UTF-8"); 

	//request 파라미터로 CT_SEQ 받음
	int ctSeq = Integer.parseInt(request.getParameter("CT_SEQ"));

	HashMap<String,Object> hashMap = new HashMap<String,Object>();
	hashMap.put("CT_SEQ",ctSeq);

	//받은 CT_SEQ으로 해당 리스트를 가져옴	
	Ci_ContactDao ctDao = new Ci_ContactDao();
	HashMap<String,Object> hMap = ctDao.selectOne(hashMap);
	
	//조회수 증가
	try{
		ctDao.updateCnt(hMap);
	} 
	catch(Exception e){
		logger.error(e.getMessage(), e);  
		throw e;
	}
%>  


<%@ include file="/Common/include/inc_header.jsp"%>

	
<!-- <link rel="stylesheet" type="text/css" href="css/contact.css">  -->
	<link rel="stylesheet" type="text/css" href="css/contactView.css">
</head>
<body>
	
	<!-- Top Menu -->
	<%@ include file="/Common/include/inc_top.jsp"%>

	<div class="contact_container">
		<div class="contact_grid">	
			<br><h2>상세 내용</h2><br>
			
		   
			<div>
				<span style="color:white;">조회수 : <strong><%= hMap.get("CT_CNT") %></strong></span>
			</div>
			<table>
				<tr>
					<td class="td1 size">문의자</td>
					<td class="td2"><%= hMap.get("CT_NAME") %></td>
					<td class="td1">문의자 이메일</td>
					<td class="td2"><%= hMap.get("CT_EMAIL") %></td>
				</tr>
				
				<tr>
					<td class="td1">문의내용</td>
					<td class="td2" colspan="3"><%= hMap.get("CT_CONTENT") %></td>
				</tr>
				<tr>
					<td class="td1 size">등록일시</td>
					<td class="td2"><%= hMap.get("REG_DATE") %></td>
					<td class="td1">답장상태</td>
					<td class="td2"><%= hMap.get("CT_STATUS") %></td>
				</tr>
			</table>
			<br>
			<div class="button_grid">
				<input type="button" name="listButton" value="돌아가기" class="button button_back"
				   onclick="javascript:window.location.href = 'contactList.jsp';">

				<input type="button" name="deleteButton" value="문의 삭제" class="button button_delete"
					   onclick="javascript:window.location.href = 'contactDelete.jsp?ctSeq=<%= ctSeq %>&where=View';">

				<input type="button" name="completeButton" value="답장 완료" class="button button_complete"
				   onclick="javascript:window.location.href = 'contactUpdate.jsp?ctSeq=<%= ctSeq %>&complete=Yes';">
		   
				<input type="button" name="completeCancelButton" value="답장 미완료" class="button button_notcomplete"
		 		  onclick="javascript:window.location.href = 'contactUpdate.jsp?ctSeq=<%= ctSeq %>&complete=No';">
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
