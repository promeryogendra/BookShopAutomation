import customermethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class removeorder extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String name=(String) session.getAttribute("loginactive");
		String isbn=request.getParameter("listisbn");
		String date=request.getParameter("listdate");
		String status=request.getParameter("liststatus");
		String bname=request.getParameter("listbname");
		int id=Integer.parseInt(request.getParameter("id"));
        customermethods m=new customermethods();
		if(status.equals("delivered") || status.equals("cancel"))
		{
		int i=m.removeorder(name,isbn,date,bname,status,id);
		if(i>0){
			    out.println("<script type=\"text/javascript\">");
				out.println("alert('Selected item removed from orders list.\\nThank you for using our website..');");
				out.println("location='orders.jsp';");
				out.println("</script>");
			}
		}
		else{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The order is not successfully completed.\\nAfter the completion of order you can remove.');");
				out.println("location='orders.jsp';");
				out.println("</script>");
				}
      }
  }

