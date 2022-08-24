import customermethods.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
public class ordersuccess extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String user=(String) session.getAttribute("loginactive");
		String isbn=(String) session.getAttribute("orderisbn");
		String bname=(String) session.getAttribute("orderbname");
		int cost=Integer.parseInt((String)session.getAttribute("ordercost"));
		String phone=(String) session.getAttribute("orderphone");
		String stringcount=(String)session.getAttribute("ordercount");
		int count=Integer.parseInt(stringcount);
		String address=(String) session.getAttribute("orderaddress");
		String date=(new java.util.Date()).toLocaleString();
		String image=(String) session.getAttribute("orderimage");
		customermethods m= new customermethods();
		int i=m.ordersuccess(user,isbn,bname,cost,phone,stringcount,count,address,date,image);
		if(i>0)
		{
			response.sendRedirect("ordersuccess.jsp");
		session.setAttribute("paymentok","false");
		}
		else
		{
			response.sendRedirect("lowordercount.jsp");
		}
	
      }
  }