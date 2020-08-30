<%@page import="bean.AccountBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.CustomerBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.MyConnection"%>
<%@page import="java.sql.Connection"%>

<%
try{
	response.setContentType("text/html");
	String id=request.getParameter("customer_id");
	String action=(String)session.getAttribute("action");
	Connection conn=MyConnection.getConnection();
	String s="select * from AccountStatus where Customer_Id="+id;
	PreparedStatement pst=conn.prepareStatement(s);
	ResultSet rs=pst.executeQuery();
	ArrayList<AccountBean> a=new ArrayList<AccountBean>();
	while(rs.next())
	{
		AccountBean c=new AccountBean(rs.getString("Customer_Id"),rs.getString("Account_Id"),rs.getInt("Deposit"),rs.getString("Status"),rs.getString("Message"),rs.getString("Account_Type"),rs.getString("Last_Updated"));
		a.add(c);
		//out.println("success");
	}
	if(a.size()==0)
	{
		out.println("No Account");	
	}
	else
	{
		session.setAttribute("account", a);
		if(action.equals("search"))
		{
			request.getRequestDispatcher("viewAccountCashier.jsp").forward(request,response);
		}
		else if(action.equals("update"))
		{
			request.getRequestDispatcher("updateAccount.jsp").forward(request,response);		
		}
		else if(action.equals("delete"))
		{
			request.getRequestDispatcher("deleteAccount.jsp").forward(request,response);
		}
		else if(action.equals("deposit")||action.equals("withdrawl"))
		{
			request.getRequestDispatcher("testCashier.jsp").forward(request,response);
		}
		else if(action.equals("transfer"))
		{
			request.getRequestDispatcher("transfer_viewCashier.jsp").forward(request,response);
		}
	}
}
catch(Exception e)
{
	out.println(e);	
}
%>