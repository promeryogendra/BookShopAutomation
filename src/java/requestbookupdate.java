import customermethods.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class requestbookupdate extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
        String bookname = request.getParameter("bookname");
        String author = request.getParameter("author");
        String subject = request.getParameter("subject");
		String user=(String) session.getAttribute("loginactive");
		customermethods m=new customermethods();
        try{
			int i=m.requestbookupdate(bookname,author,subject,user);
			if(i>0)
            {
				response.sendRedirect("requestbooksuccess.jsp");
			}
			else
			{
				response.sendRedirect("requestbook.jsp");
			}
        }
        catch(Exception se)
        {
            se.printStackTrace();
        }
	
      }
  }