
import clerkmethods.clerkmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class clerkupdatebook extends HttpServlet {
    
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		out.print("asas");
		String isbn=request.getParameter("isbn");
		String column=request.getParameter("optradio");
		int value=Integer.parseInt(request.getParameter("value"));
        clerkmethods a=new clerkmethods();
		int i=a.updatebook(isbn,column,value);
		if(i==2)
		{
			response.sendRedirect("clerknobookfound.jsp");
		}
		else if(i==1)
		{
			response.sendRedirect("clerkbookupdated.jsp");
		}
		else
		{
			response.sendRedirect("clerkbookupdatefail.jsp");
		}
      }
  }