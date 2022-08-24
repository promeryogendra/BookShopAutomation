package customermethods;
import book.book;
import book.customer;
import book.orderedbook;
import book.rating;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
public class customermethods
{
	public boolean login(String name,String pass)
	{
	  boolean st =false;
      try
	  {
		//loading drivers for mysql
         Class.forName("com.mysql.jdbc.Driver");
		 //creating connection with the database 
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
         PreparedStatement ps =con.prepareStatement("select * from book.customer where name=? and pass=?");
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public List getsuggesions()
	{
		List<String> list=new LinkedList<String>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select bname,bauthor from book.booklist");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString("bname"));
				list.add(rs.getString("bauthor"));
			}
		}
		catch(Exception e)
		{
			
		}
		return list;
		
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public List search(String search)
	{
		List<book> list=new LinkedList<book>();
		book b=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.booklist where (bname REGEXP '"+search+"') || (bauthor REGEXP '"+search+"');");
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int requestbookupdate(String bookname,String author,String subject,String user)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			//creating connection with the database 
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("insert into requestbook values(?,?,?,?)");
			ps.setString(1, bookname);
			if(author==null)
				ps.setString(2, "none");
			else
				ps.setString(2,author);
			if(author==null)
				ps.setString(3, "none");
			else
				ps.setString(3, subject);
			ps.setString(4,user);
			i=ps.executeUpdate();
        }
        catch(Exception se)
        {
            se.printStackTrace();
        }
		return i;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public List viewcart(String user)
	{
		List<book> list=new LinkedList<book>();
		book b=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.booklist where isbn=any(select isbn from cart where name='"+user+"')");
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public List vieworders(String user)
	{
		List<orderedbook> list=new LinkedList<orderedbook>();
		orderedbook b=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.orderedbook where name='"+user+"' and view='true'");
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int removecart(String name,String isbn)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			//creating connection with the database 
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("delete from cart where name='"+name+"' and isbn='"+isbn+"';");
			i=ps.executeUpdate();
		}
        catch(Exception e)
        {
			
        }
		return i;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int removeorder(String name,String isbn,String date,String bname,String status,int id)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("update orderedbook set view='false' where id="+id);
			i=ps.executeUpdate();
		}
		catch(Exception e)
        {
			
        }
		return i;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public void logout()
	{
		
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int addtocart(String user,String cartid)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			//creating connection with the database 
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("insert into cart values(?,?)");
			ps.setString(1,user);
			ps.setString(2,cartid);
			i=ps.executeUpdate();
        }
        catch(Exception se)
        {
			
        }
		return i;
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public int ordersuccess(String user,String isbn,String bname,int cost,String phone,String stringcount,
			int count,String address,String date,String image)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			 Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("select bcount from booklist where isbn='"+isbn+"'");
			ResultSet rs=ps.executeQuery();
			ps=null;
			if(rs.next() && rs.getInt(1)>=count)
			{
				int ff=rs.getInt(1);
				//creating connection with the database 
				ps=con.prepareStatement("insert into orderedbook values"
					+ "('"+user+"','"+bname+"','"+isbn+"','"+cost+"','"+date+"','"+count+"','"+"pending"+"',"
						+ "'"+image+"','"+address+"','"+phone+"','true',0)");
				i=ps.executeUpdate();
				if(i>0)
				{
					ps=con.prepareStatement("update booklist set bcount='"+(ff-count)+"' where isbn='"+isbn+"'");
					i=ps.executeUpdate();
					i=1;
				}
			}
		}
        catch(Exception se)
        {
			
        }
		return i;
	}

	public int updaterating(String isbn, String user,int rating, String description)
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("select * from rating where user='"+user+"' and isbn='"+isbn+"'");
			i=3;
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				ps=con.prepareStatement("update rating set rating="+rating+" , review='"+description+"' where isbn='"+isbn+"' and user='"+user+"'");
				i=ps.executeUpdate();
				i=1;
			}
			else
			{
				ps=con.prepareStatement("insert into rating values('"+isbn+"',"+rating+",'"+description+"','"+user+"');");
				i=ps.executeUpdate();
				i=1;
			}
		}
		catch(Exception e)
		{
			
		}
		return i;
	}
	public float getrating(String isbn)
	{
		float f=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps=con.prepareStatement("select rating from rating where isbn='"+isbn+"'");
			ResultSet rs=ps.executeQuery();
			int count=0;
			while(rs.next())
			{
				count++;
				f=f+rs.getInt("rating");
			}
			f=f/count;
		}
		catch(Exception e)
		{
			
		}
		return f;
	}
	public List getreviews(String isbn)
	{
		List<rating> list=new LinkedList<>();
		rating b=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.rating where isbn='"+isbn+"'");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				b=new rating(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getString(4));
				list.add(b);
			}
		}
		catch(Exception e)
		{
			
		}
		return list;
	}

	public int signup(String username, String password, String fullname, String gmail, int age, String phoneno) 
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.customer where name=?");
			ps.setString(1, username);
			i=10;
			ResultSet rs =ps.executeQuery();
			if( rs.next())
			{
				return 1;
			}
			i=11;
			ps =con.prepareStatement("select * from book.customer where pass=?");
			ps.setString(1, password);
			rs =ps.executeQuery();
			i=12;
			if( rs.next())
			{
				return 2;
			}
			i=13;
			ps =con.prepareStatement("select * from book.customer where gmail=?");
			ps.setString(1, gmail);
			rs =ps.executeQuery();
			i=14;
			if( rs.next())
			{
				return 3;
			}
			ps=con.prepareStatement("insert into customer values('"+username+"','"+password+"','"+fullname+"','"+gmail+"',"+age+",'"+phoneno+"');");
			i=ps.executeUpdate();
			i=15;
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
	public customer customerobject(String username)
	{
		customer obj=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.customer where name=?");
			ps.setString(1, username);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				obj=new customer(rs.getString(1),"",rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6));
			}
		}
		catch(Exception e)
		{
			
		}
		return obj;
	}

	public int editprofile(String username, String password, String fullname, String gmail, int age, String phoneno) 
	{
		int i=0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book?","root","mysql");
			PreparedStatement ps =con.prepareStatement("select * from book.customer where pass=? and name!=?");
			ps.setString(1, password);
			ps.setString(2, username);
			ResultSet rs =ps.executeQuery();
			if( rs.next())
			{
				return 2;
			}
			ps =con.prepareStatement("select * from book.customer where gmail=? and name!=?");
			ps.setString(1, gmail);
			ps.setString(2, username);
			rs =ps.executeQuery();
			if( rs.next())
			{
				return 3;
			}
			
			ps=con.prepareStatement("update customer set pass='"+password+"' , gmail='"+gmail+"' , fullname='"+fullname+"' , age="+age+", phoneno='"+phoneno+"' where name='"+username+"'");
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////