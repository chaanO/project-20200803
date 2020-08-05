package test;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.dao.CartDao;
import cart.model.Cart;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

/**
 * Servlet implementation class CartInsertTestServlet
 */
@WebServlet("/CartInsertTestServlet")
public class CartInsertTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsertTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			Cart cart = new Cart();
			cart.setbName("시");
			cart.setPrice(13000);
			cart.setRegDate(new Date());
			
			CartDao dao = CartDao.getInstance();
			dao.insert(conn, cart);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
