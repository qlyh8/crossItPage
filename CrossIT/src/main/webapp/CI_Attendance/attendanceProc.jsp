<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>
<%@ include file="/Common/include/inc_header.jsp"%>
<script type="text/javascript" src="js/attendanceEvent.js"></script>

<%
	request.setCharacterEncoding("UTF-8"); 
	
	int term = Integer.parseInt(request.getParameter("term"));		//기수
	String process = request.getParameter("process");				//수정, 삭제
		
	
	Ci_AttendanceDao AttendanceDao = new Ci_AttendanceDao();
	Ci_DateDao DateDao = new Ci_DateDao();

	
	if(process.equals("update")){									//수정
		
		HashMap<String, Object> atHashMap = new HashMap<String, Object>();
		atHashMap.put("USER_TERM", term);
		HashMap<String, Object> dtHashMap = new HashMap<String, Object>();
		dtHashMap.put("DT_TERM", term);

		//받은 term값으로 출결,날짜 리스트를 가져옴	
		ArrayList<HashMap<String, Object>> attendanceList = AttendanceDao.selectList(atHashMap);
		ArrayList<HashMap<String, Object>> dateList = DateDao.selectList(dtHashMap);

		int numRows = AttendanceDao.selectTotal(atHashMap); 		//기수 기준 목록 수
		int numDateCols = DateDao.selectTotal(dtHashMap); 			//날짜 칼럼 수
		int numAttendCols = 7; 										//출결점수 칼럼 수 (체크박스,이름,잔여,출석,지각,결석,가산)

		//테이블 3~7열의 td value 값을 받음 
		for (int i = 0; i < numRows; i++) {
			int j = i + 1;

			//잔여,출석,지각,결석,가산 값 수정
			String rest = request.getParameter("input" + j + "-" + 3);
			String present = request.getParameter("input" + j + "-" + 4);
			String late = request.getParameter("input" + j + "-" + 5);
			String absent = request.getParameter("input" + j + "-" + 6);
			String plus = request.getParameter("input" + j + "-" + 7);

			HashMap<String, Object> updateHMap = new HashMap<String, Object>();

			updateHMap.put("AT_REST", Float.parseFloat(rest));
			updateHMap.put("AT_PRESENT", Integer.parseInt(present));
			updateHMap.put("AT_LATE", Integer.parseInt(late));
			updateHMap.put("AT_ABSENT", Integer.parseInt(absent));
			updateHMap.put("AT_PLUS", Integer.parseInt(plus));
			updateHMap.put("AT_SEQ", (Integer) (attendanceList.get(i).get("AT_SEQ")));

			try {
				AttendanceDao.update(updateHMap);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
				throw e;
			}
		}

		
		
		/*****************************************************************************************/
		//테이블 최상단 날짜 칼럼의  value 값을 받아 변경된 칼럼을 update
		for (int i = 0, j = numAttendCols + 1; i < numDateCols; i++, j++) {

			//request 파라미터를 통해 날짜 칼럼을 가져옴
			String startDate = request.getParameter("start_date" + j);
			String oldDate = (String)dateList.get(i).get("DT_DATE");
			System.out.println("#start_date=" + startDate + " DT_DATE=" + dateList.get(i).get("DT_DATE"));
			
			//변경 사항이 있을 경우 update
			if (!startDate.equals((String) dateList.get(i).get("DT_DATE"))) {

				HashMap<String, Object> updateDateHMap = new HashMap<String, Object>();
				updateDateHMap.put("DT_TERM", term);
				updateDateHMap.put("DT_DATE", startDate);
				updateDateHMap.put("DT_SEQ", (Integer) (dateList.get(i).get("DT_SEQ")));
				DateDao.update(updateDateHMap);
				
				HashMap<String, Object> change2DateHMap = new HashMap<String, Object>();
				String oldNewDate = oldDate.replaceAll("-", "_");
				String startNewDate = startDate.replaceAll("-", "_");
				change2DateHMap.put("OLD_DATE", oldNewDate);
				change2DateHMap.put("NEW_DATE", startNewDate);
				AttendanceDao.changeColumn2(change2DateHMap);
			}
		}

		
		//새 날짜 칼럼을 insert
		int newCol = numAttendCols + numDateCols + 1;
		String newDate = request.getParameter("start_date" + newCol);

		//새로 추가할 경우
		if (newDate != "") {

			HashMap<String, Object> insertDateHMap = new HashMap<String, Object>();
			insertDateHMap.put("DT_TERM", term);
			insertDateHMap.put("DT_DATE", newDate);
			DateDao.insert(insertDateHMap);
			
			
			//날짜 칼럼에 출석/지각/결석/가산 추가
			for (int i = 1 ; i <= numRows; i++) {
				String newText = request.getParameter("input"+i+"-"+newCol);
				
				HashMap<String, Object> updateDateHMap = new HashMap<String, Object>();
				updateDateHMap.put("AT_DATE", newText);
				updateDateHMap.put("AT_SEQ", attendanceList.get(i-1).get("AT_SEQ"));
				AttendanceDao.updateDate(updateDateHMap);
			}
			
			
			//칼럼명을 추가한 칼럼명으로 변경
			HashMap<String, Object> changeDateHMap = new HashMap<String, Object>();
			String replaceDate = newDate.replaceAll("-", "_");
			changeDateHMap.put("AT_DATE", replaceDate);
			AttendanceDao.changeColumn(changeDateHMap);
			
			
			//'at_date' 새 칼럼 추가
			AttendanceDao.addColumn();
		}
%>
	<script type="text/javascript">
	alert("저장되었습니다.");
	window.location.href = "attendanceList.jsp";
	</script>
<%	
	}

	/*********************************************************************************************/
	else if (process.equals("delete")) {
		//request 파라미터로 받은 선택된 문의 가져옴 
		String[] checkArr = request.getParameterValues("date-check");

		//선택된 것이 없음
		if (checkArr == null) {
%>
	<script type="text/javascript">
		window.close();
	</script>
<%
		} 
		else {
			for (String value : checkArr) {
				//int로 변환
				int dtSeq = Integer.parseInt(value);
				//전체 삭제 시, 테이블 최상단 제외
				if (dtSeq != -1) {
					//리스트 삭제
					HashMap<String, Object> hashMap = new HashMap<String, Object>();
					hashMap.put("DT_SEQ", dtSeq);

					try {
						DateDao.delete(hashMap);
					} catch (Exception e) {
						logger.error(e.getMessage(), e);
						throw e;
					}
				}
			}
%>
	<script type="text/javascript">
	alert("저장되었습니다.");
	opener.parent.location="attendanceList.jsp"; 
	window.close();
	</script>
<%
		}
	}
%>
