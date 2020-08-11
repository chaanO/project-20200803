package comment.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.service.DeleteMessageService;
import com.mysql.cj.Session;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/article/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String commentNoStr = request.getParameter("commentNo");
		int commentNo = Integer.valueOf(commentNoStr);
		
		String no = request.getParameter("no");
		String pageNo = request.getParameter("pageNo");
		
		
		//delete service 객체 얻어서
		DeleteMessageService service = DeleteMessageService.getInstance();
		
		//delete 메소드 실행
		String info = service.deleteMessage(commentNo);
		
		//결과 : string을
		
		//session "info" attribute로 셋팅
		session.setAttribute("info",info);
		//main으로 redirection 
		response.sendRedirect(request.getContextPath() + "/article/read.do" + "?no=" + no + "&pageNo=" + pageNo);
		
	}

}
