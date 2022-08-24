
import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminremovebook extends HttpServlet {
    
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		out.print("asas");
		String isbn=request.getParameter("isbn");
        adminmethods a=new adminmethods();
		int i=a.removebook(isbn);
		if(i==2)
		{
			response.sendRedirect("adminremovebookfail.jsp");
		}
		else if(i==3)
		{
			response.sendRedirect("adminbookremoved.jsp");
		}
		else if(i==4)
		{
			response.sendRedirect("adminnobookfound.jsp");
		}
		else{
			response.sendRedirect("adminremovebook.jsp");
		}
      }
  }