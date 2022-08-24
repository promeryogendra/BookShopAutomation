import adminmethods.adminmethods;
import customermethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class adminaddclerk extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		adminmethods c=new adminmethods();
		String username=(String) request.getParameter("username");
		String password=(String)request.getParameter("password");
		String gmail=(String)request.getParameter("gmail");
		String address=(String)request.getParameter("address");
		int age=Integer.parseInt((String)request.getParameter("age"));
		String phoneno=(String)request.getParameter("phoneno");
		if(username.length()<8)
		{
			session.setAttribute("adderror","Username must be greater than 8 chars");
			response.sendRedirect("adminaddclerk.jsp");
		}
		else if(password.length()<8)
		{
			session.setAttribute("adderror","Password must be greater than 8 chars");
			response.sendRedirect("adminaddclerk.jsp");
		}
		else
		{
			int a=c.addclerk(username,password,address,gmail,age,phoneno);
			if(a==1)
			{
				session.setAttribute("adderror","Username already exists");
				response.sendRedirect("adminaddclerk.jsp");
			}
			else if(a==2)
			{
				session.setAttribute("adderror","Passwods already exists");
				response.sendRedirect("adminaddclerk.jsp");
			}
			else if(a==3)
			{
				session.setAttribute("adderror","Gmail already exists");
				response.sendRedirect("adminaddclerk.jsp");
			}
			else if(a==4)
			{
				session.setAttribute("adderror","Clerk successfully added");
				session.setAttribute("clerkcolor","green");
				response.sendRedirect("adminaddclerk.jsp");
			}
			else
			{
				session.setAttribute("adderror","Server problem reenter details"+a);
				response.sendRedirect("adminaddclerk.jsp");
			}
		}
	}
}