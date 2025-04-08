<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.waguwagu.dto.User" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    request.setAttribute("user", user);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 상세 페이지</title>
    <%@ include file="/WEB-INF/template/headcss.jsp"%>

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

        .review-detail-section {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-bottom: 60px;
        }

        .review-detail-section h2 {
            font-size: 28px;
            font-weight: 700;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .review-detail-section p {
            margin-bottom: 10px;
            font-size: 16px;
        }

		.review-content-box {
		    background: #ffffff;
		    padding: 24px;
		    border: 1px solid #dee2e6;
		    border-radius: 10px;
		    font-size: 16px;
		    line-height: 1.7;
		    color: #343a40;
		    box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);
		    white-space: pre-wrap;
		    word-break: break-word;
		    margin-bottom: 20px;
		}

        .btn-custom {
            background-color: #2f4f4f;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 8px 20px;
            font-size: 14px;
            text-decoration: none;
            margin: 3px;
        }

        .btn-custom:hover {
            background-color: #1e2f2f;
            color: white;
        }
        
        a {
            color: #212529;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="tm-page-wrap">
    <%@ include file="/WEB-INF/template/header.jsp"%>
    <%@ include file="/WEB-INF/template/headercarousel.jsp"%>

    <div class="review-detail-section">
        <h2>${review.reviewTitle}</h2>
        <p><strong>작성자:</strong> ${review.reviewWriter}</p>
        <p><strong>상세 내용:</strong></p>
        <div class="review-content-box">
            ${review.reviewContent}
        </div>
        <p><strong>등록일:</strong> ${review.reviewRegDate}</p>
        <p class="mb-4"><strong>수정일:</strong> ${review.reviewUpdatedAt}</p>

        <c:if test="${user.userId == review.reviewWriter}">
            <div class="d-flex gap-3">
                <a href="review?act=updateform&reviewId=${review.reviewId}"
                   class="btn btn-custom">리뷰 수정하기</a>
                <a href="review?act=remove&reviewId=${review.reviewId}"
                   class="btn btn-custom">리뷰 삭제하기</a>
            </div>
        </c:if>
        
        <div class="d-flex gap-3">
            <a href="review?act=totallist&videoId=${review.videoId}"
               class="btn btn-custom">목록으로</a>
        </div>
    </div>

    <%-- 에러 메시지 알림 --%>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <script type="text/javascript">
            alert("<%= errorMessage %>");
        </script>
    <%
            request.removeAttribute("errorMessage");
        }
    %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>