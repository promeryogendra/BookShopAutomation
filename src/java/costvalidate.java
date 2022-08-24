import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class costvalidate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.setAttribute("ordercount",request.getParameter("ordercount1"));
		session.setAttribute("orderisbn",request.getParameter("orderisbn1"));
		session.setAttribute("orderbname",request.getParameter("orderbname1"));
		session.setAttribute("ordercost",request.getParameter("ordercost1"));
		session.setAttribute("orderimage",request.getParameter("orderimage1"));
		response.sendRedirect("placeorder.jsp");
      }
  }