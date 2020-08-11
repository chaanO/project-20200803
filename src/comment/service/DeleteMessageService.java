package comment.service;

import java.sql.Connection;

import comment.dao.CommentDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import comment.model.Comment;

public class DeleteMessageService {
private static DeleteMessageService instance = new DeleteMessageService();

public static DeleteMessageService getInstance() {
	return instance;
}
private DeleteMessageService() {}

public String deleteMessage(int CommentNo) {
	Connection conn = null;
	try {
		conn = ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		
        CommentDao commentDao = CommentDao.getInstance();
        Comment comment = commentDao.select(conn, CommentNo);

		
		 if (comment == null) {
	            return "메시지 없음";
	         }
	         
	         commentDao.delete(conn, CommentNo);
	         conn.commit();
	         
	         return "삭제 성공";
	         
	      } catch (Exception e) {
	    	  JdbcUtil.rollback(conn);
	         e.printStackTrace();
	      } finally {
	         JdbcUtil.close(conn);
	      }
	      return "삭제 실패";
}
}