import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class logout extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.setAttribute("loginactive",null);
		session.setAttribute("loginadmin",null);
		session.setAttribute("loginclerk",null);
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
}