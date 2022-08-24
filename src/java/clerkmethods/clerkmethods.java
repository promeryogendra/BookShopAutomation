package clerkmethods;
import book.book;
import book.orderedbook;
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

public class clerkmethods {
	public boolean login(String name,String pass)
	{
		boolean st=false;
		try
		{
			//loading drivers for mysql
			 Class.forName("com.mysql.jdbc.Driver");
			 //creating connection with the database 
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			 PreparedStatement ps =con.prepareStatement("select * from book.clerk where name=? and pass=?");
			 ps.setString(1, name);
			 ps.setString(2, pass);
			 ResultSet rs =ps.executeQuery();
			 st = rs.next();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return st;
	}
	public List vieworders()
	{
		List<orderedbook> list=new LinkedList<orderedbook>();
		orderedbook b=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.orderedbook where status='pending'");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				b=new orderedbook(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12));
				list.add(b);
			}
		}
		catch(Exception e)
		{
			
		}
		return list;
	}
	public List lessbooks()
	{
		List<book> list=new LinkedList<book>();
		book b=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.booklist where bcount<=20");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				b=new book(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getString(7));
				list.add(b);
			}
		}
		catch(Exception e)
		{
			
		}
		return list;
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
	
	
	public int approveorder(int id)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("update orderedbook set status='inprogress' where id="+id);
			i=ps.executeUpdate();
			if(i>0)
			{
				i=1;
			}
			else{
				i=2;
			}
		}
		catch(Exception e)
		{
			i=3;
		}
		return i;
	}
	
	public int cancelorder(String isbn,int count,int id)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("update orderedbook set status='cancel' where id="+id);
			i=ps.executeUpdate();
			if(i>0)
			{
				ps=con.prepareStatement("update book.booklist set bcount=bcount+"+count+" where isbn='"+isbn+"'");
				i=ps.executeUpdate();
				if(i>0)
					i=1;
			}
			else{
				i=2;
			}
		}
		catch(Exception e)
		{
			i=3;
		}
		return i;
	}

	public void updatedailystatus() 
	{
		String DATE_FORMAT_NOW = "MMM dd, yyyy hh:mm:ss a";
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
		String current=sdf.format(cal.getTime());
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("select * from orderedbook where status='inprogress'");
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
				if(days>=5)
				{
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
					ps=con.prepareStatement("update orderedbook set status='delivered' where id="+rs.getInt(12));
					ps.executeUpdate();
				}
			}
		}
		catch(Exception e)
		{
			
		}
	}

}
	
	
