<%@page import="java.util.Iterator"%>
<%@page import="book.book"%>
<%@page import="java.util.List"%>
<%@page import="customermethods.customermethods"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<% String search="";%>
<%
	
	HttpServletResponse httpResponse = (HttpServletResponse)response;
	httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	httpResponse.setHeader("Pragma","no-cache"); 
	httpResponse.setDateHeader ("Expires", 0);
	session =request.getSession(false);
	if(session.getAttribute("loginactive")==null)
	{
		response.sendRedirect("index.jsp");
	}
	%>
<head>
<style>
	.header{
		text-align: center;	
		font-size: 80px;
		background-color: #595959;
	}
	.logout{
		float: right;
		width:100px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background-color: #4CAF50;
		color: white;
		cursor: pointer;
	}
.logout:hover {
    background-color: #45a049;
}
	
	* {box-sizing: border-box;}
	body {
		font-family: Arial, Helvetica, sans-serif;
	  }
	.topnav {
		overflow: hidden;
		background-color: #e9e9e9;
	}
	.topnav a {
		float: left;
		display: block;
		color: black;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
		font-size: 17px;
	}
	.topnav a:hover {
		background-color: #ddd;
		color: black;
	}
	.topnav a.active {
		background-color: #2196F3;
		color: white;
	}
	.link {
		text-decoration: none;
	}
	.topnav .search-container {
		float: right;
	}
	.topnav input[type=text] {
		padding: 7px;
		margin-top: 8px;
		font-size: 17px;
		border: none;
	}
	.topnav .search-container button {
		float: right;
		padding: 6px 10px;
		margin-top: 8px;
		margin-right: 16px;
		background: #ddd;
		font-size: 17px;
		border: none;
		cursor: pointer;
	}
	.topnav .search-container button:hover {
		background: #ccc;
	}
	@media screen and (max-width: 600px) {
	  .topnav .search-container {
		float: none;
	  }
	  .topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		padding: 14px;
	  }
	  .topnav input[type=text] {
		border: 1px solid #ccc;  
	  }
	}
	<!-- list---->
	#two{
		float:left;
	}
	.b{
		width:100px;
		height: 48px;
		border: none;
		border-radius: 5px;
		padding-bottom: 5px;
		margin-bottom: 5px;
		background-color: #4CAF50;
		color: white;
		cursor: pointer;
	}
.b:hover {
    background-color: #45a049;}
</style>
</head>
	<body>
		<div class="header">
			<a class="link" href="customerhome.jsp" style="color:black">BOOKSHOP</a>
			<form class="logoutform" action="logout" method="post">
				<input style="font-size:20px;" class="logout" type="submit" value="logout">
			</form>
		</div>
		<div class="topnav">
			<a class="active" href="customerhome.jsp">Home</a>
			<a href="requestbook.jsp">RequestBook</a>
			<a href="cart.jsp">Cart</a>
			<a href="orders.jsp">Orders</a>
			<div class="search-container">
				<form  action="searchbook" method="post">
					<input type="text" placeholder="Search.." name="search" required autocomplete="off" list="browsers" >
					<datalist id="browsers">
					<% customermethods c=new customermethods();
						List<String> suggest=c.getsuggesions();
						Iterator<String> it=suggest.iterator();
						int l=0;
						while(it.hasNext())
						{
							l=1;%>
							<option value="<%=it.next()%>">
							<%
						}
						if(l==0){%><option value="<%="No item"%>"><%}%>
					  </datalist>
					<button type="submit" name="search">Search</button>
				</form>
			</div>
		</div>
		<h1 style="font-size: 60px;color:rgb(210, 110, 26);alignment:center;text-align: center;">ITEMS IN CART....</h1>
		<%int i=0,j=0;
		try{
			String user=(String) session.getAttribute("loginactive");
			customermethods m=new customermethods();
			List list=m.viewcart(user);
			Iterator<book> itr=list.iterator();
			while(itr.hasNext())
			{
				i++;
				book b=itr.next();%>
				<div style="margin:30px; color:rgb(210, 110, 26);padding-left: 200px;">
					<div class="catbox" id="two" style="float:left;">
						<div class="tip">
							<img src="images/books/<%=b.getbimage()%>" alt="Stories">
						</div>
					</div>
					<%
					i=1;
						session.setAttribute("removecartisbn",b.getisbn());
						session.setAttribute("removecartname",user);
					%>
					<div style="padding-left:300px;">
						<h1><%=b.getbname()%></h1>
						<h3><%=b.getbauthor()%></h3>
						<h3><%=b.getbcost()%></h3>
						<h3><%=b.getbsubject()%></h3>
						<div class="button">
					<form action="costvalidate" method="post">
					<button  class="b" id="buttonleft" name="but" value="but">
						BUY
					</button>
						<input hidden="" type="text" name="ordercount1" value="<%=b.getbcount()%>">
						<input hidden="" type="text" name="orderisbn1" value="<%=b.getisbn()%>">
						<input hidden="" type="text" name="orderbname1" value="<%=b.getbname()%>">
						<input hidden="" type="text" name="ordercost1" value="<%=b.getbcost()%>">
						<input hidden="" type="text" name="orderimage1" value="<%=b.getbimage()%>">
						<br/>
					</form>
					<form class="buttonright" action="removecart" method="post">
					<button  class="b" id="b1" name="but" value="but">
						REMOVE
					</button>
						<input hidden="" type="text" name="isbn" value="<%=b.getisbn()%>">
						<input hidden="" type="text" name="name" value="<%=user%>">
					</form>
				</div>
					</div>
				<br>
				</div>
			<%}
		}
		catch(Exception e){
			response.sendRedirect("cart.jsp");
		}
		if(i==0){%>
		<h1 style="font-size: 60px;color:rgb(210, 110, 26);alignment:center;text-align: center;"><br/>--YOUR CART IS EMPTY--</h1>
			<%}%>
	</body>
</html>