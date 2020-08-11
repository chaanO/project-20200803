package comment.service;

import java.sql.Connection;

import comment.dao.CommentDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import comment.model.Comment;

public class WriteCommentService {
	private static WriteCommentService instance = new WriteCommentService();
	
	public static WriteCommentService getInstace() {
		return instance;
	}
	
	private WriteCommentService() {
		
	}
	
	public boolean write(Comment comment) {
		Connection conn = null;
		
	try {
		conn= ConnectionProvider.getConnection();
		CommentDao commentDao = CommentDao.getInstance();
		commentDao.insert(conn, comment);
	}catch (Exception e) {
		e.printStackTrace();
		return false;
	}finally {
		JdbcUtil.close(conn);
	}
	return true;
}
}
