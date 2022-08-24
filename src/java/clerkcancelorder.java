
import adminmethods.adminmethods;
import clerkmethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class clerkcancelorder extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String isbn=request.getParameter("isbn");
		int count=Integer.parseInt((String)request.getParameter("bcount"));
		int id=Integer.parseInt((String)request.getParameter("id"));
        clerkmethods a=new clerkmethods();
		int i=a.cancelorder(isbn,count,id);
		if(i==1)
		{
			response.sendRedirect("clerkvieworders.jsp");
		}
		else
		{
			response.sendRedirect("clerkordercancelnotpossible.jsp");
		}
      }
  }