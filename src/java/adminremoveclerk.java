import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class adminremoveclerk extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		adminmethods a=new adminmethods();
		String clerkname=request.getParameter("clerkid");
		int i=a.removeclerk(clerkname);
		if(i==1)
		{
			session.setAttribute("color","green");
			session.setAttribute("clerksuccesss","Clerk removed successfully");
			response.sendRedirect("adminremoveclerk.jsp");
		}
		else
		{
			session.setAttribute("color","red");
			session.setAttribute("clerksuccesss","ClerkName not found");
			response.sendRedirect("adminremoveclerk.jsp");
		}
	}
}