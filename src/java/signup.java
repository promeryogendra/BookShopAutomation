import customermethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class signup extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		customermethods m=new customermethods();
		String username=(String)request.getParameter("username");
		String password=(String)request.getParameter("password");
		String gmail=(String)request.getParameter("gmail");
		String fullname=(String)request.getParameter("fullname");
		int age=Integer.parseInt((String)request.getParameter("age"));
		String phoneno=(String)request.getParameter("phoneno");
		if(username.length()<8)
		{
			session.setAttribute("signuperror","Username must be greater than 8 chars");
			response.sendRedirect("signup.jsp");
		}
		else if(password.length()<8)
		{
			session.setAttribute("signuperror","Password must be greater than 8 chars");
			response.sendRedirect("signup.jsp");
		}
		else
		{
			int a=m.signup(username,password,fullname,gmail,age,phoneno);
			if(a==1)
			{
				session.setAttribute("signuperror","Username already exists");
				response.sendRedirect("signup.jsp");
			}
			else if(a==2)
			{
				session.setAttribute("signuperror","Passwods already exists");
				response.sendRedirect("signup.jsp");
			}
			else if(a==3)
			{
				session.setAttribute("signuperror","Gmail already exists");
				response.sendRedirect("signup.jsp");
			}
			else if(a==4)
			{
				session.setAttribute("signuperror","Account successfully created please login");
				session.setAttribute("color","green");
				response.sendRedirect("signup.jsp");
			}
			else
			{
				session.setAttribute("signuperror","Server problem reenter details"+a);
				response.sendRedirect("signup.jsp");
				out.print(username+password+fullname+gmail+age+phoneno);
			}
		}
	}
}