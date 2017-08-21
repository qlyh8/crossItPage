$(document).ready(function() {
	
	$('.student_table').show();
	$('.worker_table').hide();
  
	$('.Student').click(function(){
    
		$('.worker_table').hide();
		$('.student_table').show();
    
	});

	$('.Worker').click(function(){
    
		$('.student_table').hide();
		$('.worker_table').show();
    
	});
  
	$("#s_submit").click(function(){
		
		$("#s_frm").attr("method","post");
		$("#s_frm").attr("target","");
		$("#s_frm").attr("enctype","multipart/form-data");	
		$("#s_frm").attr("action","joinProc.jsp");
		$("#s_frm").submit();
	  
	});
	
	$("#w_submit").click(function(){
	    
		$("#w_frm").attr("method","post");
		$("#w_frm").attr("target","");
		$("#w_frm").attr("enctype","multipart/form-data");	
		$("#w_frm").attr("action","joinProc.jsp");
		$("#w_frm").submit();
		  
	});
	
}); 


//아이디 중복확인 창
function idCheck(form, form_name){
	
	$("#s_event_idcheck").val("OK");
	$("#w_event_idcheck").val("OK");
	
	if(form.id.value == ""){
		alert("아이디를 입력하세요.");
		return;
	}
	
	open("checkId.jsp?id="+form.id.value+"&form_name="+form_name, "checkID", "toolbar=no,location=no,status=no,menubar=no,scrollbar=no,width=350,height=150");
}

