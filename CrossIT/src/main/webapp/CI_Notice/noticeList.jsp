<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>


<%  

	int nowpage = NumberUtils.toInt(request.getParameter("nowpage"), 1);

%>  

<%@ include file="/Common/include/inc_header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/notice.css">
<script type="text/javascript">  
	var nowpage = "<%=nowpage%>";
	
	function reload() {
		location.href="<%=request.getRequestURI()%>";
	}
	
	// 상세보기 페이지로 이동
	function goView( seq ) {
		$("#NOTI_SEQ").val(seq);
		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","noticeView.jsp?nowpage=" + nowpage);
		$("#frm").submit();
	}
	
	function goWrite() {
		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","noticeWrite.jsp?nowpage=" + nowpage);
		$("#frm").submit();
	}
	
	function changePage(page) {
		search(page);
	}
	
	function search(page) {    
		$("#nowpage").val(page);
		
		var form_data = $("#frm").serialize();

		$.ajax({
	        beforeSend: function(jqXHR, settings){  return checkSession();     },    	// $('.loadingDiv').show();	},
	        complete: function(jqXHR, textStatus){	$('.noneDiv').hide();   }, 
	        type: 'post',
	        dataType: "html",
	        url: 'noticeList_ajax.jsp?nowpage=' + page,
	        data: form_data,
	        success: function(data, textStatus , jqXHR){
				$('#list_div').html(data);
	        },
	        error: function(jqXHR, textStatus, error){
	        	alert(error) ;
	        } 
	    });  
	}
	
	$(function(){
		search(nowpage);
	});
	
		
</script> 

</head>
<body>
	<div id="main_wrapper">


		<!-- Top Menu -->
		<%@ include file="/Common/include/inc_top.jsp"%>


		<section id="hire">
		
			<h2>공지사항</h2>
				<div>
					<input type="button" class="btn" value=" 글쓰기 " onclick="javascript:goWrite()">
				</div>
				
				<div id="list_div"></div>

		</section>
	</div>
		
	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
		
		