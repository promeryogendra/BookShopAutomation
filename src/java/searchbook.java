import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class searchbook extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		boolean st=false;
        String search = request.getParameter("search");
		HttpSession session = request.getSession();
		session.setAttribute("searchvalue",search);
		response.sendRedirect("searchresults.jsp");
      }
  }