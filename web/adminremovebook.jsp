<!DOCTYPE html>
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
///////////////////////
.divi{ 
font-family: "Helvetica Neue", Helvetica, sans-serif;   
color: #444;   
-webkit-font-smoothing: antialiased;    background: #f0f0f0;
}
.divi{
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -360px;
	position: fixed;
	width:700px;
	margin-top: -40px;
	padding-top:30px;
	padding-left: 100px;
	border-radius: 50px;
	height:330px;
    top: 50%;
    left: 50%;
	padding-left: 100px;
	background: #6fcd7e;
    border: 3px solid black;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
}
.lili{
    margin: 1 auto;
    margin-top: 20px;
}
label {
    color: black;
    display: inline-block;
    font-size: 15px;
}
p a {
    font-size: 11px;
    color: #aaa;
    float: right;
    margin-top: -13px;
    margin-right: 20px;
}
#password:hover {
    color: chocolate;
}
#username{
	font-family: "Helvetica Neue", Helvetica, sans-serif;
    font-size: 20px;
    outline: none;
    color: black;
    padding: 10px;
    margin-top: 12px;
    width: 290px;
    height: 35px;
	background: #fff;
    border-radius: 10px;
    border: 3px solid #5AB0DB;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
}
#password{
	font-family: "Helvetica Neue", Helvetica, sans-serif;
    font-size: 20px;
    outline: none;
    color: black;
    padding: 10px;
    margin-top: 12px;
    width: 290px;
    height: 35px;
	background: #fff;
    border-radius: 10px;
    border: 3px solid #5AB0DB;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
}
#username:focus{
    outline: none;
    box-shadow: 0px 0px 5px #61C5FA;
    border-color: #5AB0DB;
}

#username:hover {
    border: 1px solid #999;
    border-radius: 5px;
}
#password:focus{
    outline: none;
    box-shadow: 0px 0px 5px #61C5FA;
    border-color: #5AB0DB;
}

#password:hover {
    border: 1px solid #999;
    border-radius: 5px;
}
.isbnsubmit{
		width:170px;
		height: 48px;
		border: none;
		font-size: 20px;
		margin-left:160px;
		margin-top: 10px;
		border-radius: 12px;
		border-radius: 5px;
		background-color: #ff9800;
		color: black;
		cursor: pointer;
	}
.isbnsubmit:hover {
    background-color: #45a049;
}
</style>
</head>
	<body>
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
		
			<h1 style="font-size: 60px;color:rgb(210, 110, 26);alignment:center;text-align: center;">ENTER ISBN TO REMOVE BOOK</h1>
			
		<div class="divi">
			<form class="lili" action="adminremovebook" method="post">
				<label style="font-size:25px;">ISBN&ensp;NO&ensp;&ensp;&ensp;</label>
				<input required type="text" id="username" value="ISBN" name="isbn" placeholder="ISBN" pattern="[I]{1}[S]{1}[B]{1}[N]{1}[0-9]{9}">(required)
				<br/><br/><br/>
				<label style="font-size:25px;">BOOKNAME</label>
				<input type="text" name="isbn" id="password" placeholder="BOOK NAME">(optional)
				<br/><br/><br/>
				<input class="isbnsubmit" type="submit" value="Submit">
			</form>
		</div>
		</body>
</html>
