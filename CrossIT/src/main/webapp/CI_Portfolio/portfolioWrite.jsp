<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>
<%@ include file="/Common/include/inc_header.jsp"%>

<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<link rel="stylesheet" type="text/css" href="css/portfolioWrite.css">
<script type="text/javascript">

function goList(){
	$("#frm").attr("method", "get");
	$("#frm").attr("action", "portfolioList.jsp");

	$("#frm").submit();
}

function regist(){
	$("#order").val("REGIST");
	
	$("#frm").attr("method", "post");
	$("#frm").attr("action", "portfolioProc.jsp");	

	$("#frm").submit();
}

</script>

</head>
<body>
	<!--  <div id="container"> -->


		<!-- Top Menu -->
		<%@ include file="/Common/include/inc_top.jsp"%>


		<section id="hire">
       
         <form name="frm" id="frm" >
          <input type="hidden" name="order" id="order" >
	      
	      <h1> 포트폴리오 작성</h1>
                <br>
                <table class="table table-bordered">
                   <tr>
                         <th>포트폴리오명</th>
                         <td colspan="5"><input type="text" name="pf_name" id="pf_name"></td>
                   </tr>
                   <tr>
                         <th>참여명단</th>
                         <td colspan="5"><input type="text" name="pf_partlist" id="pf_partlist"></td>
                   </tr>
                   <tr>
                         <th>분야</th>
                         <td colspan="5"><input type="text" name="pf_section" id="pf_section"></td>
                   </tr>
                   <tr>
                         <th>목적</th>
                         <td colspan="5"><input type="text" name="pf_objv" id="pf_objv"></td>
                   </tr>
                   <tr>
                         <th>개발기간</th>
                         <td colspan="5"><input type="text" name="pf_period" id="pf_period"></td>
                   </tr>
                </table>
               
                
             <div>
                  <input type="button" value=" 등록 " onclick="javascript:regist()" >
                  <input type="button" value=" 목록 " onclick="javascript:goList()" >
             </div>
         </form>
         </section>

		<!-- footer -->
		<%@ include file="/Common/include/inc_footer.jsp"%>
		
		