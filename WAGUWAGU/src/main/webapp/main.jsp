<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="com.waguwagu.dto.User"%>


<%
//세션에서 유저 정보 가져오기(Object -> User로 형변환)
User loggedInUser = (User) session.getAttribute("loggedInUser");

//세션에 비디오 목록 띄우기(Object -> User로 형변환)
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAGUWAGU</title>
</head>
<body>
	<!-- 로그인 유무에 따라 다른 환영 메시지 -->
	<%
	if (loggedInUser != null) {
	%>
	<h2>
		환영합니다,
		<%=loggedInUser.getName()%>님!
	</h2>
	<a href="user?act=logout">로그아웃</a>
	<a href="user?act=deleteId">회원탈퇴</a>
	<%
	} else {
	%>
	<h2>로그인이 필요합니다.</h2>
	<a href="user?act=loginform">로그인</a>
	<%
	}
	%>

	<br>

	<!-- 정렬 및 필터 -->
	<a href="video?act=viewCnt">조회수 순</a>
	<a href="video?act=regTime">최신순</a>

	<div class="controls">
		<form action="video" method="get">
			<input type="hidden" name="act" value="cat"> <select
				name="category">
				<option value="한식">전체</option>
				<option value="한식">한식</option>
				<option value="중식">중식</option>
				<option value="일식">일식</option>
				<option value="디저트">디저트</option>
			</select>
			<button type="submit">선택</button>
		</form>
	</div>
	
	<!-- 영상 목록 -->
	<div class="video-section">
		<table width="100%" border="1" cellspacing="10" cellpadding="10">
			<c:forEach var="video" items="${videoList}" varStatus="status">
				<c:if test="${status.index % 3 == 0}">
					<tr>
				</c:if>

				<td width="33%" align="center" valign="top">
				<img src="${video.videoImgUrl}" width="80%" height="auto"><br>
					<a href="review?act=totallist&videoId=${video.videoId }"><b>${video.videoTitle}</b></a><br> 
					<small>작성자:${video.videoOwner}</small><br> 
					<small>얼로드일:${video.videoRegDate}</small><br> 
					<small>종류:${video.videoCat}</small><br> 
					<small>난이도:${video.videoLevel}</small><br>
					<small>조회수:${video.videoViewCnt}</small><br> 
					<small>찜:${video.pickCount}</small></td>

				<c:if test="${status.index % 3 == 2 || status.last}">
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>

	<!-- alert 출력 : 회원탈퇴 완료 -->
	<%
	String errorMessage = (String) session.getAttribute("errorMessage");
	if (errorMessage != null) {
	%>
	<script type="text/javascript">
			alert("<%=errorMessage%>");
	</script>
	<%
	}
	%>
</body>
</html>