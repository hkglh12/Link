package com.project.Link.Commons.Comment.Service;

import java.util.ArrayList;

import com.project.Link.Commons.Comment.Comment;
import com.project.Link.Commons.Community.Community;

public interface CommonsCommentService {
	// 특정 유저의 댓글개수를 제공
	public int getUserCommentsCount(String usrId);
	// 전체 댓글 개수 제공
	public int totalCountComments(int communitySerial);
	// 게시글 리스트를 제공받아, 각 게시글 당 댓글갯수를 embed 제공
	public ArrayList<Community> totalCountComments(ArrayList<Community> list);
	// 최초 게시글 로드시에 1번 페이지에 대한 댓글 제공
	public ArrayList<Comment> ListCommunities(int targetSerial, int pageNum);
	
}
