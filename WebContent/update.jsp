<%@page import="bean.CustomerBean"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="Conn.MyConnection" %>

<%
response.setContentType("text/html");
String customer=request.getParameter("customerName");
String address=request.getParameter("address");
int age=Integer.parseInt(request.getParameter("age"));
CustomerBean cr=(CustomerBean)session.getAttribute("customer");
String customerid=cr.getCustomerId();
out.println(customer);
out.println(address);
out.println(age);
out.println(customerid);
Connection conn=MyConnection.getConnection();
response.setContentType("text/html");
PrintWriter pr=response.getWriter();
try{
	String sql="update CustomerStatus set Customer_Name=? , Address=? , Age=? , Message='Customer update initiated successfully', Last_Updated=sysdate where Customer_Id="+customerid;
	PreparedStatement pst=conn.prepareStatement(sql);
	pst.setString(1,customer);
	pst.setString(2,address);
	pst.setInt(3,age);
	int i=pst.executeUpdate();
	
	if(i!=0)
	{
		out.println("<h1>Customer update initiated Successfully</h1>");
	}
	else
	{
		out.println("<h1>Customer update Failed</h1>");
	}
	
}

catch(Exception e){
	out.println("Error: "+e);	
}
%>