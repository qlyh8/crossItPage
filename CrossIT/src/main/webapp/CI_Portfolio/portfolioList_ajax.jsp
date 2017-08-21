<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/Common/include/inc_common.jsp"%>

<%
	int nowPage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
	boolean result = false;

	System.out.println("!!!!!!!!");
	
	PageNavigation pageNavigation = new PageNavigation(nowPage);

	try {
		Ci_PortfolioDao PortfolioDao = new Ci_PortfolioDao();

		HashMap<String, Object> hMap = new HashMap<String, Object>();

		//개수 조회
		int total = PortfolioDao.selectTotal();

		//현재 페이지 번호를 넣어 클래스 생성
		pageNavigation.setTotalCount(total);

		hMap.put("STARTROW", pageNavigation.getStartRow());
		hMap.put("ENDROW", 10);

		ArrayList<HashMap<String, Object>> list = PortfolioDao.selectList(hMap);
%>


<link rel="stylesheet" type="text/css" href="css/portfolio.css">
<script type="text/javascript" src="js/portfolioEvent.js"></script>

	
<!-- form frm 시작 -->
<form id="frm" name="frm" method="post">
	<input type="hidden" id="nowpage" name="nowpage" value="<%=nowPage%>">
	<input type="hidden" id="PF_SEQ" name="PF_SEQ" value="">

	<br>
	<div>
		<span style="color:white;">Total : <strong><%=total%></strong></span>
	</div>

	<table class="table table-bordered paginated" id="portfolio-table">

		<caption></caption>
		<colgroup>
			<col width="3%" />
			<col width="3%" />
			<col width="10%" />
			<col width="20%" />
			<col width="5%" />
			<col width="20%" />
			<col width="5%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" name="portfolio-check" id="check-all" value="-1" /></th>
				<th>No</th>
				<th>포트폴리오명</th>
				<th>참여명단</th>
				<th>분야</th>
				<th>개발목적</th>
				<th>개발기간</th>
				<th>등록일시</th>
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
						String tmpName = "";
						String tmpPartlist = "";
						String tmpSection = "";
						String tmpObjv = "";
						String tmpPeriod = "";
						String tmpDtStr = "";

						for (int i = 0; i < list.size(); i++) {
							tmpSeq = (Integer)(list.get(i).get("PF_SEQ"));
							tmpName = StringUtils.trimToEmpty((String) list.get(i).get("PF_NAME"));
							tmpPartlist = StringUtils.trimToEmpty((String) list.get(i).get("PF_PARTLIST"));
							tmpSection = StringUtils.trimToEmpty((String) list.get(i).get("PF_SECTION"));
							tmpObjv = StringUtils.trimToEmpty((String) list.get(i).get("PF_OBJV"));
							tmpPeriod = StringUtils.trimToEmpty((String) list.get(i).get("PF_PERIOD"));
							tmpDtStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(list.get(i).get("REG_DATE"));
			%>
			<tr>
				<td class="center"><input type="checkbox" name="portfolio-check" value="<%=tmpSeq%>"/></td>
				<td class="center"><%=pageNavigation.getListIndex(index++)%></td>
				<td nowrap style="overflow:hidden;"><a href="javascript:goView('<%=tmpSeq%>');" class="sName"><%=tmpName%></a></td>
				<td><%=tmpPartlist%></td>
				<td class="center"><%=tmpSection%></td>
				<td><%=tmpObjv%></td>
				<td><%=tmpPeriod%></td>
				<td class="center"><%=tmpDtStr%></td>

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

