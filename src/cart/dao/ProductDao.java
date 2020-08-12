package cart.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import cart.model.Product;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ProductDao {
	
	public Product getProduct(int id) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = ConnectionProvider.getConnection();

		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM product WHERE bookId=?";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				Product pro = new Product();
				pro.setBookId(rs.getInt("bookId"));
				pro.setBookName(rs.getString("bookName"));
				pro.setPrice(rs.getInt("price"));
				pro.setImage(rs.getString("image"));

				return pro;
			}
			return null;

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(conn);
		}
	}
	
	public ArrayList<Product> getListProduct() throws SQLException {
		ArrayList<Product> pdlist = new ArrayList<Product>();
		
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = ConnectionProvider.getConnection();
		
		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM product";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Product pro = new Product();
					pro.setBookId(rs.getInt("bookId"));
					pro.setBookName(rs.getString("bookName"));
					pro.setPrice(rs.getInt("price"));
					pro.setImage(rs.getString("image"));
				pdlist.add(pro);
			}
			return pdlist;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(conn);
		}
	}
}
