
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%
	try{
		response.setContentType("text/html");
		String id = request.getParameter("cust_id");
		//out.println(id);
		String name = request.getParameter("cust_name");
		int age = Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address");
		String state = request.getParameter("t1");
		String city = request.getParameter("t2");
		out.println(id+" "+name+" "+age+" "+address+" "+state+" "+city+" ");
		String s="insert into CustomerStatus values("+id+",Customer_Id_Seq.nextval,?,?,?,?,?,'Active','Customer creation initiated successfully',sysdate)";
		Connection conn=MyConnection.getConnection();
		PreparedStatement pst=conn.prepareStatement(s);
		//pst.setInt(1,id);
		pst.setString(1,name);
		pst.setInt(2,age);
		pst.setString(3,address);
		pst.setString(4,state);
		pst.setString(5, city);
		ResultSet i=pst.executeQuery();
		out.println(i);
		s="select * from CustomerStatus where SSN_Id="+id;
		pst=conn.prepareStatement(s);
		ResultSet rs=pst.executeQuery();
		rs.next();
		if(i!=null)
			
		{	
			request.setAttribute("msg","Customer creation initiated successfully:"+rs.getString("Customer_ID"));
			request.getRequestDispatcher("createCustomer.jsp").forward(request,response);
		}
		
	}
catch(Exception e)
{
	out.println(e);
} %>