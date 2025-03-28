package com.waguwagu.service;

import java.util.List;

import com.waguwagu.dao.VideoDao;
import com.waguwagu.dao.VideoDaoImpl;
import com.waguwagu.dto.Video;

public class VideoServiceImpl implements VideoService{
	
	private static VideoService service = new VideoServiceImpl();
	private VideoDao dao = VideoDaoImpl.getInstance();
	
	private VideoServiceImpl(){
	}
	
	public static VideoService getInstance() {
		return service;
	}

	@Override
	public List<Video> getListByViewCnt() {
		return null;
	}

	@Override
	public List<Video> getListByRegTime() {
		return null;
	}

	@Override
	public List<Video> getListByPickCnt() {
		return null;
	}

	@Override
	public List<Video> getListOfCat(String part) {
		return null;
	}
}
