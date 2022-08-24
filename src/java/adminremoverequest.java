import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminremoverequest extends HttpServlet {
    
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String bname=request.getParameter("bname");
		String name=request.getParameter("name");
        adminmethods a=new adminmethods();
		int i=a.removerequest(name,bname);
		response.sendRedirect("adminviewrequest.jsp");
      }
  }