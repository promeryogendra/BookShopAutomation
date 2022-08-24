import adminmethods.*;
import customermethods.*;
import clerkmethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class login extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String customer=(String)session.getAttribute("loginactive");
		String admin=(String)session.getAttribute("loginadmin");
		String clerk=(String)session.getAttribute("loginclerk");
		
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
		String role=request.getParameter("role");
		if(role.equals("customer"))
		{
			customermethods m=new customermethods();
			if(m.login(name , pass))
			{
				session.setAttribute("loginadmin",null);
				session.setAttribute("loginclerk",null);
				session.setAttribute("loginactive",name);
				response.sendRedirect("customerhome.jsp");
			}
			else
			{
			   out.println("Username or Password incorrect");
			   response.sendRedirect("index.jsp");
			}  
		}
		else if(role.equals("admin"))
		{
			adminmethods m=new adminmethods();
			if(m.login(name , pass))
			{
				session.setAttribute("loginadmin",name);
				session.setAttribute("loginactive",null);
				session.setAttribute("loginclerk",null);
				response.sendRedirect("adminhome.jsp");
			}
			else
			{
			   out.println("Username or Password incorrect");
			   response.sendRedirect("index.jsp");
			}  
		}
		else if(role.equals("clerk"))
		{
			clerkmethods m=new clerkmethods();
			if(m.login(name , pass))
			{
				session.setAttribute("loginadmin",null);
				session.setAttribute("loginclerk",name);
				session.setAttribute("loginactive",null);
				response.sendRedirect("clerkhome.jsp");
			}
			else
			{
			   out.println("Username or Password incorrect");
			   response.sendRedirect("index.jsp");
			}
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
	}
}