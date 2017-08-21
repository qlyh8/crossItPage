<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/Common/include/inc_common.jsp"%>
<%
	int nowPage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
	boolean result = false;

	System.out.println("!!!!!!!!");
	
	PageNavigation pageNavigation = new PageNavigation(nowPage);

	try {
		Ci_NoticeDao NoticeDao = new Ci_NoticeDao();

		HashMap<String, Object> hMap = new HashMap<String, Object>();

		// 개수 조회
		int total = NoticeDao.selectCnt();

		//1. 현재 페이지 번호를 넣어 클래스 생성
		pageNavigation.setTotalCount(total);

		hMap.put("STARTROW", pageNavigation.getStartRow());
		hMap.put("ENDROW", 10);

		ArrayList<HashMap<String, Object>> list = NoticeDao.selectList(hMap);
%>

	<div>
		<span style="color:white;">Total : <strong><%=total%></strong></span>
	</div>
	
<!-- form frm 시작 -->
<form id="frm" name="frm" method="post" action="">
	<input type="hidden" id="nowpage" name="nowpage" value="<%=nowPage%>">
	<input type="hidden" id="NOTI_SEQ" name="NOTI_SEQ" value="">

	<table class="table table-bordered">

		<caption></caption>
		<colgroup>
			<col width="3%" />
			<col width="*" />
			<col width="8%" />
			<col width="8%" />
			<col width="5%" />
		</colgroup>
		<thead>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
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
						int tmpCnt = 0;
						String tmpTitle = "";
						String tmpName = "";
						String tmpDtStr = "";

						for (int i = 0; i < list.size(); i++) {
							tmpSeq =  NumberUtils.toInt(String.valueOf(list.get(i).get("NOTI_SEQ")));
							tmpTitle = StringUtils.trimToEmpty(String.valueOf(list.get(i).get("NOTI_TITLE")));
							tmpName = StringUtils.trimToEmpty(String.valueOf(list.get(i).get("USER_NAME")));
							tmpCnt =  NumberUtils.toInt(String.valueOf(list.get(i).get("NOTI_CNT")));
							tmpDtStr = StringUtils.trimToEmpty(String.valueOf(list.get(i).get("REG_DATE")));
							 
			%>
			<tr>
				<td><%=pageNavigation.getListIndex(index++)%></td>
				<td><a href="javascript:goView(<%=tmpSeq%>);" class="sName"><%=tmpTitle%></a></td>
				<td><%=tmpName%></td>
				<td><%=tmpDtStr.split(" ")[0]%></td>
				<td><%=tmpCnt%></td>
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




