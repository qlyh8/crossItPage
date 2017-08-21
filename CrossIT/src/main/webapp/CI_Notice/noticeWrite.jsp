<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/Common/include/inc_common.jsp"%>


<%@ include file="/Common/include/inc_header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/noticeWrite.css">
<script type="text/javascript">

function goList(){
	$("#frm").attr("method", "get");
	$("#frm").attr("action", "noticeList.jsp");

	$("#frm").submit();
}

function regist(){
	$("#order").val("REGIST");
	
	$("#frm").attr("method", "post");
	$("#frm").attr("action", "noticeProc.jsp");

	$("#frm").submit();
}

</script>

</head>
<body>
	<!--  <div id="container">-->


	<!-- Top Menu -->
	<%@ include file="/Common/include/inc_top.jsp"%>


	<section id="hire">
		<div class = "form">
		
			<h1> 공지 작성</h1>
 	
 			<form name="frm" id="frm" class="login-form" enctype="multipart/form-data" >
				<input type="hidden" name="order" id="order" >
	     
            	<input type="text" name="noti_title" id="noti_title" placeholder="제목"/>
 				<textarea name="noti_content" id="noti_content" class="textarea" placeholder="내용"></textarea>
           
            	<input type="file" name="UPLOAD_FILE" id="UPLOAD_FILE" >
           
				<div class="button_grid">
					<input type="button" value=" 등록 " style="padding:0;" class="button_grid_left button_padding_zero" onclick="javascript:regist()" />
					<input type="button" value=" 목록 " style="padding:0;" class="button_grid_right button_padding_zero" onclick="javascript:goList()" />
				</div>
          </form>
          
        </div>
    </section>
  
          <!-- 
           
                <br>
                <table class="table table-bordered" style="margin-left:20%;">
                   <tr>
                         <th>제목</th>
                         <td colspan="3"><input type="text" size="122" name="noti_title" id="noti_title"></td>
                   </tr>
                   <tr>
                         <th>내용</th>
                         <td colspan="3">
                            <textarea name="noti_content" id="noti_content" rows="20" cols="100"></textarea>
                         </td>
                   </tr>
                   <tr>
                         <th>파일첨부</th>
                         <td colspan="3">
                            <input type="file" size="106" name="UPLOAD_FILE" id="UPLOAD_FILE" >
                         </td>
                   </tr>
                </table>
               
                
             <div>
                  <input type="button" value=" 등록 " onclick="javascript:regist()" style="margin-left:45%;">
                  <input type="button" value=" 목록 " onclick="javascript:goList()">
             </div>
            
         </form>
         </div>
         </section>
 -->
		<!-- footer -->
		<%@ include file="/Common/include/inc_footer.jsp"%>
		
		