package cart.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cart.model.Product;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ProductDao {
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT COUNT(*) FROM product");
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
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
