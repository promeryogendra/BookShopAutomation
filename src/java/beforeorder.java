import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class beforeorder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		session.setAttribute("buyid",request.getParameter("buyid"));
		session.setAttribute("bname1",request.getParameter("bname"));
		session.setAttribute("bcost1",request.getParameter("bcost"));
		session.setAttribute("bcount1",request.getParameter("bcount"));
		session.setAttribute("bsubject1",request.getParameter("bsubject"));
		session.setAttribute("bauthor1",request.getParameter("bauthor"));
		session.setAttribute("bimage1",request.getParameter("bimage"));
		response.sendRedirect("itemdetails.jsp");
      }
  }