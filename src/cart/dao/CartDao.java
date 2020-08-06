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
	public int checkBybookId(int bookId) throws SQLException {
		int rst = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = ConnectionProvider.getConnection();
		
		try {
			String sql = "SELECT amount FROM cart WHERE bookId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rst = rs.getInt("amount");
			}
			return rst;
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
				Cart cart = new Cart();
				cart.setCartId(rs.getInt("cartId"));
				cart.setBookId(rs.getInt("bookId"));
				cart.setAmount(rs.getInt("amount"));
				clist.add(cart);
			}
			return clist;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public int regCart(Cart cart) throws SQLException {
		int rst = 0;
		PreparedStatement pstmt = null;
		Connection conn = ConnectionProvider.getConnection();
		
		try {
			String sql = "INSERT INTO cart VALUE (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getCartId());
			pstmt.setInt(2, cart.getBookId());
			pstmt.setInt(3, cart.getAmount());
			rst = pstmt.executeUpdate();
			
			return rst;
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
