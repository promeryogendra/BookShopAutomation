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

/////////////////////////
input[type=text], select {
    width: 100%;
	height: 100px;
    margin: 8px 0;
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
.topnav .search-container button:hover {
  background: #ccc;
}


///////////////////////////////////
.divi{   
font-family: "Helvetica Neue", Helvetica, sans-serif;   
color: #444;   
-webkit-font-smoothing: antialiased;    background: #f0f0f0;
}
.divi{
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -300px;
	position: fixed;
    top: 50%;
    left: 50%;
	width:700px;
	margin-top: -40px;
	padding-top:50px;
	padding-left: 100px;
	border-radius: 50px;
	height:330px;
	background: #6fcd7e;
    border: 3px solid black;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
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
    color: black;
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
    border-radius: 15px;
    border: 3px solid #5AB0DB;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
}
#username:focus{
    outline: none;
	border-radius: 13px;
    box-shadow: 0px 0px 5px #61C5FA;
    border-color: #993300;
}

#username:hover {
    border: 3px solid #330099;
    border-radius: 15px solid #66ffff;
}
#password:focus{
    outline: none;
	border-radius: 13px;
    box-shadow: 0px 0px 5px #61C5FA;
    border-color: #993300;
}

#password:hover {
    border:3px solid #330099;
    border-radius: 15px solid #66ffff;
}
.isbnsubmit{
		width:160px;
		height: 48px;
		border: none;
		font-size: 20px;
		margin-left:180px;
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
//////////////
.title{
	font-family:sans-serif;
	color: #dc2d5e;
}
.radioc{
	display: inline-block;
	position: relative;
	cursor: pointer;
	font-family: sans-serif;
	font-size: 22px;
	user-select:none;
	padding-left: 30px;
}
.radioc input{
	display: none;
}
.radioc .circle{
	display: inline-block;
	width: 25px;
	height:25px;
	background-color: #eee;
	position: absolute;
	left: 0;
	top: 0;
	border-radius: 50%;
}
.radioc:hover .circle{
	background-color:#cc;
}
.radioc input:checked + .circle{
	background-color: #2196fc;
}
.radioc input:checked + .circle:after{
	content: "";
	height: 10px;
	width: 10px;
	background-color: white;
	position: absolute;
	border-radius: 50%;
	left: 50%;
	top:50%;
	transform: translate(-50%,-50%)
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
		
			<h1 style="font-size: 60px;color:rgb(210, 110, 26);alignment:center;text-align: center;">
				ENTER ISBN TO UPDATE BOOK
			</h1>
			
		<div class="divi">
			<form action="clerkupdatebook" method="post">
				<label style="font-size:25px;" for="fname">ISBN&emsp;&emsp;</label>
					<input required class="search-container" id="username" type="text" value="ISBN" name="isbn" placeholder="ISBN" pattern="[I]{1}[S]{1}[B]{1}[N]{1}[0-9]{9}">(required)
					<br/><br/><br/>
					<label style="font-size:25px;" for="fname">UPDATE</label>
					&nbsp;&nbsp;&nbsp;<label class="radioc">COST&nbsp;
					<input class="radio1" id="r1" type="radio" name="optradio" value="bcost">
					<span class="circle"></span>
				</label>
				<label class="radioc">COUNT
					<input class="radio1" id="r2" type="radio" name="optradio" value="bcount">
					<span class="circle"></span>
				</label>
				<br/><br/>
				<label style="font-size:25px;" for="fname">VALUE&emsp;&nbsp;</label>
					<input required class="search-container" id="password" type="text" name="value" placeholder="Enter value to update" pattern="[1-9]{1}[0-9]{0,20}" onkeypress="return AllowNumbersOnly(event)">(required)
					<br/><br/>
				<input class="isbnsubmit" type="submit" value="Submit">
				
			</form>
		</div>
		</body>
</html>
