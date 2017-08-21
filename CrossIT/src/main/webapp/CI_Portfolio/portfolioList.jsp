<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>


<%  
	int nowpage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
System.out.println("!!!!!!!!2");
%>  


<%@ include file="/Common/include/inc_header.jsp"%>

	
	<link rel="stylesheet" type="text/css" href="css/portfolio.css">
	<script type="text/javascript" src="js/portfolioEvent.js"></script>
	
	
	<script type="text/javascript">  
	
	var nowpage = "<%=nowpage%>";


	function reload() {
		location.href="<%=request.getRequestURI()%>";
	}


	//상세보기 페이지로 이동
	function goView(seq) {
		$("#PF_SEQ").val(seq);

		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","portfolioView.jsp?nowpage=" + nowpage);
		
		$("#frm").submit();
	}
	
	function goWrite() {
		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","portfolioWrite.jsp?nowpage=" + nowpage);
		
		$("#frm").submit();
	}

	//삭제 페이지로 이동
	function goDelete() {
		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","portfolioDelete.jsp?nowpage=" + nowpage + "&where=List");
		
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
			url: 'portfolioList_ajax.jsp?nowpage=' + page,
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

	<section id="board_portfolio">
		
		<br><h2>등록된 포트폴리오</h2><br><br>

		<div>
			<input type="button" name="portfolio-write" class="button" value=" 글쓰기 " onclick="javascript:goWrite()">
		</div>			
		<div>
			<input type="button" name="portfolio-remove" class="right_button button" value="삭제" onclick="javascript:goDelete();">
		</div>
				
				
		<div id="list_div"></div>

	</section>

	
	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
		
		