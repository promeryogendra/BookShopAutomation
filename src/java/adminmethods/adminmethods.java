package adminmethods;

import book.orderedbook;
import book.requestbook;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

public class adminmethods
{
	public boolean login(String name,String pass)
	{
		boolean st=false;
		try
	  {
		//loading drivers for mysql
         Class.forName("com.mysql.jdbc.Driver");
		 //creating connection with the database 
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
         PreparedStatement ps =con.prepareStatement("select * from book.admin where name=? and pass=?");
         ps.setString(1, name);
         ps.setString(2, pass);
         ResultSet rs =ps.executeQuery();
         st = rs.next();
      }catch(Exception e)
      {
          e.printStackTrace();
      }
		return st;
	}
	public List viewrequest()
	{
		List<requestbook> list=new LinkedList<requestbook>();
		requestbook b=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.requestbook");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				b=new requestbook(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				list.add(b);
			}
		}
		catch(Exception e)
		{
			
		}
		return list;
	}
	public int addbook(String isbn,String bname,String bauthor,int bcost,int bcount,String formate,String bsubject)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.booklist where isbn='"+isbn+"'");
			ResultSet rs =ps.executeQuery();
			i=4;
			if(rs.next())
			{
				i=2;
			}
			else
			{
				ps=con.prepareStatement("insert into booklist values('"+isbn+"','"+bname+"','"+bauthor+"',"+bcost+",'"+bsubject+"',"+bcount+",'"+isbn+formate+"')");
				i=ps.executeUpdate();
				if(i>0)
					i=1;
			}
			return i;
		}
		catch(Exception e)
		{
			
		}
		return i;
	}
	
	public int updatebook(String isbn, String column,int value)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			//creating connection with the database 
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("select * from booklist where isbn='"+isbn+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				if(column.equals("bcount"))
					value=rs.getInt(6)+value;
				ps=con.prepareStatement("update booklist set "+column+"='"+value+"' where isbn='"+isbn+"'");
				i=ps.executeUpdate();
				if(i>0)
				{
					i=1;
					return i;
				}
			}
			else
			{
				i=2;
				return i;
			}
			return i;
		}
		catch(Exception e)
		{
			
		}
		return i;
	}
	
	
	public int removebook(String isbn)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			//creating connection with the database 
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("select * from orderedbook where isbn='"+isbn+"' and status='pending'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				i=2;
				return i;
			}
			else
			{
				ps=con.prepareStatement("delete from cart where isbn='"+isbn+"'");
				int k=ps.executeUpdate();
				ps=con.prepareStatement("delete from booklist where isbn='"+isbn+"'");
				k=ps.executeUpdate();
				if(k>0)
				{
					ps=con.prepareStatement("delete from rating where isbn='"+isbn+"'");
					k=ps.executeUpdate();
					i=3;
					return i;
				}
				else
				{
					i=4;
					return i;
				}
			}
		}
        catch(Exception e)
        {
			
        }
		return i;
	}
	public int removerequest(String name,String bname)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("delete from requestbook where username='"+name+"' and bname='"+bname+"'");
			i=ps.executeUpdate();
		}
        catch(Exception e)
        {
			
        }
		return i;
	}
	public long[] viewstatus()
	{
		long status[]=new long[5];
		String DATE_FORMAT_NOW = "MMM dd, yyyy hh:mm:ss a";
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
		String current=sdf.format(cal.getTime());
		for(int i=0;i<6;i++);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("select * from orderedbook");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String orddate=rs.getString(5);
				SimpleDateFormat ft = new SimpleDateFormat("MMM d, yyyy hh:mm:ss a", Locale.US);
				java.util.Date t=ft.parse(orddate);
				ft.applyPattern("MMM dd, yyyy hh:mm:ss a");
				orddate=ft.format(t);
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM dd, yyyy hh:mm:ss a");
				LocalDate firstDate = LocalDate.parse(orddate, formatter);
				LocalDate secondDate = LocalDate.parse(current, formatter);
				long days = ChronoUnit.DAYS.between(firstDate, secondDate);
				if(days<=12)
				{
					String str=rs.getString(7);
					if(str.equals("delivered"))
					{
						status[0]+=1;
						status[1]+=(rs.getInt(4)*rs.getInt(6));
					}
					else if(str.equals("pending"))
					{
						status[3]=status[3]+1;
					}
					else if(str.equals("inprogress"))
					{
						status[2]=status[2]+1;
					}
					else
					{
						status[4]=status[4]+1;
					}
				}
			}
		}
		catch(Exception e)
		{
		
		}
		return status;
	}

	public int removeclerk(String clerkname) 
	{
		int i=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("delete from clerk where name='"+clerkname+"'");
			i=ps.executeUpdate();
		}
		catch(Exception e)
		{
			
		}
		return i;
	}

	public int addclerk(String username, String password, String address, String gmail, int age, String phoneno) 
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.clerk where name=?");
			ps.setString(1, username);
			ResultSet rs =ps.executeQuery();
			if( rs.next())
			{
				return 1;
			}
			ps =con.prepareStatement("select * from book.clerk where pass=?");
			ps.setString(1, password);
			rs =ps.executeQuery();
			if( rs.next())
			{
				return 2;
			}
			ps =con.prepareStatement("select * from book.clerk where gmail=?");
			ps.setString(1, gmail);
			rs =ps.executeQuery();
			if( rs.next())
			{
				return 3;
			}
			ps=con.prepareStatement("insert into clerk values('"+username+"','"+password+"',"+age+",'"+phoneno+"','"+address+"','"+gmail+"');");
			i=ps.executeUpdate();
			if(i>0)
				return 4;
			else
				return 5;
		}
		catch(Exception e)
		{
			return i;
		}
	}

	
}
