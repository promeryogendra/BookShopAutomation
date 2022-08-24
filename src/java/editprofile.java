import customermethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class editprofile extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		customermethods m=new customermethods();
		String username=(String) session.getAttribute("loginactive");
		String password=(String)request.getParameter("password");
		String gmail=(String)request.getParameter("gmail");
		String fullname=(String)request.getParameter("fullname");
		int age=Integer.parseInt((String)request.getParameter("age"));
		String phoneno=(String)request.getParameter("phoneno");
		if(password.length()<8)
		{
			session.setAttribute("editerror","Password must be greater than 8 chars");
			response.sendRedirect("editprofile.jsp");
		}
		else
		{
			int a=m.editprofile(username,password,fullname,gmail,age,phoneno);
			if(a==2)
			{
				session.setAttribute("editerror","Passwods already exists");
				response.sendRedirect("editprofile.jsp");
			}
			else if(a==3)
			{
				session.setAttribute("editerror","Gmail already exists");
				response.sendRedirect("editprofile.jsp");
			}
			else if(a==4)
			{
				session.setAttribute("editerror","Account successfully Updated");
				session.setAttribute("color","green");
				session.setAttribute("profilechange",null);
				response.sendRedirect("editprofile.jsp");
			}
			else
			{
				session.setAttribute("editerror","Server problem reenter details"+a);
				out.print("server");
				response.sendRedirect("editprofile.jsp");
				out.print(username+password+fullname+gmail+age+phoneno);
			}
		}
	}
}