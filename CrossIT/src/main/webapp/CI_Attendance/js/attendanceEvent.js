/**
 * 출석 페이지에서 발생하는 이벤트 핸들링
 */
$(document).ready(function(){
	//안전한 코딩을 위함. 이전 JavaScript 버전에서 허용되었던 잘못된 구문을 오류로 알려줌
	'use strict';
	
	
	//전체 체크 및 전체체크해제
	$("#check-all").click(function(){
		if($("#check-all").is(":checked")){
			$("input:checkbox[name=attendance-check]").prop("checked", true);
		}
		else{
			$("input:checkbox[name=attendance-check]").prop("checked", false);
		}
	});
	
	
	//select박스 기수 선택시, 테이블 새로고침
	$("#term-select").change(function() {
		
		//선택된 옵션에 'selected' 속성 추가 및 선택되지 않은 옵션은 'selected'속성 제거
		$("#term-select").children("option:selected").attr("selected", "selected");
		$("#term-select").children("option:selected").siblings().removeAttr("selected");
		
		//ajax 처리
		search(1);
	});
	
	
	//출결 업데이트 버튼 클릭 시, 업데이트에 필요한 버튼 활성화
	$("#attendance-update-btn").click(function(){
		
		//0.5초 후 나타남
		$("#attendance-text").show(500);
		$(".calendar").show(500);
		$(".last_date").show(500);
		$("#date-delete-btn").show(500);
		$(".attendance-check").show(500);
		$("#attendance-present-btn").show(500);
		$("#attendance-late-btn").show(500);
		$("#attendance-absent-btn").show(500);
		$("#attendance-plus-btn").show(500);
		$("#attendance-remove-btn").show(500);
		$("#attendance-submit").show(500);
		
		$("#attendance-update-btn").hide(500);
	});
	
	
	//변경 사항 저장 후 버튼 비활성화
	$("#attendance-submit").click(function(){	
	
		var term = $("#term-select").children("option:selected").val();
		
		$("#frm").attr("method","post");
		$("#frm").attr("target","");
		$("#frm").attr("action","attendanceProc.jsp?term=" + term + "&process=update");
		$("#frm").submit();
		
		//2초 후 감춤
		$("#attendance-text").delay(2000).hide(500);
		$("#date-delete-btn").delay(2000).hide(500);
		$(".attendance-check").delay(2000).hide(500);
		$("#attendance-present-btn").delay(2000).hide(500);
		$("#attendance-late-btn").delay(2000).hide(500);
		$("#attendance-absent-btn").delay(2000).hide(500);
		$("#attendance-plus-btn").delay(2000).hide(500);
		$("#attendance-remove-btn").delay(2000).hide(500);
		$("#attendance-submit").delay(2000).hide(500);
	});
	
	
	
	//날짜 삭제 버튼
	$("#date-delete-btn").click(function(){
		
		var popup = $("#date-popup");
		var href = popup.attr("href");
		var width = popup.attr('data-width');
		var height = popup.attr('data-height');
		
		//팝업창 생성
		window.open(href, "날짜 삭제", "width="+width+",height="+height+"");
	});
	
	
	//팝업창 - 전체 체크 및 전체체크해제
	$("#chboxDate").click(function(){
		
		if($("#chboxDate").is(":checked")){
			$("input:checkbox[name=date-check]").prop("checked", true);
		}
		else{
			$("input:checkbox[name=date-check]").prop("checked", false);
		}
	});
	
	
	
});


//td에 값 삽입
function tdValue(numRow, numCol){
	
	console.log("numRow:"+numRow+" numCol:"+numCol);
	
	//td_id: '#td[row]-[column]'
	if(numRow > 0){

		for(var i=1 ; i<=numRow ; i++){

			for(var j=3 ; j<=7 ; j++){

				var id = "#td"+i+"-"+j;
				var text = $(id).text();
				$(id).val(text);
			}
			
			for(var j=8 ; j<=numCol ; j++){

				var id = "#td"+i+"-"+j;
				$(id).val(-2);
			}
		}
	}
}


//날짜 삭제 버튼
function date_delete(term, process){
	
	$("#frm-date-delete").attr("method","post");
	$("#frm-date-delete").attr("target","");
	$("#frm-date-delete").attr("action","attendanceProc.jsp?term=" + term+"&process="+process);
	$("#frm-date-delete").submit();
}


//출석/지각/결석/가산 class 추가
function dateClass(total, start, end){

	for(var i = 1 ; i <= total ; i++){
		for(var j = start ; j < end ; j++){
			
			var tdId = "#td" + i + "-" + j;
			var inputId = "#input" + i + "-" + j;
		
			if($(inputId).val() == "출석"){
				$(tdId).addClass("present");
			}
			else if($(inputId).val() == "지각"){
				$(tdId).addClass("late");
			}
			else if($(inputId).val() == "결석"){
				$(tdId).addClass("absent");
			}
			else if($(inputId).val() == "가산"){
				$(tdId).addClass("plus");
			}
		}
	}	
}