package cart.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

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
			
			cartDao.insert(conn, 
					new Cart(
							cartReq.getProduct(),
							cartReq.getBookId(),
							cartReq.getAmount(),
							cartReq.getMemberId(),
							new Date())
					);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public Cart selectBybookId(CartRequest cartReq) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			/* Cart cart = cartDao.checkBybookId(conn, cartReq.getBookId()); */
			
			Cart checkBook = cartDao.selectBybookId(conn, 
							cartReq.getBookId()
					);
			conn.commit();
			return checkBook;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}	
	
	public void update(CartRequest cartReq) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			/* Cart cart = cartDao.checkBybookId(conn, cartReq.getBookId()); */
			cartDao.update(conn, 
					new Cart(
							cartReq.getProduct(),
							cartReq.getBookId(),
							cartReq.getAmount(),
							cartReq.getMemberId(),
							new Date())
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
