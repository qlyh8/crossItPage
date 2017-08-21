<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="bar">
	<a href="/index.jsp" class="cross_it">Cross IT</a>
	<div class="container">		
		<nav>	
		
		
		<%
			//운영진 로그인
			if ((SESS_USER_SEQ != 0 || !SESS_ID.equals("")) && SESS_KIND.equals("A")) {
		%>

			<ul class="login_ul">
			<!--<li><a href="#" class="first_li login_li">Info</a></li>-->
				<li><a href="/index.jsp#member" class="first_li login_li">Member</a></li>
				<li><a href="/index.jsp#portfolio" class="two_li login_li">Portfolio</a></li>
				<li><a href="/index.jsp#contact"  class="three_li login_li">Contact</a></li>
				<li><a href="/CI_Notice/noticeList.jsp" class="four_li deletemenu login_li">NOTICE</a></li>
				<li><a href="/CI_Portfolio/portfolioList.jsp" class="five_li deletemenu login_li">PROJECT</a></li>
				<li><a href="/CI_Join/joinList.jsp" class="six_li deletemenu login_li">APPROVAL</a></li>
				<li><a href="/CI_Join/logoutProc.jsp" id="logout" class="seven_li login_li">Logout</a></li>
			</ul>
			<div class="popup_a">
				<input type="checkbox" href="#" class="popup-open" name="popup-open" id="popup-open" />
				<label class="popup-open-button" for="popup-open"> 
					<span class="lines line-1"></span> 
					<span class="lines line-2"></span> 
					<span class="lines line-3"></span>
				</label> 
				<a href="/CI_Contact/contactList.jsp" class="popup-item red"> 
					<i class="fa fa-file" aria-hidden="true" style="z-index: 99;"></i>
				</a> 
				<a href="/CI_Attendance/attendanceList.jsp" class="popup-item purple">
					<i class="icon-id-card-o" style="z-index: 99;"></i> <!-- &#xf2c3 -->
				</a> 
				<a href="/CI_User/userInfo.jsp" class="popup-item aqua">
					<i class="fa fa-user" style="z-index: 99;" aria-hidden="true"></i>
				</a>
			</div>

			<%
				//회원 로그인
				} else if ((SESS_USER_SEQ != 0 || !SESS_ID.equals("")) && SESS_KIND.equals("U")) {
			%>
		
			<ul class="login_ul">
                <li class="login_li"><a href="/index.jsp#home" class="first_li">About</a></li>
                <li class="login_li"><a href="/index.jsp#member" class="two_li">Member</a></li>
                <li class="login_li"><a href="/index.jsp#portfolio" class="three_li">Porfolio</a></li>
                <li class="login_li"><a href="/index.jsp#contact" class="four_li">Contact</a></li>
				<li class="login_li"><a href="/CI_Notice/noticeList.jsp" class="deletemenu five_li">NOTICE</a></li>
				<li class="login_li"><a href="/CI_Join/logoutProc.jsp" class="six_li" id="logout">Logout</a></li>
			</ul>
			<div class="popup">
 				<input type="checkbox" href="#" class="popup-open" name="popup-open" id="popup-open" />
				<label class="popup-open-button" for="popup-open">
                      <span class="lines line-1"></span>
                      <span class="lines line-2"></span>
                      <span class="lines line-3"></span>
             	</label>
 				<a href="/CI_User/empty.jsp" class="popup-item red"> 
                     <i class="fa fa-file" aria-hidden="true" style="z-index: 99;"></i> 
                </a>
				<a href="/CI_Attendance/attendanceList.jsp" class="popup-item purple"> 
                     <i class="icon-id-card-o" style="z-index: 99;"></i> <!-- &#xf2c3 --> 
                </a>
                <a href="/CI_User/userInfo.jsp" class="popup-item aqua" > 
                     <i class="fa fa-user" style="z-index: 99;" aria-hidden="true"></i> 
                </a>
          </div>
		
		<%
			//비회원 로그인
			} else  { 
		%>
		
			<ul>
				<li><a href="/index.jsp#home" class="before_login first_li">About</a></li>
				<li><a href="/index.jsp#member" class="before_login two_li">Member</a></li>
				<li><a href="/index.jsp#portfolio" class="before_login three_li">Portfolio</a></li>
				<li><a href="/index.jsp#contact" class="before_login four_li">Contact</a></li>
			<!--<li><a href="/CI_Join/signup.html" class="before_login">SignUp</a></li>-->
				<li><a href="#" class="before_login five_li" id="login">Login</a></li>
			</ul>
		<%} %>
		
		</nav>
	</div>
</div>	
