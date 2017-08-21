<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	Ci_UserDao userDao = new Ci_UserDao();

	HashMap<String, Object> hMap = new HashMap<String, Object>();
	hMap.put("USER_SEQ", SESS_USER_SEQ);


	HashMap<String, Object> userInfo = userDao.selectById(hMap);
	
	String id = (String)userInfo.get("USER_ID");
	int term = (Integer)userInfo.get("USER_TERM");
	String name = (String)userInfo.get("USER_NAME");
	String birth = (String)userInfo.get("USER_BIRTH");
	String gender = (String)userInfo.get("USER_GENDER");
	String phone = (String)userInfo.get("USER_PHONE");
	String address = (String)userInfo.get("USER_ADDR");
	String part = (String)userInfo.get("USER_PART");
	
	String univ = (String)userInfo.get("USER_UNIV");
	String major = (String)userInfo.get("USER_MAJOR");
	String enter = (String)userInfo.get("USER_ENTER");
	String stat = (String)userInfo.get("USER_STAT");
	
	String place = (String)userInfo.get("USER_PLACE");
	String leave = (String)userInfo.get("USER_LEAVE");
	String overtime = (String)userInfo.get("USER_OVERTIME");
	String wendwork = (String)userInfo.get("USER_WENDWORK");
%>
<%@ include file="/Common/include/inc_header.jsp"%>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/user.css">
<script type="text/javascript" src="js/user.js"></script>
</head>
<body>
	<!-- Top Menu -->
	<%@ include file="/Common/include/inc_top.jsp"%>
	
	<br><br><br>
	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">내 정보</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3 col-lg-3 " align="center">
								<img alt="User Pic"
									src="/Common/images/user.png"
									class="img-circle img-responsive">
							</div>

							<div class=" col-md-9 col-lg-9 ">
							<form method="post" action="userInfo.jsp">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>아이디</td>
											<td><%=id%></td>
										</tr>
										<tr>
											<td>이름</td>
											<td><%=name%></td>
										</tr>
										<tr>
											<td>생년월일</td>
											<td><%=birth%></td>
										</tr>
										<tr>
											<td>성별</td>
											<td><%=gender%></td>
										</tr>
										<tr>
											<td>휴대폰번호</td>
											<td><%=phone%></td>
										</tr>
										<tr>
											<td>주소</td>
											<td><%=address%></td>
										</tr>
										
										<%
										if(!univ.equals("no_data") || !major.equals("no_data") 
												|| !enter.equals("no_data") || !stat.equals("no_data")){
										%>
										<tr>
											<td>학교</td>
											<td><%=univ%></td>
										</tr>
										<tr>
											<td>학과/학부</td>
											<td><%=major%></td>
										</tr>
										<tr>
											<td>입학년도</td>
											<td><%=enter%></td>
										</tr>
										<tr>
											<td>학적상태</td>
											<td><%=stat%></td>
										</tr>
										<%
										} else {
										%>
											<%
											if(place != null){
											%>
										<tr>
											<td>직장명</td>
											<td><%=place%></td>
										</tr>
											<%
											}
											%>
										<tr>
											<td>연차</td>
											<td><%=leave%></td>
										</tr>
										<tr>
											<td>야근빈도</td>
											<td><%=overtime%></td>
										</tr>
										<tr>
											<td>주말출근정도</td>
											<td><%=wendwork%></td>
										</tr>
										<%
										}
										%>
										
										<tr>
											<td>기수</td>
											<td><%=term%>기</td>
										</tr>
										<tr>
											<td>분야</td>
											<td><%=part%></td>
										</tr>
									</tbody>
								</table>
								</form>
							</div>
						</div>
					</div>
					<div class="panel-footer">	 
						<a href="userWrite.jsp?type=1" class="btn btn-primary">정보 수정하기</a>
						<a href="#" class="btn btn-warning">비밀번호 변경</a>	
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
		
		