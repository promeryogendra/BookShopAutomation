<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="customermethods.customermethods"%>
<!DOCTYPE html>
<html>
<%
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
		margin: 0;
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
		padding: 6px;
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
		margin: 0;
		padding: 14px;
	  }
	  .topnav input[type=text] {
		border: 1px solid #ccc;  
	  }
	}
	.hea{
		font-size: 15px;
		text-align: center;
	}
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
		<div style="padding-left:16px">
			<div class="hea">
				<h1 style="color:green;padding-top: 7px;">SORRY NO ITEM SELECTED FOR ORDER.<br>
					PLEASE SELECT A ITEM FIRST.<br>IF YOU CAN'T FIND ANY BOOK THAT YOU WANT.<br>
					PLEASE REQUEST THE ADMIN TO GET THE BOOK.
				</h1>
			</div>
		</div>
		</body>
</html>
