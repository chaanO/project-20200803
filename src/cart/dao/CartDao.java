package cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cart.model.Cart;
import cart.model.Product;
import jdbc.JdbcUtil;

public class CartDao {
	public Cart selectBybookId(Connection conn, int bookId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM cart WHERE bookId = ?");
			pstmt.setInt(1, bookId);
			rs = pstmt.executeQuery();
			Cart cart = null;
			if (rs.next()) {
				cart = new Cart(
						new Product(),
						rs.getInt("bookId"),
						rs.getInt("amount"),
						rs.getString("memberId"),
						toDate(rs.getTimestamp("regdate")));
			}
			return cart;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void insert(Connection conn, Cart cart) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement("INSERT INTO cart VALUES (0, ?, ?, ?, ?)")) {
			pstmt.setInt(1, cart.getBookId());
			pstmt.setInt(2, cart.getAmount());
			pstmt.setString(3, cart.getMemberId());
			pstmt.setTimestamp(4, new Timestamp(cart.getRegDate().getTime()));
			pstmt.executeUpdate();
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT COUNT(*) FROM cart");
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Cart> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM product, cart WHERE product.bookId = cart.bookId ORDER BY regdate DESC limit ?, ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			
			List<Cart> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertCart(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Cart convertCart(ResultSet rs) throws SQLException {
		Product pro = new Product();
		
		pro.setBookId(rs.getInt("bookId"));
		pro.setBookName(rs.getString("bookName"));
		pro.setImage(rs.getString("image"));
		pro.setPrice(rs.getInt("price"));
		
		return new Cart(pro,
				rs.getInt("bookId"), rs.getInt("amount"), rs.getString("memberId"), toDate(rs.getTimestamp("regdate")));
	}

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}
	
	public void update(Connection conn, Cart cart) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement("UPDATE cart SET amount = ? WHERE bookId = ?")) {
			pstmt.setInt(1, cart.getAmount());
			pstmt.setInt(2, cart.getBookId());
			pstmt.executeUpdate();
		}
	}

	public int selectAllForCartByBookId(Connection conn, Cart cart) throws SQLException {
		ResultSet rs = null;
		try (PreparedStatement pstmt = conn.prepareStatement("select count(*) from cart where bookid = ?")) {
			pstmt.setInt(1, cart.getBookId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		}
	}
}
