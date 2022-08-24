import adminmethods.adminmethods;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/uploadImage")
@MultipartConfig(maxFileSize=16666666)
public class adminaddbook extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String formate[]={"jpg","jpeg","png","jfif","bmp"};
		PrintWriter out = response.getWriter();
		Part file = request.getPart("bimage");
		
		//parmeters
		String isbn=(String)request.getParameter("isbn");
		String bname=(String)request.getParameter("bname");
		String bauthor=(String)request.getParameter("bauthor");
		String bsubject=(String)request.getParameter("bsubject");
		int bcost=Integer.parseInt((String)request.getParameter("bcost"));
		int bcount=Integer.parseInt((String)request.getParameter("bcount"));
		
        String fileName=extractfilename(file);
	    String str=fileName.substring(fileName.lastIndexOf(".")+1);
	    str=str.toLowerCase();
		int count=0;
		HttpSession s=request.getSession();
		for(int i=0;i<formate.length;i++)
		{
			if(formate[i].equals(str))
			{
				count++;
				break;
			}
		}
		if(count>0)
		{
			adminmethods a=new adminmethods();
			int i=a.addbook(isbn,bname,bauthor,bcost,bcount,"."+str,bsubject);
			out.print(isbn+" "+bname+" "+bauthor+" "+bcount+" "+bcost+" "+isbn+File.separator+"."+str+" "+bsubject);
			if(i==1)
			{
				String savePath="C:\\Users\\yoendra\\Documents\\NetBeansProjects\\book\\web\\images\\books";
				file.write(savePath+File.separator+isbn+"."+str);
				s.setAttribute("imageerror","");
				response.sendRedirect("adminaddbooksuccess.jsp");
			}
			if(i==2)
			{
				s.setAttribute("imageerror","ISBN is already existed");
				response.sendRedirect("adminaddbook.jsp");
			}
		}
		else
		{
			s.setAttribute("imageerror","Select a supported image formate");
			response.sendRedirect("adminaddbook.jsp");
		}
	}
	private String extractfilename(Part file)
    {
            String cd = file.getHeader("content-disposition");
            String[] items = cd.split(";");
            for (String string : items) {
                if (string.trim().startsWith("filename")) {
                    return string.substring(string.indexOf("=") + 2,string.length()-1);
                }
            }
            return "";
    }

}
