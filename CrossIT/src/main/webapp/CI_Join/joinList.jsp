<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>

<%  
	int nowpage = NumberUtils.toInt(request.getParameter("nowpage"), 1);
//	int urSeq = NumberUtils.toInt(request.getParameter("USER_SEQ"), 1);
	
//	HashMap<String,Object> hMap = new HashMap<String,Object>();	
//	hMap.put("USER_SEQ", urSeq);
%>  

<%@ include file="/Common/include/inc_header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/join.css">
<script type="text/javascript">  
	var nowpage = "<%=nowpage%>";
	
	function reload() {
		location.href="<%=request.getRequestURI()%>";
	}
	
	// 상세보기 페이지로 이동
	function goView( seq ) {
		$("#USER_SEQ").val(seq);
		$("#frm").attr("method","post");
		$("#frm").attr("target","");
//		$("#frm").attr("action","joinView.jsp?nowpage=" + nowpage + "&USER_SEQ="+seq );
		$("#frm").attr("action","joinView.jsp?nowpage=" + nowpage);
		$("#frm").submit();
	}
	
	//수정 페이지로 이동
	function goUpdate() {
		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","joinUpdate.jsp?nowpage=" + nowpage + "&where=List");

		$("#frm").submit();
	}
	
	
	//삭제 페이지로 이동
	function goDelete() {
		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","joinDelete.jsp?nowpage=" + nowpage + "&where=List");

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
	        url: 'joinList_ajax.jsp?nowpage=' + page,
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
	<!-- <div id="container"> -->

		<!-- Top Menu -->
		<%@ include file="/Common/include/inc_top.jsp"%>


		<section id="board_join">
			<h2> 회원가입 명단</h2>
				
				<div>
					<input type="button" class="button" value="승인 " name="join-update" onclick="javascript:goUpdate();">
					<input type="button" class="button" value="삭제" name="join-remove" onclick="javascript:goDelete();"> <br>
				</div>
				
				<div id="list_div"></div>

		</section>
	<!--	</div> -->

		<!-- footer -->
		<%@ include file="/Common/include/inc_footer.jsp"%>
		
		