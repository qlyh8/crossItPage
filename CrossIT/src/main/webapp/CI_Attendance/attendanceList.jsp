<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>


<%  
	int nowpage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
System.out.println("!!!!!!!!2");
%>  


<%@ include file="/Common/include/inc_header.jsp"%>

	
	<link rel="stylesheet" type="text/css" href="css/attendance.css">
	<script type="text/javascript" src="js/attendanceEvent.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
	
	<script type="text/javascript">  
	
	var nowpage = "<%=nowpage%>";


	function reload() {
		location.href="<%=request.getRequestURI()%>";
	}

	
	function changePage(page) {
		search(page);
	}


	function search(page) {    
		$("#nowpage").val(page);

		var form_data = $("#frm").serialize();
		var term_data = $("#term-select").children("option:selected").val();
		
		$.ajax({
			beforeSend: function(jqXHR, settings){  return checkSession();     },    	// $('.loadingDiv').show();	},
			complete: function(jqXHR, textStatus){	$('.noneDiv').hide();   }, 
			type: 'post',
			dataType: "html",
			url: 'attendanceList_ajax.jsp?nowpage=' + page + '&term=' + term_data,
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
	<!-- Top Menu -->
	<%@ include file="/Common/include/inc_top.jsp"%>


	<section id="board_attendance">
		<div id="attendance_grid">		
		
			<br><h2>출결현황</h2>
			<div id="attendance-text"><h4>[날짜 선택] > [회원 체크] > [버튼 클릭]</h4></div>


			<!-- 기수 선택 -->
	  		<select id="term-select" name="term-select">
				<option value="1" selected="selected">1기</option>
				<option value="2">2기</option>
			</select><br><br>
	
	
			<!-- 페이징 처리 div -->
			<div id="list_div"></div><br><br>
			
		</div>	
	</section>

	
	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
		
		