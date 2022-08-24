import customermethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class addtocart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String cartid=(String) session.getAttribute("cartid");
		String user=(String)session.getAttribute("loginactive");
        customermethods m=new customermethods();
		int i=m.addtocart(user,cartid);
		if(i>0)
		{
		response.sendRedirect("itemadded.jsp");
		}
		else
		{
			response.sendRedirect("itemcantadd.jsp");
		}
      }
  }