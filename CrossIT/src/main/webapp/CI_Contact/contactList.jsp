<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>


<%  
	int nowpage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
System.out.println("!!!!!!!!2");
%>  


<%@ include file="/Common/include/inc_header.jsp"%>

	
	<link rel="stylesheet" type="text/css" href="css/contact.css">
	<script type="text/javascript" src="js/contactEvent.js"></script>
	
	
	<script type="text/javascript">  
	
	var nowpage = "<%=nowpage%>";


	function reload() {
		location.href="<%=request.getRequestURI()%>";
	}


	//상세보기 페이지로 이동
	function goView(seq) {
		$("#CT_SEQ").val(seq);

		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","contactView.jsp?nowpage=" + nowpage);

		$("#frm").submit();
	}


	//삭제 페이지로 이동
	function goDelete() {
		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","contactDelete.jsp?nowpage=" + nowpage + "&where=List");

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
			url: 'contactList_ajax.jsp?nowpage=' + page,
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


	<section id="board_contact">
		<div id="board_grid">		
			<br><h2>받은 문의</h2><br><br>
			
			<div>
				<input type="button" name="contact-remove" value="삭제" onclick="javascript:goDelete();"> <br>
			</div>	
				
			<div id="list_div"></div>
		</div>
	</section>

	
	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
		
		