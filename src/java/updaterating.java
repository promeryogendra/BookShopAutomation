import customermethods.customermethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class updaterating extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
	{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		String user=request.getParameter("user");
		String isbn=request.getParameter("isbn");
		int rating=Integer.parseInt((String)request.getParameter("check"));
		String description=request.getParameter("ta");
		customermethods c=new customermethods();
		int i=c.updaterating(isbn,user,rating,description);
		response.sendRedirect("itemdetails.jsp");
      }
  }