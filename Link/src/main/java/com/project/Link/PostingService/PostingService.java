package com.project.Link.PostingService;

public interface PostingService {
	public int getCount(String targetBoard, String prefix,int serial);
	public int updateCount(String targetBoard,String prefix, int count, int serial);
}