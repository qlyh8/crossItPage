<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>


<%  
	request.setCharacterEncoding("UTF-8"); 

	//request 파라미터로 CT_SEQ 받음
	int pfSeq = Integer.parseInt(request.getParameter("PF_SEQ"));
	
	
	HashMap<String,Object> hashMap = new HashMap<String,Object>();
	hashMap.put("PF_SEQ",pfSeq);

	//받은 CT_SEQ으로 해당 리스트를 가져옴	
	Ci_PortfolioDao pfDao = new Ci_PortfolioDao();
	HashMap<String,Object> hMap = pfDao.selectOne(hashMap);
	
	String period = (String)hMap.get("PF_PERIOD");
	if(period == null)
		period = "";
%>  


<%@ include file="/Common/include/inc_header.jsp"%>

	
	<link rel="stylesheet" type="text/css" href="css/portfolioView.css">
</head>
<body>
	
	<!-- Top Menu -->
	<%@ include file="/Common/include/inc_top.jsp"%>

	
	<div class="portfolioView_grid">
	
		<br><h2>상세 내용</h2><br>
	
		<input type="button" class="btn1" name="listButton" value="돌아가기" 
			   onclick="javascript:window.location.href = 'portfolioList.jsp';">

		<input type="button" class="btn2" name="deleteButton" value="포트폴리오 삭제" 
			   onclick="javascript:window.location.href = 'portfolioDelete.jsp?pfSeq=<%= pfSeq %>&where=View';">
		<br>
	
		<table>
			<tr>
				<td class="td1">포트폴리오명</td>
				<td class="td2"><%= hMap.get("PF_NAME") %></td>
			</tr>
			<tr>
				<td class="td1">참여명단</td>
				<td class="td2"><%= hMap.get("PF_PARTLIST") %></td>
			</tr>
			<tr>
				<td class="td1">분야</td>
				<td class="td2"><%= hMap.get("PF_SECTION") %></td>
			</tr>
			<tr>
				<td class="td1">개발목적</td>
				<td class="td2"><%= hMap.get("PF_OBJV") %></td>
			</tr>
			<tr>
				<td class="td1">개발기간</td>
				<td class="td2"><%= period %></td>
			</tr>
			<tr>
				<td class="td1">등록일시</td>
				<td class="td2"><%= hMap.get("REG_DATE") %></td>
			</tr>
		</table>
	</div>
	
	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
