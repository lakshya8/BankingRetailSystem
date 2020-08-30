<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="Conn.MyConnection"%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
out.println(username);
out.println(password);
Connection conn=MyConnection.getConnection();
response.setContentType("text/html");
PrintWriter pr=response.getWriter();
try{
	out.println("hello");
String sql="select * from userstore where username=? and password=?";
PreparedStatement pst=conn.prepareStatement(sql);
pst.setString(1,username);
pst.setString(2,password);
ResultSet rs=pst.executeQuery();
//out.println(rs.next());
if(rs.next())
{
	out.println("resplon");
	//request.getRequestDispatcher("executive.jsp");
	if(rs.getString("type").equals("executive"))
	{
		session.setAttribute("type", "executive");
		request.getRequestDispatcher("executive.jsp").forward(request,response);
	}
	else
	{
		session.setAttribute("type", "cashier");
		request.getRequestDispatcher("cashier.jsp").forward(request,response);
		
	}
}
else
{
	request.setAttribute("errmsg", "Please Enter Correct Details");
	request.getRequestDispatcher("index.jsp").forward(request,response);
}
}
catch(Exception e)
{
	out.println(e);
}
%>