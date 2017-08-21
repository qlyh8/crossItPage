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
				<form id="frm" name="frm" method="post" action="userProc.jsp" enctype="multipart/form-data" >
         		 <input type="hidden" name="order" id="order" value="MODIFY" >
					<div class="panel-heading">
						<h3 class="panel-title"></h3>
					</div>		
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3 col-lg-3 " align="center">
								<img alt="User Pic"
									src="/Common/images/user.png"
									class="img-circle img-responsive">
							</div>

							<div class=" col-md-9 col-lg-9 ">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>아이디</td>
											<td><%=id%></td>
										<tr>
											<td>이름</td>
											<td><%=name%></td>
										</tr>
										<tr>
											<td>생년월일</td>
											<td><input type="text" id="birth" name="birth" size="50" value="<%=birth%>" placeholder="YYMMDD"/></td>
										</tr>
										<tr>
											<td>성별</td>
											<td><%=gender%></td>
										</tr>
										<tr>
											<td>휴대폰번호</td>
											<td><input type="text" id="phone" name="phone" size="50" value="<%=phone%>" placeholder="01012345678"/></td>
										</tr>
										<tr>
											<td>주소</td>
											<td><input type="text" id="address" name="address" size="50" value="<%=address%>" placeholder="OO시OO구OO동"/></td>
										</tr>
										<tr>
											<td>기수</td>
											<td><%=term%>기</td>
										</tr>
										<tr>
											<td>분야</td>
											<td><input type="text" id="part" name="part" size="50" value="<%=userInfo.get("USER_PART")%>" placeholder="기획/개발/디자인"/></td>
										</tr>
										<%
										if(!univ.equals("no_data") || !major.equals("no_data") 
												|| !enter.equals("no_data") || !stat.equals("no_data")){
										%>
										<tr>
											<td>학교</td>
											<td><input type="text" id="univ" name="univ" size="50" value="<%=univ%>" placeholder="학교"/></td>
										</tr>
										<tr>
											<td>학과/학부</td>
											<td><input type="text" id="major" name="major" size="50" value="<%=major%>" placeholder="학과/학부"/></td>
										</tr>
										<tr>
											<td>입학년도</td>
											<td><input type="text" id="enter" name="enter" size="50" value="<%=enter%>" placeholder="2xxx년도/O학년"/></td>
										</tr>
										<tr>
											<td>학적상태</td>
											<td><input type="text" id="stat" name="stat" size="50" value="<%=stat%>" placeholder="재학/휴학/졸업"/></td>
										</tr>
										<%
										} else {
										%>
										<tr>
											<td>직장명</td>
											<td><input type="text" id="place" name="place" size="50" value="<%=place%>" placeholder="직장명"/></td>
										</tr>
										<tr>
											<td>연차</td>
											<td><input type="text" id="leave" name="leave" size="50" value="<%=leave%>" placeholder="O년차"/></td>
										</tr>
										<tr>
											<td>야근빈도</td>
											<td><input type="text" id="overtime" name="overtime" size="50" value="<%=overtime%>" placeholder="없음/보통/잦음"/></td>
										</tr>
										<tr>
											<td>주말출근정도</td>
											<td><input type="text" id="wendwork" name="wendwork" size="50" value="<%=wendwork%>" placeholder="없음/종종 /항상"/></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<input type="submit" class="btn btn-primary" style="margin-left:40%;" value="수정완료"/>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
		
		