$(document).ready(function(){
	//안전한 코딩을 위함. 이전 JavaScript 버전에서 허용되었던 잘못된 구문을 오류로 알려줌
	'use strict';
	
	
	//전체 체크 및 전체체크해제
	$("#check-all").click(function(){
		if($("#check-all").is(":checked")){
			$("input:checkbox[name=contact-check]").prop("checked", true);
		}
		else{
			$("input:checkbox[name=contact-check]").prop("checked", false);
		}
	});
});