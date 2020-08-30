<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="bean.AccountBean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>FedChoice Bank</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script>
function ctck()
{
var sds = document.getElementById("deposit").value;
//alert("Hello");
//alert(sds)
var numlen=/^[0-9]+$/;
if(sds.length!=0 && sds.match(numlen))
	{
	//alert("Ok");
	return true;
	}
else
	{
	return false;
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
      <a href="http://localhost:8081/BankingRetail/searchAccountCashier.jsp?msg=deposit">Deposit</a>
      <a href="http://localhost:8081/BankingRetail/searchAccountCashier.jsp?msg=withdrawl">Withdrawl</a>
      <a href="http://localhost:8081/BankingRetail/searchAccountCashier.jsp?msg=transfer">Transfer</a>
    </div>
  </div>
  <a href="http://localhost:8081/BankingRetail/accountStatement.jsp">Account Statement</a>
<a href="http://localhost:8081/BankingRetail/logout.jsp">Logout</a>
<a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
</div>

</div>
<% AccountBean account=(AccountBean)session.getAttribute("oneaccount"); %>
    <div class="a">
<table cellpadding="0" cellspacing="0" id="content1"><tr>
    <td class="con" valign="top">
    	<div id="heade1">
            <div class="b">
            <form action="withdrawCashier.jsp" method ="post">
                <center><h1>Withdraw Money</h1><br><br>
            <ul>
                <li><p><b>Customer ID : <%=account.getCustomer_Id() %></b><br>
         </p></li>
                <li><p><b>Account ID &nbsp;&ensp;: <%=account.getAccount_id() %></b><br>
         </p></li>
                <li><p><b>Account Type: <%=account.getAccount_type() %></b><br>
         </p></li>
                <li><p><b>Balance &nbsp;&emsp;&emsp;: <%=account.getDeposit() %></b><br>
         </p></li>
                <li><p><b>Withdraw Amount : <input type="text" name="deposit" id="deposit"></b>
                    </p></li>
                    <table><tr><td>
                <input type="submit" class="button" value="Submit" onclick="return ctck()">&nbsp;&nbsp;</td>  
                   <td><input type="submit" class="button" value="Cancel" formaction="cashier.jsp"></center><br></td></tr>
                   </table>
      </ul>
        </form>
        </div>
        </div>
    </td>
</tr></table>
<center>
<%String e=(String)request.getAttribute("errmsg"); 
if(e!=null)
	{%>
		<h3 style="color:red"><%=e %></h3><% 
	}%>
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
      <p><b>Copyright © All rights reserved by <span style="color: #F6D300">FedChoice Bank</span></b></p>
      <div class="connect">
          <b><span style="color: #F6D300">Connect Us</span></b>
      
      <div href="https://www.facebook.com" class="fa fa-facebook"></div>
<div href="https://www.twitter.com" class="fa fa-twitter"></div>
<div href="https://www.google.com" class="fa fa-google"></div>
<div href="https://www.linkedin.com" class="fa fa-linkedin"></div>
      </div></div>


    </div>
</body>
</html>