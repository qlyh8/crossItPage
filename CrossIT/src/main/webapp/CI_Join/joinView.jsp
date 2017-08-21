<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

    int nowpage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
	int urSeq = NumberUtils.toInt(request.getParameter("USER_SEQ"));
	
	HashMap<String,Object> hMap = new HashMap<String,Object>();	
	hMap.put("USER_SEQ", urSeq);
	
	//받은 USER_SEQ으로 해당 리스트를 가져옴	
	Ci_UserDao urDao = new Ci_UserDao();
	HashMap<String,Object> userInfo = urDao.selectById(hMap);
	String USER_KIND = String.valueOf(userInfo.get("USER_KIND"));
	String USER_STATUS = String.valueOf(userInfo.get("USER_STATUS"));
	int USER_TERM = Integer.parseInt(String.valueOf(userInfo.get("USER_TERM")));
	
	String USER_ID = String.valueOf(userInfo.get("USER_ID"));
	String USER_NAME = String.valueOf(userInfo.get("USER_NAME"));
	String USER_BIRTH = String.valueOf(userInfo.get("USER_BIRTH"));
	String USER_GENDER = String.valueOf(userInfo.get("USER_GENDER"));
	String USER_PHONE = String.valueOf(userInfo.get("USER_PHONE"));
	String USER_ADDR = String.valueOf(userInfo.get("USER_ADDR"));
	String USER_PART = String.valueOf(userInfo.get("USER_PART"));

	String USER_LETMEIN = StringUtils.replace(StringUtils.trimToEmpty(String.valueOf(userInfo.get("USER_LETMEIN"))), "\r\n", "<br/>");
	String USER_MOTIVE = StringUtils.replace(StringUtils.trimToEmpty(String.valueOf(userInfo.get("USER_MOTIVE"))), "\r\n", "<br/>");
	String USER_LASTWORD = StringUtils.replace(StringUtils.trimToEmpty(String.valueOf(userInfo.get("USER_LASTWORD"))), "\r\n", "<br/>");
	
	if(USER_LETMEIN.equals("null"))
		USER_LETMEIN = "";
	if(USER_MOTIVE.equals("null"))
		USER_MOTIVE = "";
	if(USER_LASTWORD.equals("null"))
		USER_LASTWORD = "";
	
	String REG_DATE =  String.valueOf(userInfo.get("REG_DATE"));
	
	if(REG_DATE.equals("null"))
		REG_DATE = "";
	
	String USER_UNIV = String.valueOf(userInfo.get("USER_UNIV"));
	String USER_MAJOR = String.valueOf(userInfo.get("USER_MAJOR"));
	String USER_ENTER = String.valueOf(userInfo.get("USER_ENTER"));
	String USER_STAT = String.valueOf(userInfo.get("USER_STAT"));
	
	String USER_PLACE = String.valueOf(userInfo.get("USER_PLACE"));
	
	if(USER_PLACE.equals("null"))
		USER_PLACE = "";
	
	String USER_LEAVE = String.valueOf(userInfo.get("USER_LEAVE"));
	String USER_OVERTIME = String.valueOf(userInfo.get("USER_OVERTIME"));
	String USER_WENDWORK = String.valueOf(userInfo.get("USER_WENDWORK"));
	
//	String ORG_FILE_NM = String.valueOf(userInfo.get("ORG_FILE_NM"));
//	String SAVE_FILE_NM = String.valueOf(userInfo.get("SAVE_FILE_NM"));
//	String FILE_PATH = String.valueOf(userInfo.get("FILE_PATH"));
%>

<%@ include file="/Common/include/inc_header.jsp"%>
	
	<link rel="stylesheet" type="text/css" href="/Common/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="/Common/bootstrap/css/custom.css">
	<link rel="stylesheet" type="text/css" href="css/signup.css">
	<script type="text/javascript" src="/Common/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript">

	function goList(){
		$("#frm").attr("method", "get");
		$("#frm").attr("action", "joinList.jsp");

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

	<form name="frm" id="frm">
	<!--<input type="hidden" name="order" id="order"> 
		<input type="hidden" name="USER_SEQ" id="USER_SEQ"> -->
	</form>
		

	<div class="container user_table">
	<!-- <form method="post" action="joinProc.jsp" enctype="multipart/form-data"> -->
		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3"><h4>회원가입 상세정보</h4></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td style="width:110px;">
						<h5>승인상태</h5>
					</td>
					<td>
						<input class="form-control" type="text" maxlength="50" value="<%=USER_STATUS%>" />
					</td>
					<td rowspan="7">
						<h4>본인 소개</h4>
						<textarea class="form-control form-big" rows="12" maxlength="2048"><%=USER_LETMEIN%></textarea>
					</td>
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>유형</h5>
					</td>
					<td>
						<input class="form-control" type="text" maxlength="50" value="<%=USER_KIND%>" />
					</td>
				</tr>
				<tr>
					<td style="width:50px;">
						<h5>기수</h5>
					</td>
					<td style="width:450px;" colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_TERM%>"/>
					</td>
				</tr>
				<tr>
					<td style="width:50px;">
						<h5>아이디</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_ID%>"/>
					</td>
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>이름</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_NAME%>"/>
					</td>
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>생년월일</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_BIRTH%>"/>
					</td>
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>성별</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_GENDER%>"/>
					</td>
				</tr>
				<tr>
				<%
					if(!USER_UNIV.equals("no_data") && !USER_MAJOR.equals("no_data") 
						&& !USER_ENTER.equals("no_data") && !USER_STAT.equals("no_data")){
				%>
					<td style="width:110px;">
						<h5>학교</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_UNIV%>"/>
					</td>
				<%
					} else {
				%>
					<td style="width:110px;">
						<h5>직장명</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_PLACE%>"/>
					</td>
				<%
					}
				%>	
					<td rowspan="6">
						<h4>지원 동기</h4>
						<textarea class="form-control form-big2" rows="12" maxlength="2048"><%=USER_MOTIVE%></textarea>
					</td>
				</tr>
				<%
					if(!USER_UNIV.equals("no_data") && !USER_MAJOR.equals("no_data") 
						&& !USER_ENTER.equals("no_data") && !USER_STAT.equals("no_data")){
				%>
				<tr>
					<td style="width:110px;">
						<h5>학과</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_MAJOR%>"/>
					</td>
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>입학년도</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_ENTER%>"/>
					</td>					
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>학적상태</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_STAT%>"/>
					</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td style="width:110px;">
						<h5>연차</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_LEAVE%>"/>
					</td>
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>야근빈도</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_OVERTIME%>"/>
					</td>					
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>주말출근정도</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_WENDWORK%>"/>
					</td>
				</tr>
				<%
					}
				%>	
				<tr>
					<td style="width:110px;">
						<h5>휴대폰번호</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_PHONE%>"/>
					</td>
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>주소</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_ADDR%>"/>
					</td>	
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>분야</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=USER_PART%>"/>
					</td>
					<td rowspan="2">
						<h4>하고 싶은 말</h4>
						<textarea class="form-control form-big2" rows="3" maxlength="2048"><%=USER_LASTWORD%></textarea>
					</td>
				</tr>
				<tr>
					<td style="width:110px;">
						<h5>가입일</h5>
					</td>
					<td colspan="1">
						<input class="form-control" type="text" maxlength="20" value="<%=REG_DATE%>"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input class="btn btn-primary submit" style="color: black; background-color:#D9EDF7; margin-left: -70px;"
						type="button" value="목록" onclick="javascript:goList()"/>
						<input class="btn btn-primary submit" style="color: black; background-color:#D9EDF7; margin-left: -190px;" 
						type="button" value="승인" onclick="javascript:window.location.href = 'joinUpdate.jsp?USER_SEQ=<%=urSeq%>&where=View';"/>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- </form> -->
	</div>
<!-- </div> -->	
</body>
</html>

<!-- footer -->
<%@ include file="/Common/include/inc_footer.jsp"%>

