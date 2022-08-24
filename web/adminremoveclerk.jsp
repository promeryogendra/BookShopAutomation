<!DOCTYPE html>
<html><head>
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
.addorremove{
	width:600px;
	height: 350px;
	margin-left: 400px;
	margin-top:30px;
	border:1px solid black;
	border-radius:20px;
	background:#6cd582
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
#username:focus{
    outline: none;
    box-shadow: 0px 0px 5px #61C5FA;
    border-color: #5AB0DB;
}

#username:hover {
    border: 1px solid #999;
    border-radius: 5px;
}
</style>
<style></style></head>
	<body>
		<div class="header">
			<a class="link" href="adminhome.jsp" style="color:black">BOOKSHOP</a>
			<form class="logoutform" action="logout" method="post">
				<input style="font-size:20px;" class="logout" value="logout" type="submit">
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
		<div class="addorremove">
			<form action="adminaddclerk.jsp" method="post" style="border-bottom: 2px double black;">
				<input style="margin-left:200px;margin-top: 20px;margin-bottom:  20px;" class="isbnsubmit" value="ADD CLERK" type="submit">
			</form><br><br>
			<form action="adminremoveclerk" method="post">
				<strong style="font-size:30px;padding-left: 200px;">CLERK ID:</strong><br>
				<input style="margin-left: 140px;" id="username" required name="clerkid" type="text"><br><br>
				<input style="margin-left:205px;" class="isbnsubmit" value="REMOVE CLERK" type="submit">
			</form>
			<%
				String s=(String)session.getAttribute("clerksuccesss");
				if(s==null){
					s="";
				}
				session.setAttribute("clerksuccesss",null);
				String color=(String)session.getAttribute("color");
				session.setAttribute("color","red");
			%>
			<p style="text-align: center;color:<%=color%>"><%=s%></p>
		</div>
		

</body></html>