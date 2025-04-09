package com.waguwagu.service;

import java.util.List;

import com.waguwagu.dto.Review;

public interface ReviewService {
	
	//전체 리뷰 조회
	abstract List<Review> getList(int videoId);
	
	//리뷰 상세 조회
	abstract Review getReview(int reviewId);
	
	//리뷰 작성
	abstract boolean writeReview(Review review);
	
	//리뷰 수정
	abstract boolean modifyReview(Review review);
	
	//리뷰 삭제
	abstract boolean removeReview(int reviewId);
	
	//리뷰가 달린 영상 조회수 증가
	abstract boolean updateVideoViewCnt(int videoId);

}
