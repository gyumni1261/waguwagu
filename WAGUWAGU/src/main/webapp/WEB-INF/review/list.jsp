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
    <title>리뷰 목록</title>
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

        .section-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #2f4f4f;
        }

        .review-section {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-bottom: 60px;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .btn-custom {
            background-color: #2f4f4f;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 8px 20px;
            font-size: 14px;
        }

        .btn-custom:hover {
            background-color: #1e2f2f;
            color: white; /* 텍스트 색 유지 */
        }

        a.text-info {
            color: #212529 !important;
            font-weight: 500;
        }
    </style>
</head>
<body>
<div class="tm-page-wrap">
    <%@ include file="/WEB-INF/template/header.jsp" %>
    <%@ include file="/WEB-INF/template/headercarousel.jsp" %>

    <div class="review-section">
        <div class="section-title">📄 리뷰 목록</div>

        <div class="table-responsive">
            <table class="table table-hover table-bordered text-center align-middle">
                <thead class="table-light">
                    <tr>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>조회</th>
                        <th>업데이트일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${videoIdList}" var="review">
                        <tr>
                            <td>
                                <a href="review?act=detail&reviewId=${review.reviewId}&videoId=${review.videoId}" class="text-decoration-none text-info">
                                    ${review.reviewTitle}
                                </a>
                            </td>
                            <td>${review.reviewWriter}</td>
                            <td>${review.reviewViewCnt}</td>
                            <td>${review.reviewUpdatedAt}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="text-end mt-3">
            <a href="review?act=writeform&videoId=${param.videoId}" class="btn btn-custom">
                리뷰 작성하기
            </a>
        </div>
    </div>

    <%-- 에러 메시지 알림 --%>
    <%
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <script type="text/javascript">
            alert("<%= errorMessage %>");
        </script>
    <%
            session.removeAttribute("errorMessage"); // 한번 보여주고 지워줘야 함!
        }
    %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    window.onpageshow = function(event) {
        if (event.persisted) {
            window.location.reload();
        }
    };
</script>
</body>
</html>
