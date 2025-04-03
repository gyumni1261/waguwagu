package com.waguwagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.waguwagu.dto.Video;
import com.waguwagu.util.DBUtil;

public class VideoDaoImpl implements VideoDao {

	// 싱글턴
	//////////////////////////////////////////////////////////
	private static VideoDao dao = new VideoDaoImpl();

	private VideoDaoImpl() {
	}

	public static VideoDao getInstance() {
		return dao;
	}
	//////////////////////////////////////////////////////////

	// DB 연결을 뚫고 없애는 객체
	private DBUtil util = DBUtil.getInstance();

	@Override
	public List<Video> getVideosSortedByViewCnt() {
		List<Video> list = new ArrayList<>();
		String sql = """
				SELECT v.*, COUNT(vp.videoId) AS pickCount
				FROM video
				LEFT JOIN videoPick vp ON v.videoId = vp.videoId
				GROUP BY v.videoId
				ORDER BY videoViewCnt DESC
				""";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Video video = new Video();

				video.setVideoId(rs.getInt("videoId"));
				video.setVideoTitle(rs.getString("videoTitle"));
				video.setVideoUrl(rs.getString("videoUrl"));
				video.setVideoImgUrl(rs.getString("videoImgUrl"));
				video.setVideoLevel(rs.getString("videoLevel"));
				video.setVideoCat(rs.getString("videoCat"));
				video.setVideoViewCnt(rs.getInt("videoViewCnt"));
				video.setVideoRegDate(rs.getDate("videoRegDate").toLocalDate()); // java.sql.Date → java.time.LocalDate
				video.setVideoOwner(rs.getString("videoOwner"));
				video.setPickCount(rs.getInt("pickCount"));

				list.add(video);
			}

		} catch (SQLException e) {
			throw new RuntimeException("DB 오류", e);
		} finally {
			util.close(rs, pstmt, conn);
		}

		return list;
	}

	@Override
	public List<Video> getVideosSortedByRegTime() {
		List<Video> list = new ArrayList<>();
		String sql = """
				SELECT v.*, COUNT(vp.videoId) AS pickCount
				FROM video
				LEFT JOIN videoPick vp ON v.videoId = vp.videoId
				GROUP BY v.videoId
				ORDER BY videoRegDate DESC
				""";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Video video = new Video();

				video.setVideoId(rs.getInt("videoId"));
				video.setVideoTitle(rs.getString("videoTitle"));
				video.setVideoUrl(rs.getString("videoUrl"));
				video.setVideoImgUrl(rs.getString("videoImgUrl"));
				video.setVideoLevel(rs.getString("videoLevel"));
				video.setVideoCat(rs.getString("videoCat"));
				video.setVideoViewCnt(rs.getInt("videoViewCnt"));
				video.setVideoRegDate(rs.getDate("videoRegDate").toLocalDate());
				video.setVideoOwner(rs.getString("videoOwner"));
				video.setPickCount(rs.getInt("pickCount"));

				list.add(video);
			}

		} catch (SQLException e) {
			throw new RuntimeException("DB 오류", e);

		} finally {
			util.close(rs, pstmt, conn);
		}

		return list;
	}

	@Override
	public List<Video> getVideosSortedByPickCnt() {

		List<Video> list = new ArrayList<>();
		String sql = """
				SELECT v.*, COUNT(vp.videoId) AS pickCount
				FROM video v
				LEFT JOIN videoPick vp ON v.videoId = vp.videoId
				GROUP BY v.videoId
				ORDER BY pickCount DESC
				""";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Video video = new Video();

				video.setVideoId(rs.getInt("videoId"));
				video.setVideoTitle(rs.getString("videoTitle"));
				video.setVideoUrl(rs.getString("videoUrl"));
				video.setVideoImgUrl(rs.getString("videoImgUrl"));
				video.setVideoLevel(rs.getString("videoLevel"));
				video.setVideoCat(rs.getString("videoCat"));
				video.setVideoViewCnt(rs.getInt("videoViewCnt"));
				video.setVideoRegDate(rs.getDate("videoRegDate").toLocalDate());
				video.setVideoOwner(rs.getString("videoOwner"));
				video.setPickCount(rs.getInt("pickCount"));

				list.add(video);
			}
		} catch (Exception e) {
			throw new RuntimeException("DB 오류", e);
		} finally {
			util.close(rs, pstmt, conn);
		}

		return list;
	}

	@Override
	public List<Video> getVideosSortedByCat(String cat) {

		List<Video> list = new ArrayList<>();
		String sql = """
				SELECT v.*, COUNT(vp.videoId) AS pickCount
				FROM video v
				LEFT JOIN videoPick vp ON v.videoId = vp.videoId
				GROUP BY v.videoId
				WHERE v.videoCat=?
				ORDER BY videoViewCnt DESC
				""";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Video video = new Video();

				video.setVideoId(rs.getInt("videoId"));
				video.setVideoTitle(rs.getString("videoTitle"));
				video.setVideoUrl(rs.getString("videoUrl"));
				video.setVideoImgUrl(rs.getString("videoImgUrl"));
				video.setVideoLevel(rs.getString("videoLevel"));
				video.setVideoCat(rs.getString("videoCat"));
				video.setVideoViewCnt(rs.getInt("videoViewCnt"));
				video.setVideoRegDate(rs.getDate("videoRegDate").toLocalDate());
				video.setVideoOwner(rs.getString("videoOwner"));
				video.setPickCount(rs.getInt("pickCount"));

				list.add(video);
			}
		} catch (Exception e) {
			throw new RuntimeException("DB 오류", e);
		}

		return list;
	}

}
