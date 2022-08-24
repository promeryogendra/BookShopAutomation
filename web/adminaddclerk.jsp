<%-- 
    Document   : signup
    Created on : Apr 12, 2018, 11:17:44 AM
    Author     : yoendra
--%>
<%
HttpServletResponse httpResponse = (HttpServletResponse)response;
	httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	httpResponse.setHeader("Pragma","no-cache"); 
	httpResponse.setDateHeader ("Expires", 0);
	session =request.getSession(false);
	if(session.getAttribute("loginactive")!=null)
	{
		response.sendRedirect("customerhome.jsp");
	}
	else if(session.getAttribute("loginclerk")!=null)
	{
		response.sendRedirect("clerkhome.jsp");
	}
	else if(session.getAttribute("loginadmin")==null)
	{
		response.sendRedirect("index.jsp");
	}
	%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<script type="text/javascript">
  function AllowNumbersOnly(e) {
    var code = (e.which) ? e.which : e.keyCode;
    if (code > 31 && (code < 48 || code > 57)){
      e.preventDefault();
    }
  }
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGNUP</title>
		<style>
			.divi{
				margin-left: 500px;
				margin-top:10px;
				width:500px;
				height:582px;
				border:1px solid black;
				border-radius: 20px;
			}
			.head{
				text-align: center;
				height:50px;
				border-bottom: 2px solid dodgerblue;
				padding-bottom: 10px;
				padding-top: 10px;
				border-radius: 20px;
				margin-top:0px;
				background: #29747c
			}
			.subm{
					width:160px;
					height: 48px;
					border: none;
					font-size: 20px;
					margin-left:30px;
					margin-top: 10px;
					border-radius: 12px;
					background-color: #ff9800;
					color: black;
					cursor: pointer;
				}
			.subm:hover {
				background-color: #45a049;
			}

			.username:focus{
				outline: none;
				border-radius: 19px;
				box-shadow: 0px 0px 5px #61C5FA;
				border-color: #993300;
			}

			.username:hover {
				border: 3px solid #330099;
				border-radius: 15px solid #66ffff;
			}

			.username{
				font-family: "Helvetica Neue", Helvetica, sans-serif;
				font-size: 20px;
				outline: none;
				color: black;
				padding: 10px;
				margin-top: 12px;
				width: 290px;
				height: 27px;
				background: #fff;
				border-radius: 25px;
				border: 3px solid #5AB0DB;
				box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
			}
			
		</style>
    </head>
    <body>
		<div class="divi">
			<h1 class="head">ADD CLERK</h1>
			<form action="adminaddclerk" method="post" style="padding-left:10px;">
				<strong style="font-size: 23px;">USERNAME&nbsp;</strong><input class="username" type="text" name="username" required placeholder="username"><br>
				<strong style="font-size: 23px;">PASSWORD&nbsp;</strong><input class="username"  type="password" name="password" required placeholder="password"><br>
				<strong style="font-size: 23px;">ADRESS&emsp;&emsp;</strong> <input  class="username" type="text" name="address" required placeholder="ADDRESS"><br>
				<strong style="font-size: 23px;">GMAIL&emsp;&emsp;&nbsp;&nbsp;</strong><input  class="username" type="email" name="gmail" required placeholder="gmail"><br>
				<strong style="font-size: 23px;">AGE&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</strong><input  class="username" type="text" name="age" placeholder="age" required onkeypress="return AllowNumbersOnly(event)"><br>
				<strong style="font-size: 23px;">PHONE NO&nbsp;&nbsp;</strong><input  class="username" type="text" name="phoneno" pattern="[7-9]{1}[0-9]{9}" placeholder="phone" onkeypress="return AllowNumbersOnly(event)" required><br>
				<input class="subm" type="submit" value="ADD">
				<%
					String adderror="",color="red";
					session=request.getSession(false);
					adderror=(String)session.getAttribute("adderror");
					if(adderror==null)
					{
						adderror="";
					}
					color=(String)session.getAttribute("clerkcolor");
					session.setAttribute("clerkcolor","red");
					session.setAttribute("adderror",null);
					%>
			</form>
			<form action="adminhome.jsp">
				<input style="float:right;margin-top:-50px;margin-right: 50px;" class="subm" type="submit" value="HOME">
			</form>
				<p style="text-align: center;color:<%=color%>;text-size:26px;"><%=adderror%></p>
		</div>
    </body>
</html>
