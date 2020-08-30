<html>
<head>
<script>
function check()
{
username=document.getElementById("username").value;
password=document.getElementById("password").value;
var letterNumber = /^[0-9a-zA-Z]+$/;
var decimal1=/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{10,20}$/;
if(username.length>=8 && password.length>=10 && username.match(letterNumber) && password.match(decimal1))
{
	//alert(r.test(password));
return true;
}
else
	{
	alert("Please Enter in correct format");
	return false;
	}
}
</script>
</head>
<body>
<center>
<div style="background-color:grey;width:40%;height:50%;">
<div style="color:black;background-color:brown;">
<h2>Login</h2>
</div>
<div style="padding:50">
<table>
<form method="post" action="validate.jsp" onsubmit=" return check()">
<tr><td>
<b>Username:</b><br><br></td><td><input type="text" name="username" id="username" placeholder="Username" required><br><br></td></tr>
<tr><td><b>Password:<br><br></b></td><td><input type="password" name="password" id="password" placeholder="Password..." required><br><br></td></tr>
<tr ><td colspan="2" align="center"><input type="hidden" name="action" value="login"><input type="submit" name="Submit" value="Login"></td></tr>
</form>
</table>
</div>
<%String e=(String)request.getAttribute("errmsg"); 
if(e!=null)
	{%>
		<h3 style="color:red"><%=e %></h3><% 
	}%>
	
</div>
</center>
</body>
</html>