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
				//background-image: url("images/extra/head.jpg");
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
		width:200px;
		height: 48px;
		border: none;
		font-size: 18px;
		border-radius: 5px;
		background-color: #ff9800;
		color: black;
		cursor: pointer;
	}
	.b:hover {
    background-color:#393bbd;}
.trow{
	margin-left: 20px;
	width: 100px;
}
.tcol1{
	font-size: 25px;
}
.tcol2
{
	border-radius: 10px;
}
input[type="text"]
{
	margin-left: 50px;
	padding: 11px;
	font-size: 14px;
	width: 270px;
	border-radius: 25px;
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

.file-upload
{
    opacity: 0;
    width: 102px;
    height: 35px;
    position: absolute;
    top: 0px;
    left: 0px;
}
.one{
	margin:2px 0px 5px 350px;
	background-color:#64ce57;
	float:left;
	width:52%;
	height:453px;
	border:2px solid black;
	border-radius: 60px;
	padding-left: 100px;
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
		<div style="background-color:#b8ccf7;">
			<div class="one">
				<form action="adminaddbook" method="post" enctype="multipart/form-data">
					<table>
					<tr class="trow">
						<td class="tcol1">BOOK NAME</td><td height="45" ></td><td class="tco12"><input type="text" name="bname" required></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">BOOK ISBN</td><td height="48"></td><td class="tco12"><input type="text" name="isbn" value="ISBN" pattern="[I]{1}[S]{1}[B]{1}[N]{1}[0-9]{9}" required></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">BOOK AUTHOR</td><td height="48"></td><td class="tco12"><input type="text" name="bauthor" required></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">BOOK SUBJECT</td><td height="48"></td><td class="tco12"><input type="text" name="bsubject" required></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">BOOK COST</td><td height="48"></td><td class="tco12"><input type="text" name="bcost" required pattern="[1-9]{1}[0-9]{0,20}" onkeypress="return AllowNumbersOnly(event)"></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">BOOK COUNT</td><td height="50"></td><td class="tco12"><input type="text" name="bcount" required pattern="[1-9]{1}[0-9]{0,20}" onkeypress="return AllowNumbersOnly(event)"></td>
					</tr>
					<tr class="trow">
						<td class="tcol1">BOOK IMAGE</td><td height="50"></td><td class="tco12"><input type="file" class="bimage" name="bimage" required></td>
					</table><br/>
					<div>
						<input class="b" style="float:left;margin-left: 5px;" type="submit" value="ADDBOOK">
						<input class="b" style="margin-left: 57px;float:left;" id="b1" type="reset" value="RESET"><br/>
					</div><br/>
					<%String kk="";
						if(session.getAttribute("imageerror")==null)
							kk="";
						else
							kk=(String)session.getAttribute("imageerror");
						session.setAttribute("imageerror","");%>
					<h3 style="color:red;margin-top:10px;margin-left:150px;"><%=kk%></h3>
				</form>
			</div>
		</div>
	</body>
</html>