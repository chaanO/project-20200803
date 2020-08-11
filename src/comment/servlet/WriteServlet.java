package comment.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.service.GetCommentListService;
import comment.service.CommentListView;

import comment.model.Comment;
import comment.service.WriteCommentService;

/**
 * Servlet implementation class WriteServlet
 */
@WebServlet("/article/write")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Comment comment = new Comment();

		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String body = request.getParameter("message");
		
		String no = request.getParameter("no");
		String pageNo = request.getParameter("pageNo");
		String articleNo = request.getParameter("articleNo");

		if (name == null || body == null || name.isEmpty() || body.isEmpty()) {
			session.setAttribute("info", "이름, 메세지를 정확하게 입력해주세요");
		} else {

			//입력
			comment.setWriterName(name);
			comment.setMessage(body);
			comment.setArticleNo(Integer.parseInt(articleNo));
			
			
			
			WriteCommentService service = WriteCommentService.getInstace();
			
			boolean success = service.write(comment);
			
			
			if (success) {
				session.setAttribute("info", "메세지 등록");
			} else {
				session.setAttribute("info", "메세지 등록실패");
			}

		}
		// service 이용해서 commentlist 가져온다음에


		// session attribute에 넣어주고

		response.sendRedirect(request.getContextPath() + "/article/read.do" + "?no=" + no + "&pageNo=" + pageNo);
		
		
	}



}
