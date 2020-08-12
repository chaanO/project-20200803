package cart.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import cart.dao.CartDao;
import cart.model.Cart;
import jdbc.connection.ConnectionProvider;

public class ListCartService {
	private CartDao cartDao = new CartDao();
	private int size = 10;
	
	public CartPage getCartPage(int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = cartDao.selectCount(conn);
			List<Cart> cartList = cartDao.select(conn, (pageNum - 1) * size, size);
			return new CartPage(total, pageNum, size, cartList);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
