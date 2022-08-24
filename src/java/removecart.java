
import customermethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class removecart extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String name=request.getParameter("name");
		String isbn=request.getParameter("isbn");
        customermethods m=new customermethods();
		int i=m.removecart(name, isbn);
		if(i>0)
		{
			response.sendRedirect("cart.jsp");
		}
		else
		{
			response.sendRedirect("cart.jsp");
		}
      }
  }