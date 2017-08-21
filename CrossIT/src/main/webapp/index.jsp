<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/Common/include/inc_common.jsp"%>
<%@ include file="/Common/include/inc_header.jsp"%>

</head>
<body style="overflow-x:hidden;">
	<section id="form_before_lounch">
      	<p>LOGIN</p>
      	<h1 class="right">x</h1>
        <form id="form" action="/CI_Join/loginProc.jsp" method="post">
        	<div>
            	<div>
              		<input type="text" id="id" name="id" placeholder="Id" />
            	</div>
            	<div>
              		<input type="password" id="pw" name="pw" placeholder="Password" />
            	</div>
            	<div id="btn">
              		<input type="submit" id="submit" value="OK" />
            	</div>  
            	<div>
            		<a href="/CI_Join/signup.html">SIGN UP</a>
            	</div>
			</div>
		</form>
    </section>
    
    <header class="home">

		<!-- Top Menu -->
    	<%@ include file="/Common/include/inc_top.jsp"%>


		<img class="photo" src="/Common/images/a2.jpg" alt="">
        <img class="photo" src="/Common/images/a3.jpg" alt="">
        <img class="photo" src="/Common/images/a4.jpg" alt="">
        <img class="photo" src="/Common/images/a5.jpg" alt="">

		<div class="logo_grid">
			<div class="logo">
				<div class="inner">
				 	<header>
						<h1>Cross IT</h1>
						<p>대학생 + 직장인 연합 IT 동아리</p>
					</header>
				</div>
			</div>
		</div>
	</header>
     

    <!-- section class="content">-->
     <article id="home">
        <h1>CROSS IT란?</h1>
        <hr>
        <p class="p_cross_it">
 			<p>	대학생과 직장인을 CrossIT </p>
 			<p>	개발자와 디자이너를 CrossIT </p>
 			<p>	포트폴리오를 쌓을 수 있는  CrossIT</p>  
 			<p>	다양한 인맥을 쌓을 수 있는  CrossIT </p>
        </p>
        <p>CrossIT는 '1석 4조'의 동아리입니다.</p>
        <hr>
		<div class="equal-height-container intro_container">
			<div class="intro">
				<div class="intro_uniform intro_a">
					<div class="intro_col intro_col_a">
						<div class="intro_col_small"><p>활동 지역</p></div>
              		</div>
					<div class="intro_lower">
						<p class="post_p">예상지역</p>
	           			<h1 class="post_h1">- 숭실대</h1>
	            		<h1 class="post_h1">- 이화여대</h1>
	            		<p class="post_p">대여 여부에 따라 협의</p>
	            	</div>
              	</div>
              	<div class="intro_uniform intro_b">
              		<div class="intro_col intro_col_b">
                		<div class="intro_col_small"><p>활동 내용</p></div>
              		</div>
                	<div class="intro_lower">
  						<p class="post_p">프로젝트 진행</p>
  						<h1 class="post_h1">- App, Web 등</h1>
              	  		<p class="post_p">친목활동</p>
              	  		<h1 class="post_h1">- MT, 번개, 체육대회 등</h1>
               	 		<p class="post_p">인턴십 / 봉사활동</p>
                	</div>
				</div> 
            </div>
            <div class="intro">
              	<div class="intro_uniform intro_c">
              		<div class="intro_col intro_col_c">
               		 	<div class="intro_col_small"><p>활동 기간</p></div>
              		</div>
                	<div class="intro_lower">
                		<p class="post_p">최소 활동기간</p>
                		<h1 class="post_h1">- 3개월</h1>
                		<p class="post_p">원할 경우 다음 기수 참여</p>
                	</div>
              	</div>  
              	<div class="intro_uniform intro_d">
              		<div class="intro_col intro_col_d">
                		<div class="intro_col_small"><p>팀 구성</p></div>
              		</div>
               		<div class="intro_lower">
                		<p class="post_p">4인 1조 (기획1, 디자인1, 개발2)</p>
                  		<p class="post_p">방식</p>
	             		<h1 class="post_h1">- App/Web 중 원하는 분야 선택</h1>
	          	    	<h1 class="post_h1">- 같은 주제를 선택한 사람으로 팀구성</h1>
	          	   		<h1 class="post_h1">- 세부 아이디어 선정</h1>
	          	   		<h1 class="post_h1">- 기획/디자인/개발 진행 및 완성</h1>
                	</div>
              	</div>  
			</div>
            <div class="intro">
             	<div class="intro_uniform intro_e">
              		<div class="intro_col intro_col_e">
                		<div class="intro_col_small"><p>활동 혜택</p></div>
              		</div>
                	<div class="intro_lower">
 						<p class="post_p">시공을 넘나드는 넓은 인맥</p>
	              		<p class="post_p">엣지 있는 포트폴리오</p>
	              		<p class="post_p">주체적인 프로그래밍 경험</p>
	             		<p class="post_p">무료한 삶에서 탈출</p>
                	</div>
              	</div>
              	<div class="intro_uniform intro_f">
              		<div class="intro_col intro_col_f">
                		<div class="intro_col_small"><p>모집 대상</p></div>
              		</div>
                	<div class="intro_lower">
                  		<p class="post_p">획기적인 아이디어가 있는 기획자</p>
                		<p class="post_p">프로그래밍 지식을 가지고 있는 개발자</p>
                		<p class="post_p">디자인 Tool을 쓸 줄 아는 디자이너</p>
                	</div>
              	</div>  
            </div>
		</div>
	</article>

	<section class="content2" id="member">
		<article class="arti2">
			<h1>MEMBER</h1>
			<hr>
			<p>CrossIT 1기 Member</p>
			<hr>
			<div class="tab-wrapper">
				<div class="tab-content">
					<ul class="tab-menu">
						<li>운영진</li>
						<li>기획자</li>
						<li class="active">개발자</li>
						<li>디자이너</li>
					</ul>
					<div style="font-size: 3em; color: white;">
						<div class="clothes-pics pic">
							<div class="row img-row">
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>김재석</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>김진우</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>박재현</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>유인준</figcaption>
								</figure>
							</div>
						</div>
					</div>
					<div style="font-size: 3em; color: white;">
						<div class="clothes-pics pic">
							<div class="row img-row">
								<figure class="columns four">
									<img src="/Common/images/team_woman.png">
									<figcaption>한혜수</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>noname</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>noname</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>noname</figcaption>
								</figure>
							</div>
						</div>
					</div>
					<div style="font-size: 3em; color: white;">
						<div class="clothes-pics pic">
							<div class="row img-row">
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>구동림</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_woman.png">
									<figcaption>권예슬</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>김동인</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>김성재</figcaption>
								</figure>
							</div>
							<div class="row img-row">
								<figure class="columns four">
									<img src="/Common/images/team_woman.png">
									<figcaption>김지영</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_woman.png">
									<figcaption>신윤희</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_woman.png">
									<figcaption>오혜윤</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>유태양</figcaption>
								</figure>
							</div>
							<div class="row img-row">
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>윤준일</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>이동건</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>이현빈</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>장철운</figcaption>
								</figure>
							</div>
							<div class="row img-row">
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>최영준</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>최우영</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_woman.png">
									<figcaption>한여경</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_woman.png">
									<figcaption>허은녕</figcaption>
								</figure>
							</div>
						</div>
					</div>
					<div style="font-size: 3em; color: white;">
						<div class="clothes-pics pic2">
							<div class="row img-row">
								<figure class="columns four">
									<img src="/Common/images/team_woman.png">
									<figcaption>김화영</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>이승태</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_man.png">
									<figcaption>이진용</figcaption>
								</figure>
								<figure class="columns four">
									<img src="/Common/images/team_woman.png">
									<figcaption>이한솔</figcaption>
								</figure>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>

	<section class="content3" id="portfolio">
		<article class="arti3">
			<h1>PORTFOLIO</h1>
			<hr>
			<p>CrossIt 1기 Portfolio</p>
			<hr>
		</article>
	</section>

	<article>
		<div class="equal-height-container">
			<div class="port_card">
				<div class="post_grid">
					<!-- <h5>자글자글</h5> -->
					<img src="./Common/images/posts/port1.jpg">
					<p class="post_p">모취모취</p>
					<h1 class="post_h1">Wep application</h1>
					<p class="post_p">INFO</p>
					<h1 class="post_h1">포트폴리오 제작 사이트</h1>
					<p class="post_p">TEAM A</p>
					<h1 class="port_h1_team">박재현, 유인준, 이동건, 이승태, 이현빈, 한여경</h1>
					<div class="button_p">
						<p class="port_button">
							<a href="" class="button">View Portfolio</a>
						</p>
					</div>
				</div>
			</div>
			<div class="port_card">
				<div class="post_grid">
					<!-- <h5>자글자글</h5> -->
					<img src="./Common/images/posts/port2.jpg">
					<p class="post_p">자글자글</p>
					<h1 class="post_h1">Wep application</h1>
					<p class="post_p">INFO</p>
					<h1 class="post_h1">포트폴리오 제작 사이트</h1>
					<p class="post_p">TEAM B</p>
					<h1 class="port_h1_team">김재석, 김진우, 오혜윤, 윤준일, 이한솔, 장철운</h1>
					<div class="button_p">
						<p class="port_button">
							<a href="" class="button">View Portfolio</a>
						</p>
					</div>
				</div>
			</div>
			<div class="port_card">
				<div class="post_grid">
					<!-- <h5>모여라 미대생</h5> -->
					<img src="./Common/images/posts/port3.jpg" height="210">
					<p class="post_p">모여라 미대생</p>
					<h1 class="post_h1">App application</h1>
					<p class="post_p">INFO</p>
					<h1 class="post_h1">미대생을 위한 어플리케이션</h1>
					<p class="post_p">TEAM C</p>
					<h1 class="port_h1_team">김성재, 김화영, 유태양, 최영준, 한혜수</h1>
					<div class="button_p">
						<p class="port_button">
							<a href="" class="button">View Portfolio</a>
						</p>
					</div>
				</div>
			</div>
			<div class="port_card">
				<!-- <h5>픽플</h5> -->
				<img src="./Common/images/posts/port4.jpg">
				<p class="post_p">픽플</p>
				<h1 class="post_h1">Wep application</h1>
				<p class="post_p">INFO</p>
				<h1 class="post_h1">픽플 웹사이트</h1>
				<p class="post_p">TEAM E</p>
				<h1 class="port_h1_team">구동림, 권예슬, 김동인, 김지영</h1>
				<div class="button_p">
					<p class="port_button">
						<a href="" class="button">View Portfolio</a>
					</p>
				</div>
			</div>
		</div>
	</article>

	<article id="contact">
		<section id="form_contact_section">
			<p>CONTACT</p>
			<form id="form_contact" method="post" action="/CI_Contact/contactInsert.jsp">
				<div>
					<div>
						<input type="text" id="contact_name" name="contact_name" placeholder="name" /> 
						<input type="text" id="contact_email" name="contact_email" placeholder="email" />
					</div>
					<div>
						<textarea id="contact_message" name="contact_message" placeholder="message" maxlength="2040"></textarea>
					</div>
					<div id="btn">
						<input type="submit" id="submit" value="Send" />
					</div>
				</div>
			</form>
		</section>
	</article>
	<!-- </section> -->
	<!-- </section> -->
	
	
	<!-- footer -->
	<%@ include file="/Common/include/inc_footer.jsp"%>
	
	