<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.waguwagu.dto.User" %>
<%
    // 세션에서 유저 정보 가져오기
    User user = (User) session.getAttribute("loggedInUser");
    request.setAttribute("user", user); // EL에서도 사용 가능하도록 설정
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 수정하기</title>
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

        .review-form-section {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-bottom: 60px;
        }

        .review-form-section h2 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 600;
            color: #2f4f4f;
        }

        .btn-custom {
            background-color: #2f4f4f;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 14px;
            text-decoration: none;
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
    <%@ include file="/WEB-INF/template/header.jsp" %>
    <%@ include file="/WEB-INF/template/headercarousel.jsp" %>

    <!-- 리뷰 수정 폼 -->
    <div class="container mt-5">
        <div class="review-form-section">
            <h2>리뷰 수정</h2>
            <form action="review" method="POST">
                <input type="hidden" name="act" value="update">
                <input type="hidden" name="videoId" value="${review.videoId}">
                <input type="hidden" name="reviewId" value="${review.reviewId}">

                <div class="mb-3">
                    <label class="form-label">글 제목</label>
                    <input type="text" name="reviewTitle" class="form-control" value="${review.reviewTitle}" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">글쓴이</label>
                    <input type="text" name="reviewWriter" class="form-control" value="${user.userId}" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">상세 내용</label>
                    <textarea name="reviewContent" rows="8" class="form-control" required>${review.reviewContent}</textarea>
                </div>

                <button type="submit" class="btn btn-custom">리뷰 수정</button>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
