<%@page import="java.util.List"%>
<%@page import="adminmethods.adminmethods"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<%
	HttpServletResponse httpResponse = (HttpServletResponse)response;
	httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	httpResponse.setHeader("Pragma","no-cache"); 
	httpResponse.setDateHeader ("Expires", 0);
	session =request.getSession(false);
	if(session.getAttribute("loginadmin")==null)
	{
		response.sendRedirect("index.jsp");
	}
	%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
  function AllowNumbersOnly(e) {
    var code = (e.which) ? e.which : e.keyCode;
    if (code > 31 && (code < 48 || code > 57)){
      e.preventDefault();
    }
  }
</script>
<style>
	.cont{
		width: 95%;
		margin: 0 auto;
	}
	.header{
				text-align: center;
				font-size: 80px;
				width:100%;
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

#heading-block{
	width:100%;
	height: auto;
	float: left;
	color: #1aaa1a;
	font-size: 22px;
}
#heading-block h2{
	line-height: 35px;
	border-left: 20px solid #1aaa1a;
	padding-left: 10px;
}
.catbox{
	width: 250px;
	height: 250px;
	float: left;
	overflow: hidden;
	position: relative;
	margin: 0 20 30 0;
}
.catbox span{
	width: 73%;
	height: 35px;
	line-height: 35px;
	background:rgba(0,0,0,0.9);
	color:white;
	display: block;
	bottom: 30px;
	position: absolute;
	z-index: 999;
	text-align: center;
}
.catbox:hover span{
	color: #1aaa1a;
	width:80%;
}
.catbox img{
	max-width: 100%;
	transition: all .5s ease;
}
.catbox:hover img{
	transform: scale(1.2,1.2);
	transition: all .5s ease;
}
	.hea{
		font-size: 15px;
		text-align: center;
	}
	.b{
		width:80%;
		height: 48px;
		border: none;
		font-size: 18px;
		border-radius: 5px;
		margin-top: -10px;
		background-color: #ff9800;
		color: black;
		cursor: pointer;
		margin-right: 100px;
	}
	.b:hover {
    background-color:#393bbd;}
.trow{
	margin-left: 20px;
	width: 100px;
}
.tcol1{
	font-size: 22px;
}
.tcol2
{
	border-radius: 10px;
}
.bimage
{
    font-family: "Segoe UI","Segoe","Verdana";
    background: #0f9e0a center top no-repeat;
    background-image: linear-gradient(rgb(15, 158, 10), rgb(24, 105, 21)); 
    overflow: hidden;
    color: white;
	margin-left: 57px;
    border-radius: 13px;
    width: 250px;  
    position: relative; 
    padding: 8px 10px 8px 10px;
}

.bimage:hover
{
    background: #0a8406 center top no-repeat;
    background-image: linear-gradient(rgb(12, 141, 8), rgb(19, 88, 17));     
}

label{
color: #B4886B;
font-weight: bold;
display: block;
height: 40px;
border: 1px solid black;
width: 200px;
padding: 5px 5px 15px 50px;
color:black;
font-size: 25px;
border-radius: 15px;
background: #85cbc7;
float: left;
margin-left: 50px;
}
.one{
	margin:0px 0px 5px 350px;
	background-color:#64ce57;
	float:left;width:52%;
	height:375px;
	border:2px solid black;
	padding-left:100px;
	border-radius: 60px;
}
</style>
</head>
	<body>
		<div>
		<div class="header">
			<a class="link" href="adminhome.jsp" style="color:black">BOOKSHOP</a>
			<form class="logoutform" action="logout" method="post">
				<input style="font-size:20px;" class="logout" type="submit" value="logout">
			</form>
		</div>
		<div class="topnav">
			<a class="active" href="adminhome.jsp">Home</a>
			<a href="adminviewrequest.jsp">Requests</a>
			<a href="adminaddbook.jsp">Addbook</a>
			<a href="adminremovebook.jsp">Removebook</a>
			<a href="adminupdatebook.jsp">Updatebook</a>
			<a href="adminviewstatus.jsp">Viewstatus</a>
			<a href="adminremoveclerk.jsp">ClerkUpdate</a>
		</div>
		</div>
		<h1 style="color:rgb(210, 110, 26);alignment:center;text-align: center;">..THE STATUS OF BOOKSHOP UPTO TWO WEEKS BEFORE.. </h1>
		<%
		adminmethods a=new adminmethods();
		long status[]=a.viewstatus();
		%>
		<div style="background-color:#b8ccf7;">
			<div class="one">
				<form action="adminviewstatus.jsp	" method="post" enctype="multipart/form-data">
					<table>
					<tr class="trow">
						<td class="tcol1">ENTER DAYS</td><td height="45" ></td><td class="tco12"><label>2WEEKS</label></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">SOLD BOOKS COUNT</td><td height="48"></td><td class="tco12"><label><%=status[0]%></label></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">SOLD BOOKS COST</td><td height="48"></td><td class="tco12"><label><%=status[1]%></label></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">ORDERS IN PROGRESS</td><td height="48"></td><td class="tco12"><label><%=status[2]%></label></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">ORDERS IN PENDING</td><td height="48"></td><td class="tco12"><label><%=status[3]%></label></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">CANCELED BOOKS</td><td height="50"></td><td class="tco12"><label><%=status[4]%></label></td>
					</tr>
					</table><br/>
					<div>
						<input class="b"  type="submit" value="REFRESS TO RELOAD THE STATUS">
					</div>
					
				</form>
			</div>
		</div>
	</body>
</html>