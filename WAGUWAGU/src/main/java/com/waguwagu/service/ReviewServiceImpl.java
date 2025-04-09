package com.waguwagu.service;

import java.util.List;

import com.waguwagu.dao.ReviewDao;
import com.waguwagu.dao.ReviewDaoImpl;
import com.waguwagu.dto.Review;

public class ReviewServiceImpl implements ReviewService {
	
	//싱글톤 패턴으로 관리
	private ReviewServiceImpl() {}
	private static ReviewService service = new ReviewServiceImpl();
	public static ReviewService getInstance() {
		return service;
	}
	
	//dao 가져오기
	private ReviewDao dao = ReviewDaoImpl.getInstance();

	@Override
	public List<Review> getList(int videoId) {
		return dao.getList(videoId);
	}

	@Override
	public Review getReview(int reviewId) {
		return dao.selectOne(reviewId);
	}

	@Override
	public boolean writeReview(Review review) {
		return dao.insertReview(review);
	}

	@Override
	public boolean modifyReview(Review review) {
		return dao.updateReview(review);
	}

	@Override
	public boolean removeReview(int reviewId) {
		return dao.deleteReview(reviewId);
	}

	@Override
	public boolean updateVideoViewCnt(int videoId) {
		return dao.updateVideoViewCnt(videoId);
	}

}
