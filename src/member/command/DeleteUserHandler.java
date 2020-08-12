package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import member.service.DeleteUserService;
import member.service.InvalidPasswordException;
import member.service.MemberNotFoundException;
import mvc.controller.CommandHandler;

public class DeleteUserHandler implements CommandHandler{
	private static final String FORM_VIEW = "/WEB-INF/view/deleteUserForm.jsp";
	private DeleteUserService deleteUserSvc = new DeleteUserService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
 
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		User user = (User)req.getSession().getAttribute("authUser");
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		String curPwd = req.getParameter("curPwd");
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			deleteUserSvc.deleteUser(user.getId(), curPwd);
			return "WEB-INF/view/deleteUserSuccess.jsp";
		}catch(InvalidPasswordException e) {
			e.printStackTrace();
			errors.put("badCurPwd", Boolean.TRUE);
			return FORM_VIEW;
		}catch(MemberNotFoundException e) {
			e.printStackTrace();
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}
	}
}
