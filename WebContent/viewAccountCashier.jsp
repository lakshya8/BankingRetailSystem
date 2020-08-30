<%@page import="bean.AccountBean"%>
<%@page import="java.util.ArrayList"%>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<head>
<%ArrayList<AccountBean> a=(ArrayList<AccountBean>)session.getAttribute("account");%>
<script>
function validate()
{
	alert(document.getElementById("acc").value);
	document.getElementById("tb").style.visibility="visible";
	document.getElementById("id"+document.getElementById("acc").value).style.visibility="visible";
	document.getElementById("id"+document.getElementById("acc").value).style.visibility="visible";
	
}
function myFunctio() {
	//String p=request.getParameter('Customer_Id');
	id=document.getElementById("acc").value
	//alert(id);
	var xmlhttp;   
	//if (str=="")
	  //{
	  //document.getElementById("txtHint").innerHTML="";
	  //return;
	  //}
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
		  document.getElementById("title").style.visibility="visible";
		  //alert("demo"+id);
	    document.getElementById("demo").innerHTML=xmlhttp.responseText;
	    }
	  }
	xmlhttp.open("GET","show.jsp?id="+id,true);
	xmlhttp.send();

	
	
 // document.getElementById("demo").innerHTML=id;
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
<div align="center" style="padding:10px 0px;width:42%;margin-bottom:20px;margin-top:20px">
<select name="acc" id="acc" onchange="myFunctio()" style="padding:2px;margin-top:8px">
<option value="" disabled selected>Choose Account</option>
<%for(int i=0;i<a.size();i++)
{%>

	<option value=<%=i%>><%=a.get(i).getAccount_id() %></option>
	
<%}%>
</select>
<br><br>
</div>
</center>
<br><br><h2 align="center" id="title" style="visibility:hidden">Customer Details</h2><br><br>
<div align="center" id="demo"></div>
<form>
<br><br>
<center>
<input type="submit" value="Back" formaction="cashier.jsp" style="padding:4px;background-color:black;color:yellow;width:10%">
</center>
</form>
<div class="about">
        <table style="width:100%; background:#000; left-margin:50px auto;t"><tr align="justify">
	<td width="50%" valign="top" style="border-right:none;">
            <div id="aboutus"><h1><span style="color: #F6D300">About Us</span></h1><br>
            <p>FedChoice Bank was founded on 14th June 2016 with the objective of providing with the detail services based on Retail Banking operations. The Retail Internet Banking of 
        FedChoice Bank offers a plethora of products and services, to cater its customers by providing certain animus services with an easy volving offers and ways to do the required 
        job without hurdling the process.</p>
        </div>	
	</td>
    <td width="25%" valign="top">
        <div id="services" style="border-right:none;"><h1><span style="color: #F6D300">Services</span></h1><br>
            <p>Retail and Customer Banking<br>Personal Internet Banking<br>Corporate Banking<br>Debit and Credit Cards </p>
	    	
	    </div>      
    </td>
    <td width="25%" valign="top">
        <div id="contact"><h1><span style="color: #F6D300">Contact Us</span></h1><br>
        <p>Email-customer.services@fedchoice.com<br>Contact No -022-42406778,022-54567890<br>Address: Corporate Office, Madame Cama Road, Nariman Point, Mumbai, Maharashtra 400021</p>
      </div>	
     </td>
</tr></table>
</div>
<div class="footer">
	<div class="copyright1">
      <p><b>Copyright � All rights reserved by <span style="color: #F6D300">FedChoice Bank</span></b></p>
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