<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<%
session.setAttribute("action", request.getParameter("msg"));
%>
<script>
function validate()
{
	customer_id=document.getElementById("customer_id").value;
	account_id=document.getElementById("account_id").value;
	if(customer_id.length==0 && account_id.length==0)
	{
	alert("Enter Details");
	return false;
	}
	if(customer_id.length==9 && account_id.length==9)
		{
		alert("Write only one details");
		return false;
		}
	if(customer_id.length==0)
		{
		if(account_id.length!=9)
			{
			alert("Please Enter Correct Account ID");
			return false;
			}
		else
			{
			document.getElementById("action").value="account";
			//alert(document.getElementById("action"));
			return true;
			}
		}
	if(account_id.length==0)
	{
	if(customer_id.length!=9)
		{
		alert("Please Enter Correct Customer Id");
		return false;
		}
	else
		{
		document.getElementById("action").value="customer";
		//alert(document.getElementById("action"));
		return true;
		}
	}

}
function myFunction() {
	  var x = document.getElementById("myTopnav");
	  if (x.className === "topnav") {
	    x.className += " responsive";
	  } else {
	    x.className = "topnav";
	  }
	}
</script>
<style>
body {margin:0;font-family:Arial}

.topnav {
overflow: hidden;
background:#F6D300;
margin-left:60px;
margin-right:80px;
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

.active {
background-color: #4CAF50;
color: white;
}

.topnav .icon {
display: none;
}

.dropdown {
float: left;
overflow: hidden;
}

.dropdown .dropbtn {
font-size: 17px;    
border: none;
outline: none;
color: black;
padding: 14px 16px;
background-color: inherit;
font-family: inherit;
margin: 0;
}

.dropdown-content {
display: none;
position: absolute;
background-color: #f9f9f9;
min-width: 160px;
box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
z-index: 1;
}

.dropdown-content a {
float: none;
color: black;
padding: 12px 16px;
text-decoration: none;
display: block;
text-align: left;
}

.topnav a:hover, .dropdown:hover .dropbtn {
background-color: #555;
color: white;
}

.dropdown-content a:hover {
background-color: #ddd;
color: black;
}

.dropdown:hover .dropdown-content {
display: block;
}

@media screen and (max-width: 600px) {
.topnav a:not(:first-child), .dropdown .dropbtn {
  display: none;
}
.topnav a.icon {
  float: right;
  display: block;
}
}

@media screen and (max-width: 600px) {
.topnav.responsive {position: relative;}
.topnav.responsive .icon {
  position: absolute;
  right: 0;
  top: 0;
}
.topnav.responsive a {
  float: none;
  display: block;
  text-align: left;
}
.topnav.responsive .dropdown {float: none;}
.topnav.responsive .dropdown-content {position: relative;}
.topnav.responsive .dropdown .dropbtn {
  display: block;
  width: 100%;
  text-align: left;
}
}
</style>
</head>
<body>
<div id="header">
  <h1>FedChoice <span style="color:#FFFFFF">Bank</span></h1>	

</div>
<div id="nav_box">
<div class="topnav" id="myTopnav">
<a href="http://localhost:8081/BankingRetail/cashier.jsp">Home</a>
  <a href="http://localhost:8081/BankingRetail/searchAccountCashier.jsp?msg=search">Account Details</a>
    <div class="dropdown">
     <button class="dropbtn">Account Operation 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8081/BankingRetail/searchAccount.jsp?msg=deposit">Deposit</a>
      <a href="http://localhost:8081/BankingRetail/searchAccount.jsp?msg=withdrawl">Withdrawl</a>
      <a href="http://localhost:8081/BankingRetail/searchAccount.jsp?msg=transfer">Transfer</a>
    </div>
  </div>
  <a href="http://localhost:8081/BankingRetail/accountStatement.jsp">Account Statement</a>
<a href="http://localhost:8081/BankingRetail/logout.jsp">Logout</a>
<a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
</div>

</div>
<center>
<div style="padding:10px 0px;width:42%;margin-bottom:20px;margin-top:20px"">
<form method="post" action="search_AccountCashier.jsp">
<table>
<tr>
<td>Enter Account ID:<br><br></td>
<input type="hidden" name="action" id="action">
<td>
<input type="text" name="account_id" id="account_id"><br><br></td>
</tr>
<tr><td colspan="2" align="center">Or<br><br><td></td></tr>
<tr>
<td>Enter Customer ID:<br><br></td>
<td><input type="text" name="customer_id" id="customer_id"><br><br></td>
</tr>
<tr><td align="center"><input type="submit" value="Submit" onclick="return validate()" style="padding:4px;background-color:black;color:yellow;"><br><br></td>
<td align="center"><input type="submit" value="Back" formaction="executive.jsp" style="padding:4px;background-color:black;color:yellow;"><br><br></td></tr>
</table>
</form>
</div>
</center>
<div class="about">
        <table style="width:100%; background:#000; left-margin:50px auto;t"><tr align="justify">
	<td width="50%" valign="top" style="border-right:none;">
            <div id="aboutus"><h1><span style="color: #F6D300">About Us</span></h1><br>
            <p>FedChoice Bank was founded on 14th June 2016 with the objective of providing with the detail services based on Retail Banking operations. The Retail Internet Banking of 
        FedChoice Bank offers a plethora of products and services, to cater its customers by providing certain animus services with an easy volving offers and ways to do the required 
        job without hurdling the process.</p>
        </div>	
       </div>
	</td>
    
    <td width="25%" valign="top">
        <div id="services" style="border-right:none;"><h1><span style="color: #F6D300">Services</span></h1><br>
            <p>Retail and Customer Banking<br>Personal Internet Banking<br>Corporate Banking<br>Debit and Credit Cards </p>
	    	
	    </div>      
    </td>
    <td width="25%" valign="top">
        <div id="contact"><h1><span style="color: #F6D300">Contact Us</span></h1><br>
        <p>Email - customer.services@fedchoice.com<br>Contact No -022-42406778,022-54567890<br>Address: Corporate Office, Madame Cama Road, Nariman Point, Mumbai, Maharashtra 400021</p>
      </div>	
     </td>
</tr></table>
<div class="footer">
	<div class="copyright1">
      <p><b>Copyright © All rights reserved by <span style="color: #F6D300">FedChoice Bank</span></b></p>
      </div>
      <div class="copyright2">
          <b><span style="color: #F6D300">Connect Us</span></b>
      
      <div href="https://www.facebook.com" class="fa fa-facebook"></div>
<div href="https://www.twitter.com" class="fa fa-twitter"></div>
<div href="https://www.google.com" class="fa fa-google"></div>
<div href="https://www.linkedin.com" class="fa fa-linkedin"></div>
      </div>
      <div class="clear"></div>
      </div>
<div class="drop_home" id="drop_home_id"></div>
</body>
</html>