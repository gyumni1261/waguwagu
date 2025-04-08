<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="com.waguwagu.dto.User" %>
<%
    // 세션에서 유저 정보 가져오기
    User user = (User) session.getAttribute("loggedInUser");
	request.setAttribute("user", user); // EL에서 쓰게 request에 넣어줌
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WAGUWAGU</title>
    <%@ include file="/WEB-INF/template/headcss.jsp" %>

    <!-- 폰트 & 스타일 -->
    <link href="https://fonts.googleapis.com/css2?family=Pretendard&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Pretendard', sans-serif;
            background-color: #f8f9fa;
            color: #212529;
            margin: 0;
            padding: 0;
        }

        .tm-page-wrap {
            max-width: 1200px;
            margin: 0 auto;
            padding-top: 30px;
        }

        .welcome-banner {
            background: linear-gradient(135deg, #2f4f4f, #3b5d5d);
            color: white;
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            margin-bottom: 40px;
        }

        .welcome-banner h1 {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .welcome-banner p {
            font-size: 18px;
            font-weight: 400;
        }

        .section-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #2f4f4f;
        }
    </style>
</head>
<body>

    <div class="tm-page-wrap">
        <!-- 헤더 영역 -->
        <%@ include file="/WEB-INF/template/header.jsp" %>

        <!-- 캐러셀 영역 -->
        <%@ include file="/WEB-INF/template/headercarousel.jsp" %>

        <!-- 인사 배너 -->
        <div class="welcome-banner">
            <h1>Welcome to WAGUWAGU!</h1>
            <p>
                <c:choose>
                    <c:when test="${not empty user}">
                        안녕하세요, <strong>${user.userId}</strong>님! 오늘도 좋은 하루 되세요 🌿
                    </c:when>
                    <c:otherwise>
                        로그인하고 더 많은 기능을 이용해보세요 🙌
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
		
        <!-- 추가 섹션(예: 추천 영상, 최근 업로드 등)도 여기에 배치 가능 -->
        <div class="mb-5">
            <div class="section-title">🔥 인기 콘텐츠</div>
            <!-- 여기에 콘텐츠 리스트 카드나 썸네일 삽입 -->
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
        </div>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
