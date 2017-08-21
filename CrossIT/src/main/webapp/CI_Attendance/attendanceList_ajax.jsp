<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/Common/include/inc_common.jsp"%>

<%
	int nowPage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
	boolean result = false;
	System.out.println("!!!!!!!!");
	
	//기수
	int term = NumberUtils.toInt(request.getParameter("term"));
	System.out.println("기수:"+term);
	
	//출결점수 칼럼 수 (체크박스,이름,잔여,출석,지각,결석,가산)
	int numColScore = 7;
	//전체(출결점수+날짜) 칼럼 수
	int numCol = numColScore + 1;
	
	PageNavigation pageNavigation = new PageNavigation(nowPage);

	
	try {
		Ci_AttendanceDao AttendanceDao = new Ci_AttendanceDao();
		Ci_DateDao DateDao = new Ci_DateDao();
		
		HashMap<String, Object> userHMap = new HashMap<String, Object>();
		userHMap.put("USER_TERM", term);
		HashMap<String, Object> dateHMap = new HashMap<String, Object>();
		dateHMap.put("DT_TERM", term);
		HashMap<String, Object> urHMap = new HashMap<String, Object>();
		urHMap.put("AT_SEQ", SESS_USER_SEQ);
		
		//개수 조회
		int attendTotal = AttendanceDao.selectTotal(userHMap);
		System.out.println("attendTotal:"+attendTotal);
		int dateTotal = DateDao.selectTotal(dateHMap);
		System.out.println("dateTotal:"+dateTotal);
		
		numCol = numColScore + dateTotal + 1;
		System.out.println("numCol:"+numCol);
		
		
		//전체 리스트
		ArrayList<HashMap<String, Object>> attendList = AttendanceDao.selectList(userHMap);
		ArrayList<HashMap<String, Object>> dateList = DateDao.selectList(dateHMap);
		
		//전체 칼럼을 가진 리스트
		ArrayList<HashMap<String, Object>> attendAllList = AttendanceDao.selectAllList(userHMap);
		
		//한 유저에 대한 출결
		HashMap<String, Object> attendByUser = AttendanceDao.selectByUser(urHMap);
		
		
		//현재 페이지 번호를 넣어 클래스 생성
		pageNavigation.setTotalCount(attendTotal);

		userHMap.put("STARTROW", pageNavigation.getStartRow());
		userHMap.put("ENDROW", 10);
%>
<link rel="stylesheet" type="text/css" href="css/attendance.css">
<script type="text/javascript">
	tdValue(<%=attendTotal%>, <%=numCol%>);
	dateClass(<%=attendTotal%>, <%=numColScore+1%>, <%=numCol%>);
</script>
<script type="text/javascript" src="js/attendanceEvent.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
	
	
<!-- form frm 시작 -->
<form id="frm" name="frm" method="post">
	<h4>나의 출결상태 : 잔여(<%=attendByUser.get("at_rest")%>) 출석(<%=attendByUser.get("at_present")%>), 
	지각(<%=attendByUser.get("at_late")%>), 결석(<%=attendByUser.get("at_absent")%>), 가산점(<%=attendByUser.get("at_plus")%>)</h4>
<%
	if(SESS_KIND.equals("A")) {
%>
	<!-- 출결 수정 버튼 -->
	<input type="button" id="attendance-update-btn" class="button" name="attendance-update-btn" value="UPDATE"/><br><br>
<%
	}
%>	
	
	<input type="hidden" id="nowpage" name="nowpage" value="<%=nowPage%>">
	<input type="hidden" id="AT_SEQ" name="AT_SEQ" value=""><br>
	
	
	<!-- 테이블 데이터(row) 총 개수 -->
	<div><span style="color:white;">Total : <strong><%=attendTotal%></strong></span></div>

	<!-- 출결 테이블 -->
	<table class="table-bordered paginated" id="attendance-table">

		<caption></caption>
		<colgroup>
			<col width="3%" class="attendance-check"/>
			<!-- <col width="5%" /> -->
			<col width="6%" />
			<col width="6%" />
			<col width="6%" />
			<col width="6%" />
			<col width="6%" />
			<col width="6%" />
			<%
				for(int i=0 ; i<=dateTotal ; i++) {
			%>		
					<col width="4%" />
			<%
				}
			%>
		</colgroup>
		<thead>
			<tr>
				<th class="attendance-check"><input type="checkbox" name="attendance-check" id="check-all" value="-1" /></th>
				<!-- <th>No</th> -->
				<th>이름</th>
				<th>잔여</th>
				<th>출석</th>
				<th>지각</th>
				<th>결석</th>
				<th>가산점</th>	
				<%
				for(int i=numColScore+1, j=0 ; i<=numCol ; i++, j++) {
					if(i == numCol) {
				%>		
				<th id="td0-<%=i%>" name="last_date" class="last_date">날짜선택&nbsp;
				<input type="hidden" id="start_date<%=i%>" name="start_date<%=i%>" value=""/>
				<input type="button" name="calendar_date<%=i%>" class="calendar" style="display: none;" value="▼" onClick="calendar(event, 'start_date<%=i%>', '#td0-<%=i%>');"></th>
				<%		
					}
					else {
						String date_data = StringUtils.trimToEmpty((String) dateList.get(j).get("DT_DATE"));
						String date_text = date_data.substring(date_data.indexOf("-")+1);
				%>
				<th id="td0-<%=i%>"><%=date_text%>
				<input type="hidden" id="start_date<%=i%>" name="start_date<%=i%>" value="<%=date_data%>"/>
				<input type="button" name="calendar_date<%=i%>" class="calendar" style="display: none;" value="▼" onClick="calendar(event, 'start_date<%=i%>', '#td0-<%=i%>');"></th>
				<%	
					}
				}
				%>
			</tr>
		</thead>
		
		<tbody>
			<%
				if (attendList.size() == 0) {
			%>
			<tr>
				<td colspan="<%=numCol-1%>">Not Search</td>
			</tr>
			<%
				} // if( list.size() == 0 )
					else {

						int index = 0;
						int tmpSeq = 0;
						String tmpUserName = "";
						Float tmpRest = 0F;
						int tmpPresent = 0;
						int tmpLate = 0;
						int tmpAbsent = 0;
						int tmpPlus = 0;

						for (int i = 0, j = i+1 ; i < attendList.size(); i++, j++) {
							tmpSeq = (Integer)(attendList.get(i).get("AT_SEQ"));
							tmpUserName = StringUtils.trimToEmpty((String)attendList.get(i).get("USER_NAME"));
							tmpRest = (Float)(attendList.get(i).get("AT_REST"));
							tmpPresent = (Integer)(attendList.get(i).get("AT_PRESENT"));
							tmpLate = (Integer)(attendList.get(i).get("AT_LATE"));
							tmpAbsent = (Integer)(attendList.get(i).get("AT_ABSENT"));
							tmpPlus = (Integer)(attendList.get(i).get("AT_PLUS"));
			%>
			<tr>
				<td id="td<%=j%>-1" class="attendance-check" ><input type="checkbox" id="chboxVal<%=tmpSeq%>" name="attendance-check" value="<%=j%>"/></td>
				<!--  <td--><!--%=pageNavigation.getListIndex(index++)%--><!-- /td-->
				<td id="td<%=j%>-2"><%=tmpUserName%></td>
				<td id="td<%=j%>-3"><%=tmpRest%><input type="hidden" id="input<%=j%>-3" name="input<%=j%>-3" value="<%=tmpRest%>"/></td>
				<td id="td<%=j%>-4"><%=tmpPresent%><input type="hidden" id="input<%=j%>-4" name="input<%=j%>-4" value="<%=tmpPresent%>"/></td>
				<td id="td<%=j%>-5"><%=tmpLate%><input type="hidden" id="input<%=j%>-5" name="input<%=j%>-5" value="<%=tmpLate%>"/></td>
				<td id="td<%=j%>-6"><%=tmpAbsent%><input type="hidden" id="input<%=j%>-6" name="input<%=j%>-6" value="<%=tmpAbsent%>"/></td>	
				<td id="td<%=j%>-7"><%=tmpPlus%><input type="hidden" id="input<%=j%>-7" name="input<%=j%>-7" value="<%=tmpPlus%>"/></td>
			<%
							for(int k=numColScore+1, m=0 ; k<=numCol ; k++, m++){
								
								if(k == numCol){
			%>
				<td id="td<%=j%>-<%=k%>" class="last_date">
					<input type="hidden" id="input<%=j%>-<%=k%>" name="input<%=j%>-<%=k%>" value=""/>
				</td>
			<%
								}
								else {
									String tmpDate = (String)dateList.get(m).get("DT_DATE");
									tmpDate = tmpDate.replaceAll("-", "_");
			%>
				<td id="td<%=j%>-<%=k%>"><%=attendAllList.get(i).get(tmpDate)%>
					<input type="hidden" id="input<%=j%>-<%=k%>" name="input<%=j%>-<%=k%>" value="<%=attendAllList.get(i).get(tmpDate)%>"/>
				</td>
			<%
								}
							}
			%>	
			</tr>
			<%
						}
					}
					result = true;
				} catch (Exception e) {
					e.printStackTrace();
			%>
			<tr>
				<td colspan="<%=numCol-1%>">Error during Searching</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table><br>


	<!-- 출석/지각/결석/가산/삭제 버튼 -->
  	<input type="button" id="attendance-present-btn" name="attendance-present-btn" value="출석" 
		   onClick="check_atttendance('출석', 'present', 0);" />
	<input type="button" id="attendance-late-btn" name="attendance-late-btn" value="지각"
		   onClick="check_atttendance('지각', 'late', -0.5);" />
	<input type="button" id="attendance-absent-btn" name="attendance-absent-btn" value="결석"
		   onClick="check_atttendance('결석', 'absent', -1);" />
	<input type="button" id="attendance-plus-btn" name="attendance-plus-btn" value="가산"
		   onClick="check_atttendance('가산', 'plus', 1);" />
	<input type="button" id="attendance-remove-btn" name="attendance-remove-btn" value="삭제"
		   onClick="check_atttendance('', '', -2);" /> <br><br>
		   
		   
	<!-- 출결 저장 버튼 -->
	<input type="button" id="attendance-submit" name="attendance-submit"  value="SAVE"/>
	
	
	<!-- 날짜 삭제 버튼 -->
	<input type="button" id="date-delete-btn" name="date-delete-btn" value="날짜 삭제"/><br><br>
	<!-- 날짜 삭제 팝업 -->
	<a href="dateDeletePopup.jsp?term=<%=term%>" style="display:none;" data-width="350" data-height="350" title="날짜 삭제" id="date-popup"></a>
	
	
</form>
<!-- // form frm 종료 -->

<%
	if (result) {
%>
<!-- 페이징 처리 들어가는 부분 -->
<!-- %@ include file="/Common/include/inc_page.jsp"% -->
<%
	}
%>

