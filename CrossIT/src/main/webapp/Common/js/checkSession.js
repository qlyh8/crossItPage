function checkSession(){
		var check_result = true;
		
		try{
			$.ajax({
			    url : "/Common/include/checkSession.jsp",
			    type : "post",
			    dataType : "text",
			    async : false,
			    error : function( XMLHttpRequest, textStatus, errorThrown ){
			    },
			    success : function( data ){ 
			    	if($.trim(data) != 'T'){
						alert("로그인세션이 만료되었습니다. 로그인 후 사용해 주세요.");
						location.replace("/index.jsp");
						check_result = false;
					}
			    }
			});
		}
		catch(error){
		}
		
		if(check_result === false) $('.noneDiv').hide();
		else $('.noneDiv').show();
		
		return check_result;
	} 