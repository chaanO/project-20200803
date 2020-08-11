package cart.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.service.CartRequest;
import cart.service.DeleteCartService;
import mvc.controller.CommandHandler;

public class DeleteCartHandler implements CommandHandler{
	
	private DeleteCartService deleteService = new DeleteCartService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		CartRequest cartReq = new CartRequest();
		
		deleteService.delete(cartReq);
		return "/list.do";
	}
}
