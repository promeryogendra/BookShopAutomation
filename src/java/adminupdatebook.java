
import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminupdatebook extends HttpServlet {
    
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		out.print("asas");
		String isbn=request.getParameter("isbn");
		String column=request.getParameter("optradio");
		int value=0;
		try
		{
			value=Integer.parseInt(request.getParameter("value"));
		}
		catch(Exception e)
		{
			response.sendRedirect("adminupdatebook.jsp");
		}
        adminmethods a=new adminmethods();
		int i=a.updatebook(isbn,column,value);
		if(i==2)
		{
			response.sendRedirect("adminnobookfound.jsp");
		}
		else if(i==1)
		{
			response.sendRedirect("adminbookupdated.jsp");
		}
		else
		{
			response.sendRedirect("adminbookupdatefail.jsp");
		}
      }
  }