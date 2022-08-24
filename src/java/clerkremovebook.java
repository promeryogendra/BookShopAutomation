
import clerkmethods.clerkmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class clerkremovebook extends HttpServlet {
    
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		out.print("asas");
		String isbn=request.getParameter("isbn");
        clerkmethods a=new clerkmethods();
		int i=a.removebook(isbn);
		if(i==2)
		{
			response.sendRedirect("clerkremovebookfail.jsp");
		}
		else if(i==3)
		{
			response.sendRedirect("clerkbookremoved.jsp");
		}
		else if(i==4)
		{
			response.sendRedirect("clerknobookfound.jsp");
		}
		else{
			response.sendRedirect("clerkremovebook.jsp");
		}
      }
  }