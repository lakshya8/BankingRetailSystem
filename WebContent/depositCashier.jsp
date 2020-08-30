<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Conn.MyConnection"%>
<%@page import="bean.AccountBean"%>
<% 
response.setContentType("text/html");
AccountBean account=(AccountBean)session.getAttribute("oneaccount");
int deposit=Integer.parseInt(request.getParameter("deposit"));
//out.println(accountid);
//out.println(deposit);
Connection conn=MyConnection.getConnection();
try
{
	String s="select * from AccountStatus where Account_Id="+account.getAccount_id();
	PreparedStatement pst=conn.prepareStatement(s);
	//pst.setInt(1, accountid);
	ResultSet rs=pst.executeQuery();
	rs.next();
	out.println("Hello:"+rs.getInt("Deposit"));
	int balance=rs.getInt("Deposit");
	int new_deposit=balance+deposit;
	out.println("Hello:"+rs.getInt("Deposit"));
	//deposit+=balance;
	s="update AccountStatus set Deposit=? where Account_Id="+account.getAccount_id();
	pst=conn.prepareStatement(s);
	pst.setInt(1, new_deposit);
//	pst.setInt(2, accountid);
	int i=pst.executeUpdate();
	s="insert into transaction values(Transaction_Id_Seq.nextval,"+account.getAccount_id()+",sysdate,'Deposit',?)";
	pst=conn.prepareStatement(s);
	//pst.setInt(1, accountid);
	pst.setInt(1, deposit);
	rs=pst.executeQuery();
	if(i!=0)
	{
		request.setAttribute("errmsg", "Deposit Successful");
		request.getRequestDispatcher("cashier.jsp").forward(request,response);
	}
	else
	{
		request.setAttribute("errmsg", "Deposit Failed");
		request.getRequestDispatcher("cashier.jsp").forward(request,response);
	}
}
catch(Exception e)
{
	
}

%>