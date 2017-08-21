<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="org.apache.commons.lang3.*, org.apache.commons.lang3.math.*"%>

<%@ include file="/Common/include/inc_common.jsp"%>
<%	



 	int nowpage = NumberUtils.toInt(String.valueOf(request.getParameter("nowpage")), 1); 

	String ORDER = request.getParameter("order");
	String PF_NAME = request.getParameter("pf_name");
	String PF_PARTLIST = request.getParameter("pf_partlist");
	String PF_SECTION = request.getParameter("pf_section");
	String PF_OBJV = request.getParameter("pf_objv");
	String PF_PERIOD = request.getParameter("pf_period");
	System.out.println("###order:"+ORDER);
	boolean result = false;
	String msg = "";
	
	try {
		
		HashMap<String,Object> hMap = new HashMap<String,Object>();
				
		if( ORDER.equals("REGIST") ) {
			
			System.out.println("nowpage = "+nowpage);
			System.out.println("ORDER = "+ORDER);
			System.out.println("PF_NAME = "+PF_NAME);
			System.out.println("PF_PARTLIST = "+PF_PARTLIST);
			System.out.println("PF_SECTION = "+PF_SECTION);
			System.out.println("PF_OBJV = "+PF_OBJV);
			System.out.println("PF_PERIOD = "+PF_PERIOD);
			
			Ci_PortfolioDao portfolioDao = new Ci_PortfolioDao();
			
			HashMap<String,Object> portfolioMap = new HashMap<String,Object>();

			portfolioMap.put("PF_NAME", PF_NAME);
			portfolioMap.put("PF_PARTLIST", PF_PARTLIST);
			portfolioMap.put("PF_SECTION", PF_SECTION);
			portfolioMap.put("PF_OBJV", PF_OBJV);
			portfolioMap.put("PF_PERIOD", PF_PERIOD);
			portfolioMap.put("REG_USER_SEQ", SESS_USER_SEQ);
			

			int rtn = portfolioDao.insert(portfolioMap);
			
			System.out.println("rtn: "+rtn);
			
			hMap.clear();
						
			result = true;
			msg = "등록되었습니다.";		
		}
		else if( ORDER.equals("MODIFY") ) {
			
			System.out.println("2nowpage = "+nowpage);
			System.out.println("2ORDER = "+ORDER);
			System.out.println("2PF_NAME = "+PF_NAME);
			System.out.println("2PF_PARTLIST = "+PF_PARTLIST);
			System.out.println("2PF_SECTION = "+PF_SECTION);
			System.out.println("2PF_OBJV = "+PF_OBJV);
			System.out.println("2PF_PERIOD = "+PF_PERIOD);
			
			
			int PF_SEQ = NumberUtils.toInt(String.valueOf(request.getParameter("PF_SEQ")), 0);
			System.out.println("PF_SEQ = "+PF_SEQ);
			
			if( PF_SEQ != 0){
				
				Ci_PortfolioDao portfolioDao = new Ci_PortfolioDao();
				
				HashMap<String,Object> portfolioMap = new HashMap<String,Object>();
							
				portfolioMap.put("PF_SEQ", PF_SEQ);
				portfolioMap.put("PF_NAME", PF_NAME);
				portfolioMap.put("PF_PARTLIST", PF_PARTLIST);
				portfolioMap.put("PF_SECTION", PF_SECTION);
				portfolioMap.put("PF_OBJV", PF_OBJV);
				portfolioMap.put("PF_PERIOD", PF_PERIOD);
				portfolioMap.put("USER_SEQ", SESS_USER_SEQ);
				
				int rtn = portfolioDao.update(hMap);
				
				System.out.println("rtn: "+rtn);
				portfolioMap.clear();
				
				result = true;
				msg = "수정되었습니다.";
			}					
		}else if( ORDER.equals("DELETE") ) {
			 
            int PF_SEQ = NumberUtils.toInt(String.valueOf(request.getParameter("PF_SEQ")), 0);
			
			if( PF_SEQ != 0){
				
				Ci_PortfolioDao portfolioDao = new Ci_PortfolioDao();
				
				HashMap<String,Object> portfolioMap = new HashMap<String,Object>();
							
				portfolioMap.put("PF_SEQ", PF_SEQ);
	
				int rtn =portfolioDao.delete(portfolioMap);			
				
				System.out.println("rtn: "+rtn);
				portfolioMap.clear();
				
				result = true;
				msg = "삭제되었습니다.";
			}
		}
	}
	catch(Exception e) {
		e.printStackTrace();
		msg = "An error occurred during processing";
	}
	
	
%>


<body onLoad="goList()">
<form id="listFrm" name="listFrm"  action="portfolioList.jsp" method="post">
	<input type="hidden" id="nowpage" name="nowpage" value="<%=nowpage%>">	
</form>
</body>

<script type="text/javascript">
function goList() {	
	alert("<%=msg%>");
	document.listFrm.submit();
}
</script>
