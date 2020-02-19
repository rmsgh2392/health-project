<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Body Maker</title>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" />
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<!-- My css -->
<link href="<%=application.getContextPath()%>/resources/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/grayscale.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/animate.css" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<!-- bootstrap cdn ajax, js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c95ce8d67f3f8eb5ad88326154ecbe0&libraries=services,clusterer,drawing"></script> 
<script src="<%=application.getContextPath()%>/resources/js/cmm/Gauge.js"></script>

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- js -->
<script src="<%=application.getContextPath()%>/resources/js/app.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/cmm/main_home.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/cmm/router.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/menu/navi_vue.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/menu/main.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/menu/footer.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/user/auth.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/user/login_vue.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/user/join_vue.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/user/join.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/user/routine.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/routine/routine_vue.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/brd/brd.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/brd/profile.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/brd/brd_vue.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/brd/profile_vue.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/user/mypage_vue.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/user/mypage.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/user/existing_routine.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/vue/protein/protein_vue.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/protein/protein.js"></script>
</head>

<body>
<div id="wrapper">
<div id="intro1">
<link rel="stylesheet" href="http://www.kaiwa-projects.com/assets/css/qbkl-grid.css">
<link rel="stylesheet" href="http://www.kaiwa-projects.com/assets/css/style-ko.css">
<section id="intro" class="fx-backstretch" style="height : 700px;">
			<div class="info" style="position: relative; z-index: 0; background: none;">
				<div class="container" style="top: 326px;">
					<div class="row">
						<div class="col-full"><h1>박근호</h1></div>
					</div>
					<div class="row"><div class="col-1-4 centered line"></div></div>
					<div class="row">
						<div class="col-full"><h4>웹개발자</h4></div>
					</div>
				</div>
			<div class="backstretch" style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 825px; width: 1207px; z-index: -999998; position: absolute;"><img src="http://www.kaiwa-projects.com/assets/img/backstretch.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1466.67px; height: 825px; max-height: none; max-width: none; z-index: -999999; left: -129.833px; top: 0px;"></div></div>
			<div id="nav-sticky-wrapper" class="sticky-wrapper" style="height: 60px;">
			<nav id="nav" style="z-index: 100;">
				<ul class="clearfix">
					<li class="current"><a href="#aboutme">인사 소개</a></li>
					<li class=""><a href="#skills"><span></span>기술</a></li>
					<li class=""><a id="a_project" href="">프로젝트</a></li>
					<li class=""><a href="#contact">연락</a></li>
				</ul>
			</nav>
			</div>
		</section>
		<section id="aboutme" class="section">
			<div class="container">
				<div class="row">
					<div class="col-full">
						<h2 class="section-title">인사 소개</h2>
						<div class="centered line"></div>
					</div>
				</div>

				<div class="row section-content">
					<div class="col-1-3" style="text-align: center;">
						<img alt="접니다!" style="height: 444px;" src="/web/resources/img/박근호.jpg">
					</div>
					<div class="col-1-3">
						<h4>안녕하세요 박근호입니다!</h4>
						<p>저의 웹사이트를 방문해 주셔서 감사합니다!</p><br>
						  <p>28살, 컴퓨터에 대한 열정으로 꿈을 향해 도전하고 있습니다!</p><br>
						    <p>제가 프로젝트에 썼던 조합은 java(spring5) + jquery입니다</p><br>
						 <p>Vue와 Vuex를 이용해서도 해보았고, 팀프로젝트는 팀원들과 의사소통 후 제이쿼리로 하게 되었습니다.</p><br>
						<p>앞으로 python(Django)과 React.js 더 나아가 인공지능(tensorflow)까지 배우고 싶습니다!!</p><br>
						<p>제가 배운 프로그래밍 언어와 기술을 보고싶다면 스크롤을 내리시거나 상단 메뉴에 있는 기술을 클릭해주세요</p><br>
						<p>프로젝트를 보고싶으시다면 상단 메뉴에 프로젝트를 클릭해주세요! </p><br>
						<p>프로젝트를 위한 ppt는 <a href="https://docs.google.com/presentation/d/1XmpJiMN6nJC8gBYwoVHKPEi-71GdHvCFjJ3ZFIGwr7M/edit#slide=id.p1">여기</a>를 클릭해주세요</p>
						<p>저의 git주소가 궁금하시다면 <a href="https://github.com/rmsgh2392">여기</a>를 클릭해주세요</p>
					</div>
				</div>
		</section>
		<section id="skills" class="section-alt">
			<div class="container">
				<div class="row">
					<div class="col-full">
						<h2 class="section-title">전문 기술</h2>
						<div class="centered line"></div>
					</div>
				</div>

				<div class="row section-content">
					<div class="skill-container">
						<div class="col-full">
							<div class="col-full text-center">저는 웹으로는  자바를 사용합니다.
							화면은 부트스트랩과 Vue와 Vuetify를 이용해
							구성하였지만 도중에 vue에서 제이쿼리로 바꾸게 되었고 데이터베이스는 MariaDB를 사용하였습니다
							</div>
						</div>
						
						<div class="col-1-5 skill">
							<h4>Java</h4>
						</div>
						<div class="col-1-5 skill">
							<h4>Jquery</h4>
						</div>
						<div class="col-1-5 skill">
							<h4>JavaScript</h4>
						</div>
						<div class="col-1-5 skill">
							<h4>Vue</h4>
						</div>
						<div class="col-1-5 skill">
							<h4>NODE.JS</h4>
						</div>
					</div>
					<div class="col-full skill-container">
						<h3>자주 사용하는 소프트웨어</h3>
					</div>
					<div class="col-2-3 col-wrap centered skill-container" style="justify-content: center;">
						<div class="col-1-2">
							<h4>프레임워크하고 엔진</h4>
							<ul><li>Vue.js(version 3.0)</li><li>Spring5</li><li>Spring Boot</li></ul>							
						</div>
						<div class="col-1-2">
							<h4>소프트웨어</h4>
							<ul><li>Git</li><li>MariaDB</li></ul>	
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="contact" class="section">
			<div class="container">
				<div class="row">
					<div class="col-full">
						<h2 class="section-title">연락 주세요</h2>
						<div class="centered line"></div>
					</div>
				</div>

				<div class="row section-content">
					<div class="col-2-3 col-wrap centered text-center">
						<div class="row">
							<div class="col-full" style="margin-bottom: 25px;">
								항상 초심같은 마음가짐으로 임할것이고 최신기술 트렌드에도 뒤져지지 
								않고 하루하루 성장하겠습니다  <br>rmsgh2392@daum.net으로 이메일 주세요. 곧 답장 드리겠습니다.<br>언제든지 연락주세요	
							</div>
						</div>
						
						<div id="form-contact-container">
							<div class="col-full">
								<label for="">이름
									<h2>박근호</h2>
								</label>
							</div>
							<div class="col-full">
								<label for="">Email 주소
									<h2>rmsgh2392@daum.net</h2>
								</label>
							</div>
							<div class="col-full">
								<label for="">휴대폰 번호
									<h2>010-2470-2993</h2>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
<script>
$('#a_project').click(e=>{
	e.preventDefault()
	app.run('<%=application.getContextPath()%>')
})
</script>
</body>
</html>