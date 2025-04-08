<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div id="tm-image-slider" class="carousel slide carousel-fade"
	data-bs-ride="carousel" data-bs-interval="5000">
	<!-- 슬라이드 표시 영역 -->
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="${pageContext.request.contextPath}/images/image1.jpg" class="d-block w-100" alt="음식 이미지 1">
		</div>
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath}/images/image2.jpg" class="d-block w-100" alt="음식 이미지 2">
		</div>
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath}/images/image3.jpg" class="d-block w-100" alt="음식 이미지 3">
		</div>
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath}/images/image4.jpg" class="d-block w-100" alt="음식 이미지 4">
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
