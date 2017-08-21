<%@ page contentType="text/html; charset=UTF-8" %>

<div class="paging">
<%	
	//3. 각 html 넣어 html 반환
	String firstHtml = "<a href='javascript:changePage(\"1\");'  class='first' title='처음 페이지'>처음</a>\r\n"  ;
	String prevHtml = "<a href='javascript:changePage(\"#\");'  class='prev' title='이전 10페이지'>이전</a>\r\n" ;
	String nowHtml = "<strong>#</strong>\r\n" ;
	String pageHtml = "<a href='javascript:changePage(\"#\");' >#</a>\r\n" ;
	String nextHtml = "<a href='javascript:changePage(\"#\");'  class='next' title='다음 10페이지'>다음</a>\r\n" ;
	String lastHtml = "<a href='javascript:changePage(\"#\");'  class='end' title='마지막 페이지'>마지막</a>\r\n" ;
	
	//contactList_ajax.jsp에 'PageNavigation pageNavigation = new PageNavigation(nowPage);' 으로 선언됨
	out.print( pageNavigation.getPageHtml(firstHtml , prevHtml , nowHtml , pageHtml  , nextHtml , lastHtml) ) ; 
%>
</div>
