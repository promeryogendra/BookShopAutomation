<%@page import="book.book"%>
<%@page import="java.util.Iterator"%>
<%@page import="book.requestbook"%>
<%@page import="book.orderedbook"%>
<%@page import="java.util.List"%>
<%@page import="clerkmethods.*"%>
<!DOCTYPE html>
<html>
<%
	HttpServletResponse httpResponse = (HttpServletResponse)response;
	httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	httpResponse.setHeader("Pragma","no-cache"); 
	httpResponse.setDateHeader ("Expires", 0);
	session =request.getSession(false);
	if(session.getAttribute("loginclerk")==null)
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

div.table-title {
  display: block;
  margin: auto;
  max-width: 1170px;
  padding:5px;
}

.table-title h3 {
   color: #fafafa;
   font-size: 30px;
   font-weight: 400;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}


/*** Table Styles **/
.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 90px;
  margin: auto;
  max-width: 1200px;
  padding:5px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:20px;
  padding:24px;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.5);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  background:#4E5066;
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}
.status{
		float: right;
		width:100px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background: #b6b0b6;
		color: black;
		cursor: pointer;
	}
.status:hover {
    background-color: #503f50;
}
</style>
</head>
	<body>
		<div class="header">
			<a class="link" href="clerkhome.jsp" style="color:black">BOOKSHOP</a>
			<form class="logoutform" action="logout" method="post">
				<input style="font-size:20px;" class="logout" type="submit" value="logout">
			</form>
			<form class="statusform" action="updatedailystatus" method="post">
				<input style="font-size:20px;width:200px;margin-right:10px" class="status" type="submit" value="UpdateStatus">
			</form>
		</div>
		<div class="topnav">
			<a class="active" href="clerkhome.jsp">Home</a>
			<a href="clerkvieworders.jsp">Vieworders</a>
			<a href="clerklessbookcount.jsp">Lessbookcount</a>
			<a href="clerkremovebook.jsp">Removebook</a>
			<a href="clerkupdatebook.jsp">Updatebook</a>
		</div>
		<h2 style="font-size: 40px;color:rgb(210, 110, 26);alignment:center;text-align: center;">
			BOOKS WITH LOW COUNT ARE GIVEN BELOW....<BR/>YOU CAN UPDATE BOOK IN UPDATE BOOK TAB..<br/>
		</h2>
		<div class="table-title">
			<table border="1" class="table-fill">
				<thead>
					<tr>
						<th class="text-left" height="5" width="300">S NO</th>
						<th class="text-left" height="5" width="300">ISBN</th>
						<th class="text-left" height="5" width="300">BOOKNAME</th>
						<th class="text-left" height="5" width="300">COUNT</th>
						<th class="text-left" height="5" width="300">COST</th>
					</tr>
				</thead>
				<tbody class="table-hover">
					<%
				clerkmethods a=new clerkmethods();
				List list=a.lessbooks();
				Iterator<book> itr=list.iterator();
				int i=1;
				while(itr.hasNext())
					{
					book v=itr.next();
					%>
						<tr style="width:100%;color:black;text-shadow: -1px -1px 1px rgba(0, 0, 0, 1);">
							<TD class="text-left"><%=i++%></TD>
							<TD class="text-left" ><%=v.getisbn()%></TD>
							<TD class="text-left" ><%=v.getbname()%></TD>
							<TD class="text-left" ><%=v.getbcount()%></TD>
							<TD class="text-left" ><%=v.getbcost()%></TD>
						</tr><%
					}
					if(i==1){%>
						<tr style="width:100%;">
							<th class="text-left" height="5" width="300" style="background:#EBEBEB;color:black;">EMPTY</th>
							<th class="text-left" height="5" width="300" style="background:#EBEBEB;color:black;">EMPTY</th>
							<th class="text-left" height="5" width="300" style="background:#EBEBEB;color:black;">EMPTY</th>
							<th class="text-left" height="5" width="300" style="background:#EBEBEB;color:black;">EMPTY</th>
							<th class="text-left" height="5" width="300" style="background:#EBEBEB;color:black;">EMPTY</th>
							</tr>
						<%}%>
				</tbody>
			</table>
		</div>
		</body>
</html>
