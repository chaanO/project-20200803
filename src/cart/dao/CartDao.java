package cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import cart.model.Cart;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class CartDao {
	public Cart checkBybookId(Connection conn, int bookId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			String sql = "SELECT amount FROM cart WHERE bookId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			rs = pstmt.executeQuery();
			Cart cart = null;
			while (rs.next()) {
				cart = new Cart(
						rs.getInt("bookId"),
						rs.getInt("amount"),
						rs.getString("memberId"));
			}
			return cart;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public ArrayList<Cart> cartList() throws SQLException {
		ArrayList<Cart> clist = new ArrayList<Cart>();
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = ConnectionProvider.getConnection();
		
		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM cart";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Cart cart = new Cart(
					rs.getInt("bookId"),
					rs.getInt("amount"),
					rs.getString("memberId"));
				clist.add(cart);
			}
			return clist;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(conn);
		}
	}
	
	public int insertCart(Connection conn, Cart cart) throws SQLException {
		int rst = 0;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			String sql = "INSERT INTO cart VALUE (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getBookId());
			pstmt.setInt(2, cart.getAmount());
			pstmt.setString(3, cart.getMemberId());
			rst = pstmt.executeUpdate();
			
			return rst;
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public int uptCart(Cart cart) throws SQLException {
		int rst = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = ConnectionProvider.getConnection();
		
		try {
			String sql = "UPDATE cart SET amount = ? WHERE bookId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getAmount());
			pstmt.setInt(2, cart.getBookId());
			
			rst = pstmt.executeUpdate();
			
			return rst;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}
	
	public int delCart(int bookId) throws SQLException {
		int rst = 0;
		PreparedStatement pstmt = null;
		Connection conn = ConnectionProvider.getConnection();
		
		try {
			String sql = "DELETE FROM cart WHERE bookId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			
			rst = pstmt.executeUpdate();
			
			return rst;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}
}
