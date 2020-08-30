<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.CustomerBean"%>
<%
try
{
	response.setContentType("text/html");
	CustomerBean customer=(CustomerBean)session.getAttribute("customer");
	Connection conn=MyConnection.getConnection();
	String s="select * from CustomerStatus where Customer_id="+customer.getCustomerId();
	PreparedStatement pst=conn.prepareStatement(s);
	ResultSet rs=pst.executeQuery();
	rs.next();
	if(rs.getString("Status").equals("Inactive"))
	{
		request.setAttribute("msg","Account already deleted");
		request.getRequestDispatcher("deleteCustomer.jsp").forward(request,response);
	}
	s="update AccountStatus set Status='Inactive',Message='Account deletion initiated successfully',Last_Updated=sysdate where Customer_id="+customer.getCustomerId();
	pst=conn.prepareStatement(s);
	int i=pst.executeUpdate();
	s="update CustomerStatus set Status='Inactive',Message='Customer deletion initiated successfully',Last_Updated=sysdate where Customer_id="+customer.getCustomerId();
	pst=conn.prepareStatement(s);
	i=pst.executeUpdate();
	if(i==0)
	{
		request.setAttribute("msg","Customer deletion initiate failed!!!");
		request.getRequestDispatcher("deleteCustomer.jsp").forward(request,response);
	}
	else
	{
		request.setAttribute("msg","Customer deletion initiated successfully");
		request.getRequestDispatcher("deleteCustomer.jsp").forward(request,response);
	}
}
catch(Exception e)
{
	
}
%>