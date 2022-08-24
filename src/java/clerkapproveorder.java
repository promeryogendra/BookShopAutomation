import adminmethods.adminmethods;
import clerkmethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class clerkapproveorder extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		int id=Integer.parseInt((String)request.getParameter("id"));
        clerkmethods a=new clerkmethods();
		int i=a.approveorder(id);
		if(i==1)
		{
			response.sendRedirect("clerkvieworders.jsp");
		}
		else
		{
			response.sendRedirect("clerkorderapprovenotpossible.jsp");
		}
      }
  }