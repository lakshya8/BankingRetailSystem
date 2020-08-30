<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import=" java.io.PrintWriter" %>
<%@page import=" java.sql.ResultSet" %>
<%@page import=" java.sql.Statement" %>
<%@page import=" java.sql.PreparedStatement" %>
<%@page import=" java.sql.Connection" %>
<%@page import="Conn.MyConnection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
        table
        {
            width: 300px;
            font: 17px Calibri;
            margin-top:15px;
        }
        table, th, td 
        {
            border: solid 1px #000000;
            border-collapse: collapse;
            padding: 2px 3px;
            text-align: center;
        }
         th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #F6D300;;
  color: black;
}
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
<script>
function myFunction() {
	  var x = document.getElementById("myTopnav");
	  if (x.className === "topnav") {
	    x.className += " responsive";
	  } else {
	    x.className = "topnav";
	  }
	}   
function createPDF() {
        var sTable = document.getElementById('tab').innerHTML;

        var style = "<style>";
        style = style + "table {width: 100%;font: 17px Calibri;}";
        style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
        style = style + "padding: 2px 3px;text-align: center;}";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=700,width=700');

        win.document.write('<html><head>');
        win.document.write('<title>Profile</title>');   // <title> FOR PDF HEADER.
        win.document.write(style);          // ADD STYLE INSIDE THE HEAD TAG.
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(sTable);         // THE TABLE CONTENTS INSIDE THE BODY TAG.
        win.document.write('</body></html>');

        win.document.close(); 	// CLOSE THE CURRENT WINDOW.

        win.print();    // PRINT THE CONTENTS.
    }
    var tableToExcel = (function() {
        var uri = 'data:application/vnd.ms-excel;base64,'
          , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
          , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
          , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
        return function(table, name) {
          if (!table.nodeType) table = document.getElementById(table)
          var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
          window.location.href = uri + base64(format(template, ctx))
        }
      })()
</script>
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
<form>
<center>
<fieldset>
  <legend align="center">VIEW TRANSACTIONS</legend>
	
	<div id="tab">
	
  <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" align="center">
         
       <tr> <th> Account_ID</th><th> TRANSACTION_ID</th>
            <th> DESCRIPTION </th>
            <th>AMOUNT </th>
             <th>DATE </th>
        </tr>
  
   <%
            try
            {
            	response.setContentType("text/html");
                 String s= request.getParameter("account_id");
                 String num= request.getParameter("number");
            	 //String std= request.getParameter("r1");
            	 //String end= request.getParameter("r2");
            	 String stdat= request.getParameter("r1");
            	 String endat=request.getParameter("r2");
            	// out.println(d);
            	 //out.println(e);
            	 //out.println(s);
            	 //out.println(num);
            	// out.println(std);
            	 //out.println(end);
            	 //out.println(stdat);
            	 //out.println(endat);
                if(num!=null && stdat==null && endat==null)
                {
                	//out.println("Hello");
                 Connection conn= MyConnection.getConnection();
                 Statement st=conn.createStatement();
                 String sql="SELECT * from transaction where Account_Id="+s+" and ROWNUM <= "+num ;  
                 ResultSet rs = st.executeQuery(sql);
                 SimpleDateFormat formatert=new SimpleDateFormat("dd-MM-yyyy");
                while( rs.next())
                {
                	String sp=rs.getString("Transaction_Date");
                	sp=sp.split(" ")[0];
                	//out.println(sp);
                	//Date d=formatert.parse(sp);
                	//String rg=formatert.format(d);
                    %>
         
        
       <tr> <td> <%=rs.getString("Account_Id") %></td><td> <%=rs.getString("Transaction_Id") %></td>
       <td> <%=rs.getString("Description") %></td>
       <td><%=rs.getString("Amount") %></td>
       <td><%=sp %></td>
        </tr>
                    <%
                }
                }
               
                
                else
                {
                	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
               	 Date date=formatter.parse(stdat);
               	 SimpleDateFormat formatert=new SimpleDateFormat("dd-MMMM-yyyy");
               	 String d=formatert.format(date);
               	 date=formatter.parse(endat);
               	 String e=formatert.format(date);
                    Connection conn= MyConnection.getConnection();
                    Statement st= conn.createStatement();
                    String sql="SELECT * from transaction where Account_Id= "+s+" and Transaction_Date Between '"+d+"' and '"+e+"'";
                   // out.println(sql);
                    //PreparedStatement st=conn.prepareStatement(sql);
                    //st.setString(1,s);
                    //st.setString(1,stdat);
                    //st.setString(1,endat);
                    ResultSet rs = st.executeQuery(sql);
                   
                   while( rs.next())
                   {
                	   String sp=rs.getString("Transaction_Date");
                   	sp=sp.split(" ")[0];
                       %>
            
           
          <tr> <td> <%=rs.getString("Account_Id") %></td><td> <%=rs.getString("Transaction_Id") %></td>
          <td> <%=rs.getString("Description") %></td>
          <td><%=rs.getString("Amount") %></td>
          <td><%=sp %></td>
           </tr>
                       <%
                   }
                }
            }
            catch(Exception e)
            {
                out.println(e.getMessage());
            }
            %>
            
 </table>
 </div>
  
  
</fieldset>
<input type="submit" value="Back" formaction="cashier.jsp" style="padding:4px;background-color:black;color:yellow;margin-top:15px;width:60px">
</center>
</form>
<p align="center" style="margin-top:30px">
        <input type="button" value="Create PDF" 
            id="btPrint" onclick="createPDF()" style="padding:4px;background-color:black;color:yellow" />
            <input type="button" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel" style="padding:4px;background-color:black;color:yellow" >
    </p>
    <div class="about" style="margin-top:90px">
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
  <div class="footer" style="bottom:0">
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
  