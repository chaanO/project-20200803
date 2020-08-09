package cart.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.service.CartService;
import cart.service.CartRequest;
import mvc.controller.CommandHandler;

public class CartHandler implements CommandHandler {
	private static final String FORM_VIEW = "/buy.jsp";
	private CartService cartService = new CartService(); 
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		CartRequest cartReq = new CartRequest();
		
		cartReq.setBookId(Integer.parseInt(req.getParameter("bookId")));
		cartReq.setAmount(Integer.parseInt(req.getParameter("amount")));
		cartReq.setMemberId(req.getParameter("memberId"));
		
		try {
			cartService.cart(cartReq);
			return "/cart.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return FORM_VIEW;
		}
		
	}
}
