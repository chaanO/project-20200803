package cart.service;

import java.sql.Connection;

import cart.dao.CartDao;
import cart.model.Cart;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteCartService {
	private static DeleteCartService instance = new DeleteCartService();
	
	public static DeleteCartService getInstance() {
		return instance;
	}
	
	private DeleteCartService() {
		
	}
	
	public String deleteCart(int bookId) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			CartDao cartDao = CartDao.getInstance();
			Cart cart = cartDao.selectBybookId(conn, bookId);
			
			if (cart == null) {
				return "장바구니가 비었습니다.";
			}
			cartDao.delete(conn, bookId);
			conn.commit();
			
			return "삭제 성공";
		} catch (Exception e) {
			JdbcUtil.close(conn);
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		return "삭제 실패";
	}
}
