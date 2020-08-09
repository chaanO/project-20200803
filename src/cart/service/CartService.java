package cart.service;

import java.sql.Connection;
import java.sql.SQLException;

import cart.dao.CartDao;
import cart.model.Cart;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class CartService {
	private CartDao cartDao = new CartDao();
	
	public void cart(CartRequest cartReq) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			/* Cart cart = cartDao.checkBybookId(conn, cartReq.getBookId()); */
			
			cartDao.insertCart(conn, 
					new Cart(
							cartReq.getBookId(),
							cartReq.getAmount(),
							cartReq.getMemberId())
					);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
