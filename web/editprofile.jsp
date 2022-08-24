<%-- 
    Document   : signup
    Created on : Apr 12, 2018, 11:17:44 AM
    Author     : yoendra
--%>
<%@page import="book.customer"%>
<%@page import="customermethods.customermethods"%>
<%
	HttpServletResponse httpResponse = (HttpServletResponse)response;
	httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	httpResponse.setHeader("Pragma","no-cache");
	httpResponse.setDateHeader ("Expires", 0);
	session =request.getSession(false);
	if(session.getAttribute("loginadmin")!=null)
	{
		response.sendRedirect("adminhome.jsp");
	}
	else if(session.getAttribute("loginclerk")!=null)
	{
		response.sendRedirect("clerkhome.jsp");
	}
	else if(session.getAttribute("loginactive")==null)
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
	
	<%
				customermethods c=new customermethods();
				customer obj=c.customerobject((String)session.getAttribute("loginactive"));
				String name="",gmail="",phoneno="",userid="";
				if(obj!=null)
				{
					name=obj.getfullname();gmail=obj.getgmail();phoneno=obj.getphoneno();userid=obj.getname();
				}
				
				String editerror="",color="red";
				session=request.getSession(false);
				editerror=(String)session.getAttribute("editerror");
				if(editerror==null)
				{
					editerror="";
				}
				color=(String)session.getAttribute("color");
				session.setAttribute("color","red");
				session.setAttribute("editerror",null);
					%>
		<div class="divi">
			<h1 class="head">EDIT PROFILE</h1>
			<form action="editprofile" method="post" style="padding-left:10px;">
				<strong style="font-size: 23px;">USERNAME&nbsp;</strong><input class="username" value="<%=name%>" type="text" name="username" readonly><br>
				<strong style="font-size: 23px;">PASSWORD&nbsp;</strong><input class="username"  type="password" name="password" required placeholder="password"><br>
				<strong style="font-size: 23px;">FULLNAME&nbsp;</strong><input  class="username" type="text" name="fullname" required placeholder="fullname"><br>
				<strong style="font-size: 23px;">GMAIL&emsp;&emsp;&nbsp;&nbsp;</strong><input  class="username" type="email" name="gmail" required placeholder="gmail"><br>
				<strong style="font-size: 23px;">AGE&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</strong><input  class="username" type="text" name="age" placeholder="age" required onkeypress="return AllowNumbersOnly(event)"><br>
				<strong style="font-size: 23px;">PHONE NO&nbsp;&nbsp;</strong><input  class="username" type="text" name="phoneno" pattern="[7-9]{1}[0-9]{9}" placeholder="phone" onkeypress="return AllowNumbersOnly(event)" required><br>
				<input class="subm" type="submit" value="UPDATE">
			</form>
			<form action="customerhome.jsp">
				<input style="float:right;margin-top:-50px;margin-right: 40px;" class="subm" type="submit" value="HOME">
			</form>
				<p style="text-align: center;color:<%=color%>;text-size:26px;"><%=editerror%></p>
		</div>
    </body>
</html>
