package com.waguwagu.service;

import java.util.List;

import com.waguwagu.dto.Video;

public interface VideoService {
	
	//조회수 순 정렬
	public abstract List<Video> getListByViewCnt(String cat);
	
	//최신 순 정렬
	public abstract List<Video> getListByRegTime(String cat);
	
	//찜 개수 순 정렬
	public abstract List<Video> getListByPickCnt(String cat);
	
	//카테고리 별 정렬 
	public abstract List<Video> getListOfCat(String cat);
	
	
}
