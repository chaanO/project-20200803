package comment.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import comment.dao.CommentDao;
import comment.model.Comment;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class GetCommentListService {
	private static GetCommentListService instance = new GetCommentListService();
	
	public static GetCommentListService getInstance() {
		return instance;
	
	}
	
	private GetCommentListService() {}
	
	
	public CommentListView getCommentList(int pageNumber) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			CommentDao commentDao = CommentDao.getInstance();
			
			List<Comment> commentList =  commentDao.selectList(conn);
			
			return new CommentListView(commentList);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return null;
	}
}
