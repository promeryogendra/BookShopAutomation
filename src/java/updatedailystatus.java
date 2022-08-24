import clerkmethods.clerkmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class updatedailystatus extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		clerkmethods a=new clerkmethods();
		a.updatedailystatus();
		response.sendRedirect("clerkhome.jsp");
      }
  }