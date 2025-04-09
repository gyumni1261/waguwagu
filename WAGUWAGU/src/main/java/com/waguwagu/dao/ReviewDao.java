package com.waguwagu.dao;

import java.util.List;

import com.waguwagu.dto.Review;

public interface ReviewDao {
	
	//전체 리뷰 조회
	abstract List<Review> getList(int videoId);
	
	//리뷰 상세 조회
	abstract Review selectOne(int reviewId);
	
	//리뷰 등록하기
	abstract boolean insertReview(Review review);
	
	//리뷰 수정하기
	abstract boolean updateReview(Review review);
	
	//리뷰 삭제하기
	abstract boolean deleteReview(int reviewId);
	
	//리뷰 조회수 증가
	abstract boolean updateViewCnt(int reviewId);
	
	//영상 좃회수 증가
	abstract boolean updateVideoViewCnt(int videoId);

}
