<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/Common/include/inc_common.jsp"%>

<%
	int nowPage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
	boolean result = false;

	System.out.println("!!!!!!!!");
	
	PageNavigation pageNavigation = new PageNavigation(nowPage);

	try {
		Ci_ContactDao ContactDao = new Ci_ContactDao();

		HashMap<String, Object> hMap = new HashMap<String, Object>();

		//개수 조회
		int total = ContactDao.selectTotal();

		//현재 페이지 번호를 넣어 클래스 생성
		pageNavigation.setTotalCount(total);

		hMap.put("STARTROW", pageNavigation.getStartRow());
		hMap.put("ENDROW", 10);

		ArrayList<HashMap<String, Object>> list = ContactDao.selectList(hMap);
%>


<link rel="stylesheet" type="text/css" href="css/contact.css">
<script type="text/javascript" src="js/contactEvent.js"></script>

	
<!-- form frm 시작 -->
<form id="frm" name="frm" method="post">
	<input type="hidden" id="nowpage" name="nowpage" value="<%=nowPage%>">
	<input type="hidden" id="CT_SEQ" name="CT_SEQ" value="">

	<br>
	<div>
		<span style="color:white;">Total : <strong><%=total%></strong></span>
	</div>

	<table class="table table-bordered paginated" id="contact-table">

		<caption></caption>
		<colgroup>
			<col width="3%" />
			<col width="5%" />
			<col width="*" />
			<col width="8%" />
			<col width="15%" />
			<col width="7%" />
			<col width="5%" />
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" name="contact-check" id="check-all" value="-1" /></th>
				<th>No</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>답장상태</th>
				<th>조회수</th>	
			</tr>
		</thead>
		<tbody>
			<%
				if (list.size() == 0) {
			%>
			<tr>
				<td colspan="7">Not Search</td>
			</tr>
			<%
				} // if( list.size() == 0 )
					else {

						int index = 0;
						int tmpSeq = 0;
						int tmpCnt = 0;
						String tmpContent = "";
						String tmpName = "";
						String tmpStatus = "";
						String tmpDtStr = "";

						for (int i = 0; i < list.size(); i++) {
							tmpSeq = (Integer)(list.get(i).get("CT_SEQ"));
							tmpContent = StringUtils.trimToEmpty((String) list.get(i).get("CT_CONTENT"));
							tmpName = StringUtils.trimToEmpty((String) list.get(i).get("CT_NAME"));
							tmpCnt = (Integer)(list.get(i).get("CT_CNT"));
							tmpStatus = StringUtils.trimToEmpty((String) list.get(i).get("CT_STATUS"));
							tmpDtStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(list.get(i).get("REG_DATE"));
			%>
			<tr>
				<td class="center"><input type='checkbox' name='contact-check' value="<%=tmpSeq%>"/></td>
				<td class="center"><%=pageNavigation.getListIndex(index++)%></td>
				<td nowrap style="overflow:hidden;"><a href="javascript:goView(<%=tmpSeq%>);" class="sName"><%=tmpContent%></a></td>
				<td class="center"><%=tmpName%></td>
				<td class="center"><%=tmpDtStr%></td>
				<td class="center"><%=tmpStatus%></td>
				<td class="center"><%=tmpCnt%></td>		
			</tr>
			<%
				}
					}
					result = true;

				} catch (Exception e) {
					e.printStackTrace();
			%>
			<tr>
				<td colspan="7">Error during Searching</td>
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

