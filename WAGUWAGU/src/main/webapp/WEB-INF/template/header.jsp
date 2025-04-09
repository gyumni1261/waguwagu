<!-- header.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- <%@ page import = "com.waguwagu.dto.User" %>
<%
	User user = (User) session.getAttribute("logginInUser");
%> --%>
<div class="position-absolute tm-site-header">
	<div class="container-fluid position-relative">
		<div class="row">
			<div class="col-7 col-md-4">
				<a href="video?act=viewCnt"> <!-- <i class="fas fa-video tm-site-logo mb-3"></i> -->
					<h1 class="tm-site-name">WAGUWAGU</h1>
				</a>
			</div>
			<div class="col-5 col-md-8 d-flex justify-content-end align-items-center">
			    <!-- 로그인된 유저 이름 표시 -->
                <c:if test="${not empty loggedInUser}">
					<div class="me-3 text-black" style="font-size: 1.0rem;">
    					<strong>🖤${loggedInUser.userId}🖤</strong>
					</div>
                </c:if>
                
                <!-- 네비게이션 바 -->
				<div class="tm-site-nav">
					<nav class="navbar navbar-expand-lg mr-0 ml-auto" id="tm-main-nav">
						<button
							class="navbar-toggler tm-bg-black py-2 px-3 mr-0 ml-auto collapsed"
							type="button" data-toggle="collapse" data-target="#navbar-nav"
							aria-controls="navbar-nav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span> <i class="fas fa-bars tm-menu-closed-icon"></i> <i
								class="fas fa-times tm-menu-opened-icon"></i>
							</span>
						</button>
						<div class="collapse navbar-collapse tm-nav" id="navbar-nav">
							<ul class="navbar-nav text-uppercase">
								<!-- 드롭다운 메뉴 추가 -->
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle tm-nav-link" href="#"
									id="mypageDropdown" role="button" data-bs-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 마이페이지 </a>
									<ul class="dropdown-menu" aria-labelledby="mypageDropdown">
										<%
										if (user != null) {
										%>
										<li><a class="dropdown-item" href="#">마이페이지</a></li>
										<li><a class="dropdown-item" href="user?act=logout">로그아웃</a></li>
										<%
										} else {
										%>
										<li><a class="dropdown-item" href="user?act=loginform">로그인</a></li>
										<li><a class="dropdown-item" href="user?act=registform">회원가입</a></li>
										<%
										}
										%>
									</ul></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle tm-nav-link" href="#"
									id="videosDropdown" role="button" data-bs-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 레시피 </a>
									<ul class="dropdown-menu" aria-labelledby="videosDropdown">
										<li><a class="dropdown-item" href="video?act=videoList">모든영상</a></li>
										<li><a class="dropdown-item" href="#">찜한영상</a></li>
									</ul></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle tm-nav-link" href="#"
									id="videosDropdown" role="button" data-bs-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
									<ul class="dropdown-menu" aria-labelledby="videosDropdown">
										<li><a class="dropdown-item" href="#">오늘의 레시피</a></li>
										<li><a class="dropdown-item" href="#">잠담게시판</a></li>
									</ul></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle tm-nav-link" href="#"
									id="videosDropdown" role="button" data-bs-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> HELP DESK </a>
									<ul class="dropdown-menu" aria-labelledby="videosDropdown">
										<li><a class="dropdown-item" href="#">공지사항</a></li>
										<li><a class="dropdown-item" href="#">FAQ</a></li>
										<li><a class="dropdown-item" href="#">1:1 문의</a></li>
									</ul></li>

							</ul>
						</div>
					</nav>
				</div>
			</div>

		</div>
	</div>
</div>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
   