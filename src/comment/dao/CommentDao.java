package comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.JdbcUtil;
import comment.model.Comment;
import com.mysql.cj.xdevapi.Result;

public class CommentDao {
	private static CommentDao commentDao = new CommentDao();

	public static CommentDao getInstance() {
		return commentDao;
	}

	private CommentDao() {
	}

	public int insert(Connection conn, Comment comment) throws SQLException {

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into comment " + 
			"(writer_name, message, article_no) values (?, ?, ?)");

			pstmt.setString(1, comment.getWriterName());
			pstmt.setString(2, comment.getMessage());
			pstmt.setInt(3, comment.getArticleNo());

			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}

	}

	public Comment select(Connection conn, int commentNo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from comment where comment_no =?");
			pstmt.setInt(1, commentNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeMessageFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Comment makeMessageFromResultSet(ResultSet rs) throws SQLException {
		Comment comment = new Comment();
		comment.setArticleNo(rs.getInt("article_no"));
		comment.setCommentNo(rs.getInt("comment_no"));
		comment.setWriterName(rs.getString("writer_name"));
		comment.setPassword(rs.getString("password"));
		comment.setMessage(rs.getString("message"));
		return comment;
	}
	
	public int selectCount(Connection conn) throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		try {
			
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from comment");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs, stmt);
			
		}
	}
	
	public List<Comment> selectList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from comment " +
											"order by comment_no desc");
			rs = pstmt.executeQuery();
			if(rs.next()){
				
				List<Comment> commentList = new ArrayList<Comment>();
				
				do {
					commentList.add(makeMessageFromResultSet(rs));
				}while (rs.next());
				return commentList;
			}else {
				return Collections.emptyList();
			}
		}finally {
			JdbcUtil.close(rs,pstmt);
		}
	}
	
	public int delete(Connection conn, int commentNo) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from comment where comment_no =? ");
			pstmt.setInt(1, commentNo);
			return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}

}
