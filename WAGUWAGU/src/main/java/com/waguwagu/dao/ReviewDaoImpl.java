package com.waguwagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.waguwagu.dto.Review;
import com.waguwagu.util.DBUtil;

public class ReviewDaoImpl implements ReviewDao {
	// singleton
	private ReviewDaoImpl() {
	};

	private static ReviewDao dao = new ReviewDaoImpl();

	public static ReviewDao getInstance() {
		return dao;
	}

	// DBUtil 불러오기
	private DBUtil util = DBUtil.getInstance();

	@Override
	public List<Review> getList(int videoId) {
		List<Review> list = new ArrayList<>();
		String sql = "SELECT * FROM review WHERE videoId = ? ORDER BY reviewRegDate DESC"; // 특정영상에 대한 모든 리뷰 목록 반환(최근등록순)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, videoId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Review review = new Review(); // 바구니 세팅
				review.setReviewId(rs.getInt("reviewId"));
				review.setReviewTitle(rs.getString("reviewTitle"));
				review.setReviewContent(rs.getString("reviewContent"));
				review.setReviewWriter(rs.getString("reviewWriter"));
				review.setReviewViewCnt(rs.getInt("reviewViewCnt"));
				LocalDateTime reviewRegDate = rs.getTimestamp("reviewRegDate").toLocalDateTime(); // 변환
				review.setReviewRegDate(reviewRegDate);
				review.setreviewUpdatedAt(rs.getTimestamp("reviewUpdateAt").toLocalDateTime());
				review.setVideoId(rs.getInt("reviewId"));
				list.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.close(rs, pstmt, conn);
		}
		return list;
	}

	@Override
	public Review selectOne(int reviewId) {
		updateViewCnt(reviewId); //조회수 +1
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM review WHERE reviewId = ?";
		Review review = null;

		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				review = new Review();
				review.setReviewId(rs.getInt("reviewId"));
				review.setReviewTitle(rs.getString("reviewTitle"));
				review.setReviewContent(rs.getString("reviewContent"));
				review.setReviewWriter(rs.getString("reviewWriter"));
				review.setReviewViewCnt(rs.getInt("reviewViewCnt"));
				LocalDateTime reviewRegDate = rs.getTimestamp("reviewRegDate").toLocalDateTime(); // 변환
				review.setReviewRegDate(reviewRegDate);
				review.setreviewUpdatedAt(rs.getTimestamp("reviewUpdateAt").toLocalDateTime());
				review.setVideoId(rs.getInt("videoId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.close(rs, pstmt, conn);
		}
		return review;
	}

	@Override
	public boolean insertReview(Review review) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO review (reviewTitle, reviewContent, reviewWriter, reviewViewCnt, reviewRegDate, reviewUpdateAt, videoId) "
				+ "VALUES (?,?,?,0,now(),now(),?)";
		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getReviewTitle());
			pstmt.setString(2, review.getReviewContent());
			pstmt.setString(3, review.getReviewWriter());
			pstmt.setInt(4, review.getVideoId());
			int rs = pstmt.executeUpdate();
			if(rs==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateReview(Review review) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE review SET reviewContent = ? WHERE reviewId = ?";
		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getReviewContent());
			pstmt.setInt(2, review.getReviewId());
			int rs = pstmt.executeUpdate();
			if(rs==1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.close(conn, pstmt);
		}
		return false;
	}

	@Override
	public boolean deleteReview(int reviewId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM review WHERE reviewId = ?";
		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewId);
			int rs = pstmt.executeUpdate();
			if(rs==1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.close(conn, pstmt);
		}
		return false;
	}

	@Override
	public boolean updateViewCnt(int reviewId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE review SET reviewViewCnt = reviewViewCnt + 1 WHERE reviewId = ?";
		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,reviewId);
			int rs = pstmt.executeUpdate();
			if(rs == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.close(conn, pstmt);
		}
		return false;
	}

	@Override
	public boolean updateVideoViewCnt(int videoId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = """
				UPDATE video SET videoViewCnt = videoViewCnt + 1 WHERE videoId = ?
				""";
		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, videoId);
			int rs = pstmt.executeUpdate();
			if(rs == 1) return true;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			util.close(conn, pstmt);
		}
		return false;
	}
}
