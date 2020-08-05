package cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import cart.model.Cart;
import jdbc.JdbcUtil;

public class CartDao {
	
	private static CartDao cartDao = new CartDao();
	public static CartDao getInstance() {
		return cartDao;
	}
	
	private CartDao() {
		
	}
	
	public int insert(Connection conn, Cart cart) throws SQLException {
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("INSERT INTO cart (bName, price, amount, regdate) VALUES (?, ?, ?, ?)");
			pstmt.setString(1, cart.getbName());
			pstmt.setInt(2, cart.getPrice());
			pstmt.setInt(3, cart.getAmount());
			pstmt.setTimestamp(4, toTimestamp(cart.getRegDate()));
			
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}
}
