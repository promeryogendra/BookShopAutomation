import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class paymentbefore extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		session.setAttribute("paymentok","true");
		session.setAttribute("orderphone",request.getParameter("phone"));
		session.setAttribute("ordercount",request.getParameter("count"));
		session.setAttribute("orderaddress",request.getParameter("address"));
		response.sendRedirect("payment.jsp");
      }
  }