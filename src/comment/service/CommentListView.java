package comment.service;

import java.util.List;

import comment.model.Comment;

public class CommentListView {

	private List<Comment> commentList;

	
	public CommentListView(List<Comment> commentList) {
		this.commentList = commentList;

	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	
	
	
}
