package com.waguwagu.dao;

import java.util.List;

import com.waguwagu.dto.Video;

public interface VideoDao {
	
	//조회수 순 정렬
	public abstract List<Video>  getVideosSortedByViewCnt();
	
	//최신 순 정렬
	public abstract List<Video>  getVideosSortedByRegTime();
	
	//찜 개수 순 정렬
	public abstract List<Video> getVideosSortedByPickCnt();
	
	//카테고리 별 정렬
	public abstract List<Video>  getVideosSortedByCat(String cat);
	
}
