package cart.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.service.CartPage;
import cart.service.ListCartService;
import mvc.controller.CommandHandler;

public class ListCartHandler implements CommandHandler {
	private ListCartService listService = new ListCartService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		CartPage cartPage = listService.getCartPage(pageNo);
		req.setAttribute("cartPage", cartPage);
		return "/cart.jsp";
	}
	
}
