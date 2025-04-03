package com.waguwagu.dto;

import java.time.LocalDate;

public class Video {
	private int videoId;
	private String videoOwner;
	private String getVideoOwner;
	private String videoTitle;
	private String videoUrl;
	private String videoImgUrl;
	private String videoLevel;
	private String videoCat;
	private int videoViewCnt;
	private LocalDate videoRegDate;
	private int pickCount; // 실제 DB 칼럼이 아닌 임시필드
	//videoPick에서 계산된 찜 개수를 쿼리 결과로 받아서 담는 용도 
	
	public Video() {
	}

	public Video(int videoId, String videoTitle, String videoUrl, String videoImgUrl, String videoLevel,
			String videoCat, int videoViewCnt) {
		
		this.videoId = videoId;
		this.videoTitle = videoTitle;
		this.videoUrl = videoUrl;
		this.videoImgUrl = videoImgUrl;
		this.videoLevel = videoLevel;
		this.videoCat = videoCat;
		this.videoViewCnt = videoViewCnt;
	}

	public int getVideoId() {
		return videoId;
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public String getVideoImgUrl() {
		return videoImgUrl;
	}

	public void setVideoImgUrl(String videoImgUrl) {
		this.videoImgUrl = videoImgUrl;
	}

	public String getVideoLevel() {
		return videoLevel;
	}

	public void setVideoLevel(String videoLevel) {
		this.videoLevel = videoLevel;
	}

	public String getVideoCat() {
		return videoCat;
	}

	public void setVideoCat(String videoCat) {
		this.videoCat = videoCat;
	}

	public int getVideoViewCnt() {
		return videoViewCnt;
	}

	public void setVideoViewCnt(int videoViewCnt) {
		this.videoViewCnt = videoViewCnt;
	}


	public String getGetVideoOwner() {
		return getVideoOwner;
	}

	public void setGetVideoOwner(String getVideoOwner) {
		this.getVideoOwner = getVideoOwner;
	}
	
	
	public String getVideoOwner() {
		return videoOwner;
	}

	public void setVideoOwner(String videoOwner) {
		this.videoOwner = videoOwner;
	}

	public int getPickCount() {
		return pickCount;
	}

	public void setPickCount(int pickCount) {
		this.pickCount = pickCount;
	}
	
	
	public LocalDate getVideoRegDate() {
		return videoRegDate;
	}

	public void setVideoRegDate(LocalDate videoRegDate) {
		this.videoRegDate = videoRegDate;
	}

	@Override
	public String toString() {
		return "Video [videoId=" + videoId + ", videoOwner=" + videoOwner + ", videoTitle=" + videoTitle + ", videoUrl="
				+ videoUrl + ", videoImgUrl=" + videoImgUrl + ", videoLevel=" + videoLevel + ", videoCat=" + videoCat
				+ ", videoViewCnt=" + videoViewCnt + "]";
	}
	
}
