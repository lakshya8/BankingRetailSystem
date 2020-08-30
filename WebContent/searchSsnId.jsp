<%@page import="bean.CustomerBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.MyConnection"%>
<%@page import="java.sql.Connection"%>

<%
try{
	response.setContentType("text/html");
	String id=request.getParameter("ssn_id");
	out.println(id);
	String action=(String)session.getAttribute("action");
	Connection conn=MyConnection.getConnection();
	String s="select * from CustomerStatus where SSN_Id="+id;
	PreparedStatement pst=conn.prepareStatement(s);
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	{
		CustomerBean c=new CustomerBean(rs.getString("SSN_ID"),rs.getString("Status"),rs.getString("Message"),rs.getString("Last_Updated"),rs.getString("Customer_Name"),rs.getString("Address"),rs.getString("State"),rs.getString("City"),rs.getString("Customer_Id"),rs.getInt("Age"));
		session.setAttribute("customer", c);
		if(action.equals("search"))
		{
			request.getRequestDispatcher("viewCustomer.jsp").forward(request,response);
		}
		else if(action.equals("update"))
		{
			request.getRequestDispatcher("updateCustomer.jsp").forward(request,response);		
		}
		else if(action.equals("delete"))
		{
			request.getRequestDispatcher("deleteCustomer.jsp").forward(request,response);
		}
	}
}
catch(Exception e)
{
	out.println(e);	
}
%>