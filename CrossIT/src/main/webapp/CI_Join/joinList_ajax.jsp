<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/Common/include/inc_common.jsp"%>
<%
	int nowPage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
	boolean result = false;

	System.out.println("!!!!!!!!");
	
	PageNavigation pageNavigation = new PageNavigation(nowPage);

	try {
		Ci_UserDao UserDao = new Ci_UserDao();

		HashMap<String, Object> hMap = new HashMap<String, Object>();

		// 개수 조회
		int total = UserDao.selectCnt();

		//1. 현재 페이지 번호를 넣어 클래스 생성
		pageNavigation.setTotalCount(total);

		hMap.put("STARTROW", pageNavigation.getStartRow());
		hMap.put("ENDROW", 10);

		ArrayList<HashMap<String, Object>> list = UserDao.selectList();
%>

<!-- form frm 시작 -->
<form id="frm" name="frm" method="post" action="">
	<input type="hidden" id="nowpage" name="nowpage" value="<%=nowPage%>">
	<input type="hidden" id="USER_SEQ" name="USER_SEQ" value="">
	<input type="hidden" id="update" name="update" value="">
	
	<div>
		<span style="color:white; margin-left: 10%;">Total : <strong><%=total%></strong></span>
	</div>

	<table class="table table-bordered paginated" id="join-table">

		<caption></caption>
		<colgroup>
			<col width="7%" />
			<col width="7%" />
			<col width="20%" />
			<col width="20%" />
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" name="join-check" id="check-all" value="-1" /></th>
				<th>No</th>
				<th>이름</th>
				<th>ID</th>
				<th>승인여부</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%
				if (list.size() == 0) {
			%>
			<tr>
				<td colspan="6">Not Search</td>
			</tr>
			<%
				} // if( list.size() == 0 )
					else {

						int index = 0;
						int tmpSeq = 0;
						String tmpName = "";
						String tmpID = "";
						String tmpStatus = ""; 
						String tmpDtStr = "";

						for (int i = 0; i < list.size(); i++) {
							tmpSeq =  NumberUtils.toInt(String.valueOf(list.get(i).get("USER_SEQ")));
							tmpName = StringUtils.trimToEmpty(String.valueOf(list.get(i).get("USER_NAME")));
							tmpID = StringUtils.trimToEmpty(String.valueOf(list.get(i).get("USER_ID")));
							tmpStatus = StringUtils.trimToEmpty(String.valueOf(list.get(i).get("USER_STATUS")));
							tmpDtStr = StringUtils.trimToEmpty(String.valueOf(list.get(i).get("REG_DATE")));
							if(tmpDtStr.equals("null"))
								tmpDtStr = "";
							 
			%>
			<tr>
				<td class="center"><input type='checkbox' name='join-check' value="<%=tmpSeq%>"/></td>
				<td class="center"><%=pageNavigation.getListIndex(index++)%></td>
				<td class="center"><a href="javascript:goView('<%=tmpSeq%>');" class="sName"><%=tmpName%></a></td>
				<td class="center"><%=tmpID%></td>
				<td class="center"><%=tmpStatus%></td>
				<td class="center"><%=tmpDtStr.split(" ")[0]%></td>
			</tr>
			<%
				}
					}
					result = true;

				} catch (Exception e) {
					e.printStackTrace();
			%>
			<tr>
				<td colspan="6">Error during Searching</td>
			</tr>
			<%
				}
			%>


		</tbody>
	</table>


</form>
<!-- // form frm 종료 -->

<%
	if (result) {
%>
<!-- 페이징 처리 들어가는 부분 -->
<%@ include file="/Common/include/inc_page.jsp"%>
<%
	}
%>