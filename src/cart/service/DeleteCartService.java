package cart.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import cart.dao.CartDao;
import cart.model.Cart;
import cart.model.Product;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteCartService {
	private CartDao cartDao = new CartDao();
	
	public void delete(CartRequest cartReq) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			cartDao.delete(conn, new Cart(
					new Product(),
					cartReq.getBookId(),
					cartReq.getAmount(),
					cartReq.getMemberId(),
					new Date()));
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
